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
        public const string computedAllocSiteAttr = "computedallocationsites";
        public const string allocSiteFnName= "allocSiteFn";
        public const string allocAssumeAttr = "allocSiteAssume";
        public const string allocInstrumentedFileExtention = ".mapLookupAssumes.bpl";
        public const string allocSiteFunc = "AllocationSites";
        public const string iteFuncName = "ite";
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
                Utils.PrintProgram(prog, instrumentedFilename);
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
            private Dictionary<Cmd, HashSet<Tuple<Expr,Expr>>> lookupExprsPerCmd;
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
                lookupExprsPerCmd = new Dictionary<Cmd, HashSet<Tuple<Expr, Expr>>>();
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
                                    var fnName = SplitConsts.allocSiteFnName + "_" + aliasFnCount++;
                                    Function aliasingFunc =
                                        Utils.DeclUtils.MkOrGetFunc(
                                        prog,
                                        fnName,
                                        Microsoft.Boogie.Type.Bool,
                                        new List<Microsoft.Boogie.Type>() { y.Item2.Type });
                                    aliasingFunc.AddAttribute(SplitConsts.aliasQueryAttr, new object[] { SplitConsts.allocSiteStr });
                                    var expr = Utils.DeclUtils.MkFuncApp(aliasingFunc,  new List<Expr>() {y.Item2}); 
                                    AssumeCmd aCmd = new AssumeCmd(Token.NoToken, expr);
                                    aCmd.Attributes = new QKeyValue(Token.NoToken,
                                        SplitConsts.allocAssumeAttr, new List<object>() {y.Item1.ToString()}, aCmd.Attributes);
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
                            lookupExprsPerCmd[currCmd] = new HashSet<Tuple<Expr, Expr>>();
                        lookupExprsPerCmd[currCmd].Add(Tuple.Create(node.Args[0], node.Args[1]));
                    }
                return base.VisitNAryExpr(node);
            }
        }

    }

    /// <summary>
    /// Goes from a program with 
    /// assume (AS(a) == A1 || AS(a) == A3); x := M[a]; |--> x := {M@1[a], M@3[a]}
    /// assume (AS(a) == A1 || AS(a) == A3); M[a] := x; |--> M@1[a], M@3[a] := {M@1[a],y}, {M@3[a], y};  
    /// 
    /// </summary>
    class SplitHeapHelper
    {
        Program splitHeapProgram; //this is the program that is the output of alias analysis
        private string prunedFilename;
        private Function allocSiteFunc; 

        public SplitHeapHelper(string prunedFilename)
        {
            this.prunedFilename = prunedFilename;
            splitHeapProgram = null;
            allocSiteFunc = null;
        }

        internal Program Run()
        {
            if (!Utils.ParseProgram(prunedFilename, out splitHeapProgram)) return null;
            allocSiteFunc =
                splitHeapProgram.TopLevelDeclarations.OfType<Function>()
                .Where(f => f.Name == SplitConsts.allocSiteFunc)
                .FirstOrDefault();
            if (allocSiteFunc == null)
                throw new Exception(string.Format("Could not find a function named {0} declared in file {1}", SplitConsts.allocSiteFunc, prunedFilename));
            var mapRewriter = new MapRewriteUsingAllocSites(splitHeapProgram, allocSiteFunc);
            mapRewriter.Visit(splitHeapProgram);
            Utils.PrintProgram(splitHeapProgram, prunedFilename + ".mapsplit.bpl");
            return splitHeapProgram;
        }

        /// <summary>
        /// 
        /// </summary>
        class MapRewriteUsingAllocSites : StandardVisitor
        {

            #region transformation logic
            // - RHS: ||sel(m,a)|| = 
            //           let a' = ||a|| in
            //           ite(AS(a') == 1, sel(m@1,a'), sel(m@2,a'))  //don't constraint ite
            //- LHS: ||m := upd(m,b,c) || =
            //           let b',c' = ||b,c|| in
            //           m@1  := ite(AS(b') == 1, upd(m@1, b', c'), m@1),
            //           m@3  := ite(AS(b') == 3, upd(m@3, b', c'), m@3);
            //       ||m := e || = XXX not allowed to update more than 1 location   
            #endregion

            private Program prog;
            private Cmd currCmd;
            private Tuple<string, List<Tuple<Expr,Expr>>> currMapInfo;
            private Function allocSiteFunc;
            public MapRewriteUsingAllocSites(Program prog, Function allocSiteFunc)
            {
                this.prog = prog;
                currCmd = null;
                currMapInfo = null;
                this.allocSiteFunc = allocSiteFunc;
            }
            public override Block VisitBlock(Block node)
            {
                currMapInfo = null; //reset currMap across blocks
                var b = base.VisitBlock(node);
                currMapInfo = null;
                return b;
            }
            public override Cmd VisitAssumeCmd(AssumeCmd node)
            {
                currCmd = node;
                var mapName = QKeyValue.FindStringAttribute(node.Attributes, SplitConsts.allocAssumeAttr);
                if (mapName != null)
                {
                    //node.Expr should be AS(..) == A1 || AS(..) == A2
                    List<Tuple<Expr,Expr>> allocSites = ExtractAllocSitesFromExpr(node.Expr);
                    currMapInfo = Tuple.Create(mapName, allocSites);
                    //Console.WriteLine("The list of allocSite consts = {0}, {1}", 
                    //    currMapInfo.Item1, string.Join(" ", currMapInfo.Item2));
                    node.Attributes.AddLast(new QKeyValue(Token.NoToken, SplitConsts.computedAllocSiteAttr,                    
                        allocSites.Select(x => (object) x.Item2).ToList(), null));
                }
                var b = base.VisitAssumeCmd(node);
                return b;
            } 
            public override Cmd VisitCallCmd(CallCmd node)
            {
                if (node.Outs.Any(x => x.Decl.TypedIdent.Type.IsMap))
                    throw new Exception(string.Format("Assume that calls only assign to non-map variables. Found {0}", node.ToString()));
                currCmd = node;
                var b = base.VisitCallCmd(node);
                currCmd = null;
                return b;
            }
            public override Expr VisitIdentifierExpr(IdentifierExpr node)
            {
                if (node.Decl.TypedIdent.Type.IsMap && currMapInfo != null) //currInfo == null means no assume was encountered (e.g. requires/ensures)
                {
                    if (node.Decl.Name != currMapInfo.Item1)
                        throw new Exception(string.Format("Expecting the map name {0} to match up with map name in last :allocSiteAssume {1}",
                            node.Decl.Name, currMapInfo.Item1));

                    //create ite with allocation site
                }

                return base.VisitIdentifierExpr(node);
            }

            public override Expr VisitNAryExpr(NAryExpr node)
            {
                //don't do any processing when outside a block
                if (currMapInfo == null)
                    return base.VisitNAryExpr(node);
                Expr e = base.VisitNAryExpr(node);
                var ret = e as NAryExpr;
                if (ret == null) return e;
                if (ret.Fun is MapSelect && ret.Fun.ArgumentCount == 2)
                    return VisitMapSelect(ret.Args[0], ret.Args[1], node.Type);
                if (ret.Fun is MapStore && ret.Fun.ArgumentCount == 3)
                    return e; // VisitMapStore(ret.Args[0], ret.Args[1], ret.Args[2], node.Type);
                return ret;
            }

            private Expr VisitMapStore(Expr map, Expr index, Expr value, Microsoft.Boogie.Type btype)
            {
                //get AS set and ASFunc for this map. lookup by name
                //create m@1,..
                //create n parallel assignments with 1 ite
                //m@1, ... = ite(AS(index) == a1, m@1, value), ...
                throw new NotImplementedException();
            }

            private Expr VisitMapSelect(Expr map, Expr index, Microsoft.Boogie.Type btype)
            {
                //get AS set and ASFunc for this map. lookup by name
                //create m@1,..
                //create ite with n-1 choices
                //ite(AS(index) == a1, m@1, ite(..))
                var mv = map as IdentifierExpr;
                if (mv == null) throw new Exception(string.Format("Expecting an identifier as map in Select, found {0}", map));
                if (mv.Name != currMapInfo.Item1)
                    throw new Exception(string.Format("Map {0} in expression against {1} in allocSiteAssume", map, currMapInfo.Item1));
                var iteArgs = new List<Tuple<Expr, Expr>> (); //list of (cond,expr) pair
                currMapInfo.Item2
                    .Iter(x =>
                    { 
                        var tmp = Utils.DeclUtils.MkFuncApp(allocSiteFunc, new List<Expr>(){index});
                        var cond = Expr.Eq(tmp, x.Item2);
                        var splitMapVar = GetOrCreateSplitMap(mv.Decl, x.Item2.ToString());
                        var arg = new NAryExpr(Token.NoToken,
                            new MapSelect(Token.NoToken, 1),
                            new List<Expr>() {IdentifierExpr.Ident(splitMapVar), index});
                        iteArgs.Add(Tuple.Create((Expr)cond, (Expr) arg));
                    }
                    );
                var iteFunc = Utils.DeclUtils.MkOrGetFunc(prog, SplitConsts.iteFuncName, btype, 
                    new List<Microsoft.Boogie.Type>(){Microsoft.Boogie.Type.Bool, btype, btype});
                //create the nested n-1 level ite expression
                if (currMapInfo.Item2.Count() == 1)
                    return iteArgs[0].Item2;
                throw new NotImplementedException();
            }

            /// <summary>
            /// returns {(AS(..) == A1,A1), ...} from AS(..) == A1 || AS(..) == A2
            /// </summary>
            /// <param name="expr"></param>
            /// <returns></returns>
            private List<Tuple<Expr,Expr>> ExtractAllocSitesFromExpr(Expr expr)
            {
                var asExtractor = new AllocSiteExtractor();
                asExtractor.Visit(expr);
                return asExtractor.allocSites;
            }

            private Variable GetOrCreateSplitMap(Variable m, string allocSite)
            {
                var splitname = m.Name + "_" + allocSite;
                var y = prog.TopLevelDeclarations.OfType<Variable>()
                    .Where(x => x.Name == splitname)
                    .FirstOrDefault();
                if (y != null) return y;
                return Utils.DeclUtils.MkGlobalVariable(prog, splitname, m.TypedIdent.Type);
            }

            class AllocSiteExtractor : StandardVisitor
            {
                public List<Tuple<Expr,Expr>> allocSites;
                public AllocSiteExtractor() { allocSites = new List<Tuple<Expr, Expr>>(); }
                public override Expr VisitNAryExpr(NAryExpr node)
                {
                    if (node.Fun is BinaryOperator &&
                        ((BinaryOperator)node.Fun).Op == BinaryOperator.Opcode.Eq)
                        allocSites.Add(Tuple.Create((Expr) node, node.Args[1]));
                    return base.VisitNAryExpr(node);
                }
            }
        }
    }
}
