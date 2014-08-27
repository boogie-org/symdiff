using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Boogie;


//TODO: Keep this as decoupled as possible from Dependency, eventually move to Corral

namespace Dependency
{
    public static class SplitConsts
    {
        public const string mallocString = "malloc";
        public const string allocatorAttr = "allocator";
        public const string aliasQueryAttr = "aliasingQuery";
        public const string allocSiteStr = "allocationsites";
        public const string allocSiteFnName= "allocSiteFn";
        public const string allocAssumeAttr = "allocSiteAssume";
        public const string allocInstrumentedFileExtention = ".mapLookupAssumes.bpl";
    }

    public class SplitHeapUsingAliasAnalysis
    {
        Program prog;
        string filename;
        public SplitHeapUsingAliasAnalysis(Program prog, string filename) { this.prog = prog; this.filename = filename; }

        public Program Run()
        {
            //add allocation site info and assumes
            var asi = new AllocationSiteInstrumentation(prog, filename);
            var instrFilename = asi.PerformAllocationSiteInstrumentation();

            //run alias analysis and dump the split program
            string prunedFilename; //the file where the output of alias analysis is generated
            RunAliasAnalysis(instrFilename, out prunedFilename);

            //massage the output of alias analysis (new program)
            var saAA = new SplitHeapHelper(prunedFilename);
            return saAA.Run();
        }

        private void RunAliasAnalysis(string instrFilename, out string prunedFilename)
        {
            //AliasAnalysis.exe f8.bpl /prune:out.bpl
            prunedFilename = filename + ".aliasanalysis.bpl";
            string args = string.Format(" {0} /prune:{1} ", instrFilename, prunedFilename);
            //TODO: make the path relative
            Utils.ExecuteBinary(@"d:\corral-codeplex\corral\addons\aliasAnalysis\aliasAnalysis\bin\debug\AliasAnalysis.exe", args);
        }

        /// <summary>
        /// Adds {:allocator} attribute to malloc-like procedure
        /// Adds function {:aliasingQuery "allocationsites"} f1(x: int): bool;
        /// Adds calls to fi before each map lookup/write
        /// </summary>
        class AllocationSiteInstrumentation
        {
            private Program prog;
            private string filename;

            public AllocationSiteInstrumentation(Program prog, string filename)
            {
                // TODO: Complete member initialization
                this.prog = prog;
                this.filename = filename;
            }
            internal string PerformAllocationSiteInstrumentation()
            {
                IdentifyAndAddAllocators();
                //DeclareAllocationSiteFuncs();
                InstrumentAllocationSiteAssumes();
                var instrumentedFilename = filename + SplitConsts.allocInstrumentedFileExtention;
                var tuo = new TokenTextWriter(instrumentedFilename, true);
                prog.Emit(tuo);
                tuo.Close();
                return instrumentedFilename;
            }
            private void InstrumentAllocationSiteAssumes()
            {
                var mapAliasQuery = new MapLookupAliasingQuery(prog);
                mapAliasQuery.Visit(prog);
            }
            private void DeclareAllocationSiteFuncs()
            {
                throw new NotImplementedException();
            }
            private void IdentifyAndAddAllocators()
            {
                prog.TopLevelDeclarations.OfType<Procedure>()
                    .Where(x => x.Name.Contains(SplitConsts.mallocString))
                    .Iter(x => x.AddAttribute(SplitConsts.allocatorAttr));
            }
        }

        class MapLookupAliasingQuery : StandardVisitor
        {
            private Program prog;
            private HashSet<Function> queryFuncs;
            private Dictionary<Cmd, HashSet<Expr>> lookupExprsPerCmd;
            private Cmd currCmd;
            private int aliasFnCount;

