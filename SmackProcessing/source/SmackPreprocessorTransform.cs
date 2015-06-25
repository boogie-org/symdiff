using Microsoft.Boogie;
using ProgTransformation;
using System;
using System.Collections.Generic;
using System.Diagnostics;

namespace SmackProcessing.source
{
    class SmackPreprocessorTransform  : TransformationPass 
    {
        protected override Program runPass(Program inp)
        {
            new BoogieCallsVisitor().VisitProgram(inp);
            new SourceInfoProcessor().VisitProgram(inp);
            new SplitBlockAcrossAssertsRewriter().VisitProgram(inp);
            return inp;
        }
    }

    class DummyVisitor : FixedVisitor
    {
        public override Cmd VisitAssertCmd(AssertCmd node)
        {
            node.Expr = Expr.False; 
            return base.VisitAssertCmd(node);
        }
    }

    class BoogieCallsVisitor : FixedVisitor
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

    class SourceInfoProcessor : FixedVisitor
    {
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
            fn.Add(list[0]);
            var lineno = new List<object>();
            lineno.Add(list[1]);
            var assert = new AssertCmd(Token.NoToken, Expr.True,
                new QKeyValue(Token.NoToken, "sourcefile", fn,
                new QKeyValue(Token.NoToken, "sourceline", lineno, null)));
            return assert;
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
                if (!SDiff.Util.IsSourceInfoAssertCmd(cmd))
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
                nxtBlock = new Block();
                nxtBlock.Cmds = new List<Cmd>() { cmd };
                nxtBlock.Label = b.Label + "_splitSourceLine_" + splitBlocks.Count;
                currBlock.TransferCmd = new GotoCmd(Token.NoToken, new List<Block>() { nxtBlock });
                splitBlocks.Add(nxtBlock);
                currBlock = nxtBlock;
            }
            if (nxtBlock != null)
                nxtBlock.TransferCmd = transfer;
            return splitBlocks;
        }

    }

}  
