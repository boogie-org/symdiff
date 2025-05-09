using Microsoft.Boogie;
using ProgTransformation;
using SymDiffUtils;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using Util = SymDiffUtils.Util;

namespace SymdiffPreprocess
{
    public class SmackPreprocessorTransform  : TransformationPass
    {
        private string relativeDir;

        public SmackPreprocessorTransform(string relativeDir)
        {            
            this.relativeDir = relativeDir;
        }
        protected override Program runPass(Program inp)
        {
            new BoogieCallsRewriter().VisitProgram(inp);
            new SourceInfoRewriter(relativeDir).VisitProgram(inp);
            new ArrayAccessRewriter().Visit(inp);
            new SplitBlockAcrossAssertsRewriter().VisitProgram(inp);
            new PruneQuantifiedSpecsOfSelectProcedures().VisitProgram(inp);
            //TODO: Remove prune visitor calls
            //new PruneCallsVisitor().VisitProgram(inp);
            return inp;
        }
    }

    class BoogieCallsRewriter : FixedVisitor
    {
        public override List<Cmd> VisitCmdSeq(List<Cmd> cmdSeq)
        {
            List<Cmd> newSeq = new List<Cmd>();
            foreach (var cmd in cmdSeq)
            {
                if (cmd is CallCmd)
                {
                    var call = cmd as CallCmd;
                    if (call.Attributes != null && call.Attributes.Key.Equals("cexpr"))
                    {
                        Debug.Assert(call.callee.StartsWith("boogie"));
                        continue;
                    }
                }
                newSeq.Add(cmd);
            }
            cmdSeq.Clear();
            cmdSeq.AddRange(newSeq);
            return base.VisitCmdSeq(cmdSeq);
        }
    }    

    class SourceInfoRewriter : FixedVisitor
    {
        private string relativeDir;

        public SourceInfoRewriter(string relativeDir)
        {
            this.relativeDir = relativeDir;
        }
        public override List<Cmd> VisitCmdSeq(List<Cmd> cmdSeq)
        {
            List<Cmd> newSeq = new List<Cmd>();
            foreach (var cmd in cmdSeq)
            {
                if (cmd is AssumeCmd)
                {
                    var assume = cmd as AssumeCmd;
                    if (assume.Attributes != null && assume.Attributes.Key.Equals("sourceloc"))
                    {
                        newSeq.Add(makeHavocStyleSourceInfo(assume.Attributes.Params));
                        continue;
                    }
                }
                newSeq.Add(cmd);
            }
            cmdSeq.Clear();
            cmdSeq.AddRange(newSeq);
            return base.VisitCmdSeq(cmdSeq);
        }
        
        private AssertCmd makeHavocStyleSourceInfo(IList<object> list)
        {
            var fn = new List<object>();
            var newFn = this.relativeDir + unifyPrefix((string)list[0]);
            if (File.Exists(newFn))
            {
                fn.Add(newFn);
            }
            else
            {
                newFn = this.relativeDir + trimDirectoryPrefix((string)list[0]);
                if (File.Exists(newFn))
                {
                    fn.Add(newFn);
                }
                else
                {
                    Console.WriteLine("[ERROR] Preprocessing. Cannot Map File to name using curent heuristics.");
                }
            }
            var lineno = new List<object>();
            lineno.Add(list[1]);
            var assert = new AssertCmd(Token.NoToken, Expr.True,
                new QKeyValue(Token.NoToken, "sourcefile", fn,
                new QKeyValue(Token.NoToken, "sourceline", lineno, null)));
            return assert;
        }

        private string unifyPrefix(string p)
        {
            if (p.Contains("smack"))
            {
                return trimDirectoryPrefix(p);
            }
            else
            {
                return p.Replace('/', '.').Replace('\\', '.');
            }
        }

        private static string trimDirectoryPrefix(string p)
        {
            int i = p.LastIndexOf('/');
            p = p.Substring(i < 0 ? 0 : i);
            i = p.LastIndexOf('\\');
            p = p.Substring(i < 0 ? 0 : i);
            return p;
        }
    }

    class SplitBlockAcrossAssertsRewriter : FixedVisitor
    {
        public override Implementation VisitImplementation(Implementation node)
        {
            var blocks = node.Blocks;
            var newBlocks = new List<Block>(); 

            foreach(var b in blocks)
            {
                List<Block> splitBlocks = SplitBlockAcrossAsserts(b);
                newBlocks.AddRange(splitBlocks);
            }
            //Setting the Blocks does not help persist the change, have to create a new implementation
            //node.Blocks.Clear(); node.Blocks.AddRange(newBlocks);
            //if (node.OriginalBlocks != null) { node.OriginalBlocks.Clear(); node.OriginalBlocks.AddRange(newBlocks); }
            var nimpl = new Implementation(node.tok, node.Name, node.TypeParameters, node.InParams, node.OutParams, node.LocVars, newBlocks);
            return base.VisitImplementation(nimpl);
        }