            public MapLookupAliasingQuery(Program prog) 
            { 
                this.prog = prog;
                queryFuncs = new HashSet<Function>();
                lookupExprsPerCmd = null;
                currCmd = null;
                aliasFnCount = 0;
            }
            public override Block VisitBlock(Block node)
            {
                lookupExprsPerCmd = new Dictionary<Cmd, HashSet<Expr>>();
                var b = base.VisitBlock(node); //recurse down to find the lookups for all cmds
                var newCmds = new List<Cmd>();
                node.Cmds
                    .Iter(x =>
                    {
                        if (lookupExprsPerCmd.ContainsKey(x))
                        {
                            var lookupExprs = lookupExprsPerCmd[x];
                            lookupExprs
                                .Iter( y => 
                                {
                                    Function aliasingFunc = new Function(Token.NoToken,
                                          SplitConsts.allocSiteFnName + "_" + aliasFnCount++, 
                                          new List<Variable>() {new Formal(Token.NoToken, new TypedIdent(Token.NoToken, "_x_", y.Type), false)}, 
                                          new Formal(Token.NoToken, new TypedIdent(Token.NoToken, "__ret__", Microsoft.Boogie.Type.Bool), false)
                                          );
                                    aliasingFunc.AddAttribute(SplitConsts.aliasQueryAttr, new object[] { SplitConsts.allocSiteStr });
                                    prog.TopLevelDeclarations.Add(aliasingFunc);
                                    var callFunc = new FunctionCall(aliasingFunc);
                                    var expr = new NAryExpr(new Token(), callFunc, new List<Expr>() {y});

                                    AssumeCmd aCmd = new AssumeCmd(Token.NoToken, expr);
                                    aCmd.Attributes = new QKeyValue(Token.NoToken,
                                        SplitConsts.allocAssumeAttr, new List<object>() {}, aCmd.Attributes);
                                    newCmds.Add(aCmd);
                                });
                        }
                        newCmds.Add(x);
                    });
                node.Cmds = newCmds;
                return base.VisitBlock(node);
            }
            public override Cmd VisitAssumeCmd(AssumeCmd node)
            {
                currCmd = node;
                var b = base.VisitAssumeCmd(node);
                currCmd = null;
                return b;
            }
            public override Cmd VisitAssignCmd(AssignCmd node)
            {
                currCmd = node;
                var b = base.VisitAssignCmd(node);
                currCmd = null;
                return b;
            }
            public override Cmd VisitCallCmd(CallCmd node)
            {
                currCmd = node;
                var b = base.VisitCallCmd(node);
                currCmd = null;
                return b;
            }
            public override Expr VisitNAryExpr(NAryExpr node)
            {
                if (node.Fun is MapSelect && node.Fun.ArgumentCount == 2 ||
                    node.Fun is MapStore && node.Fun.ArgumentCount == 3)
                    if (currCmd != null)
                    {
                        if (!lookupExprsPerCmd.ContainsKey(currCmd))
                            lookupExprsPerCmd[currCmd] = new HashSet<Expr>();
                        lookupExprsPerCmd[currCmd].Add(node.Args[1]);
                    }
                return base.VisitNAryExpr(node);
            }
        }

    }

    /// <summary>
    /// Goes from a program with 
    /// assume (AS(a) == A1 || AS(a) == A3); x := M[a]; to x := {M@A1[a], M@A3[a]}
    /// assume (AS(a) == A1 || AS(a) == A3); M[a] := x; to M@A1[a], M@A3[a] := {M@A1[a],y}, {M@A3[a], y};  
    /// 
    /// </summary>
    class SplitHeapHelper
    {
        Program splitHeapProgram; //this is the program that is the output of alias analysis
        private string prunedFilename;

        public SplitHeapHelper(string prunedFilename)
        {
            this.prunedFilename = prunedFilename;
            splitHeapProgram = null;
        }

        internal Program Run()
        {
            throw new NotImplementedException();
            if (!Utils.ParseProgram(prunedFilename, out splitHeapProgram)) return null;

        }
    }
}