        private List<Block> SplitBlockAcrossAsserts(Block b)
        {
            var cmds = b.Cmds;
            var transfer = b.TransferCmd;

            var currBlock = b;
            b.Cmds = new List<Cmd>(); //clear the cmds
            Block nxtBlock = null;

            var splitBlocks = new List<Block>();
            splitBlocks.Add(b); //b is the first block in this set

            bool firstSourceInfoAssert = false; 
            foreach(var cmd in cmds)
            {
                if (!Util.IsSourceInfoAssertOrAssumeCmd(cmd))
                {
                    currBlock.Cmds.Add(cmd);
                    continue;
                }
                //dont split the block before the first sourceline assert cmd
                if (!firstSourceInfoAssert) 
                {
                    currBlock.Cmds.Add(cmd);
                    firstSourceInfoAssert = true;
                    continue;
                }
                //start a new block when you see an Assert Cmd with sourceline
                nxtBlock = new Block(
                    Token.NoToken,
                    b.Label + "_splitSourceLine_" + splitBlocks.Count, 
                    new List<Cmd>() { cmd },
                    new GotoCmd(Token.NoToken, new List<Block>() { nxtBlock }));
                splitBlocks.Add(nxtBlock);
                currBlock = nxtBlock;
            }
            if (nxtBlock != null)
                nxtBlock.TransferCmd = transfer;
            return splitBlocks;
        }

    }

    class ArrayAccessRewriter : FixedVisitor
    {
        //TODO: review conditions for multiple assignments to the same array, e.g., M[i], M[j] := x, y;
        // This transformation will not work in that case(maybe)?
        public override Block VisitBlock(Block node)
        {
            foreach (Cmd cmd in node.Cmds)
            {
                if (cmd is AssignCmd)
                {                    
                    var assign = cmd as AssignCmd;
                    List<AssignLhs> newLhs = new List<AssignLhs>();
                    List<Expr> newRhs = new List<Expr>();
                    for (int i = 0; i < assign.Lhss.Count; i++)
                    {
                        var lhsi = assign.Lhss[i].AsExpr as NAryExpr;
                        if (lhsi != null && lhsi.Fun is MapSelect)
                        {
                            var rhsi = assign.Rhss[i];
                            Debug.Assert(lhsi.Args.Count.Equals(2));
                            var index = lhsi.Args[1];
                            var arr = lhsi.Args[0];
                            Debug.Assert(arr is IdentifierExpr);
                            var newLhsi = new SimpleAssignLhs(Token.NoToken, arr as IdentifierExpr);
                            var newRhsi = new NAryExpr(Token.NoToken, new MapStore(Token.NoToken, 1), new List<Expr>() { arr, index, rhsi });
                            newLhs.Add(newLhsi);
                            newRhs.Add(newRhsi);
                        }
                        else
                        {
                            newLhs.Add(assign.Lhss[i]);
                            newRhs.Add(assign.Rhss[i]);
                        }
                        
                    }
                    assign.Rhss = newRhs;
                    assign.Lhss = newLhs;
                }
                
            }
            return base.VisitBlock(node);
        }
    }
    class PruneCallsVisitor : FixedVisitor
    {
        ISet<string> callsToPrune = new HashSet<string>() { "printf.ref.i32.float" };
        public override List<Cmd> VisitCmdSeq(List<Cmd> cmdSeq)
        {
            List<Cmd> newSeq = new List<Cmd>();
            foreach (var cmd in cmdSeq)
            {
                if (cmd is CallCmd)
                {
                    var call = cmd as CallCmd;
                    if (callsToPrune.Contains(call.callee))
                    {
                        continue;
                    }
                }
                newSeq.Add(cmd);
            }
            cmdSeq.Clear();
            cmdSeq.AddRange(newSeq);
            return base.VisitCmdSeq(cmdSeq);
        }
    }

    /// <summary>
    /// Removing quantified specs of certain procedures that lead to variable capture while 
    /// inlining (e.g. alloc has a spec with (b ==> foral a. ...), where a can conflict wiht a local/parameter
    /// </summary>
    class PruneQuantifiedSpecsOfSelectProcedures : FixedVisitor
    {
        ISet<string> procedures = new HashSet<string>() { "$alloc", "$free" };
        public override Procedure VisitProcedure(Procedure node)
        {
            if (!procedures.Contains(node.Name)) return base.VisitProcedure(node);
            node.Requires = new List<Requires>();
            node.Ensures = new List<Ensures>();
            return base.VisitProcedure(node);
        }

    }

}  
