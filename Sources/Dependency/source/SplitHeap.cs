using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;
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
        public const string allocSiteFnName = "allocSiteFn";
        public const string allocAssumeAttr = "allocSiteAssume";
        public const string allocInstrumentedFileExtention = ".mapLookupAssumes.bpl";
        public const string allocSiteFuncName = "AllocationSites";
        public const string iteFuncName = "ite";
        public const string externalAlloc = "AS_EXT"; //allocate site for expression e that have AS(e) = {}
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
            string args = string.Format(" {0} /prune:{1} /full /warn ", instrFilename, prunedFilename);
            //TODO: make the path relative
            //Utils.ExecuteBinary(@"d:\corral-codeplex\corral\addons\aliasAnalysis\aliasAnalysis\bin\debug\AliasAnalysis.exe", args);
            //Utils.ExecuteBinary(@"C:\Users\nimi\Documents\Codeplex\Corral\AddOns\AliasAnalysis\AliasAnalysis\bin\Debug\AliasAnalysis.exe", args);
            Utils.ExecuteBinary(@"AliasAnalysis.exe", args);
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
            private Dictionary<Cmd, HashSet<Tuple<Expr, Expr>>> lookupExprsPerCmd;
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
                                .Iter(y =>
                                {
                                    var fnName = SplitConsts.allocSiteFnName + "_" + aliasFnCount++;
                                    Function aliasingFunc =
                                        Utils.DeclUtils.MkOrGetFunc(
                                        prog,
                                        fnName,
                                        Microsoft.Boogie.Type.Bool,
                                        new List<Microsoft.Boogie.Type>() { y.Item2.Type });
                                    aliasingFunc.AddAttribute(SplitConsts.aliasQueryAttr, new object[] { SplitConsts.allocSiteStr });
                                    var expr = Utils.DeclUtils.MkFuncApp(aliasingFunc, new List<Expr>() { y.Item2 });
                                    AssumeCmd aCmd = new AssumeCmd(Token.NoToken, expr);
                                    aCmd.Attributes = new QKeyValue(Token.NoToken,
                                        SplitConsts.allocAssumeAttr, new List<object>() { y.Item2.ToString() }, aCmd.Attributes);
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

            public override AssignLhs VisitMapAssignLhs(MapAssignLhs node)
            {
                Debug.Assert(node.Indexes.Count() == 1, "Expecting 1D maps only");
                this.Visit(node.AsExpr); //makes it as MapSelect(M,e)
                return node;
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
                .Where(f => f.Name == SplitConsts.allocSiteFuncName)
                .FirstOrDefault();
            if (allocSiteFunc == null)
                throw new Exception(string.Format("Could not find a function named {0} declared in file {1}", SplitConsts.allocSiteFuncName, prunedFilename));
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
            //           ite(AS(a', 1), sel(m@1,a'), sel(m@2,a'))  //don't constraint ite
            //- LHS: ||m := upd(m,b,c) || =
            //           let b',c' = ||b,c|| in
            //           m@1[b']  := ite(AS(b', 1), c', m@1[b']),
            //           m@3[b']  := ite(AS(b', 3), c', m@3[b']);
            //       ||m := e || = XXX not allowed to update more than 1 location currently
            #endregion

            private Program prog;
            private Cmd currCmd;
            private Implementation currImpl;
            private Dictionary<Expr, HashSet<Expr>> currAllocSiteMapInfo; //expr -> {a0, a1, ...}, for M[expr]
            private Function allocSiteFunc;
            private List<string> allAllocSites;

            private HashSet<Tuple<Expr, string>> insertedTypeWarnings;//missing types inserted
            private HashSet<Cmd> unhandledCommands; //commands not handled soundly


            public MapRewriteUsingAllocSites(Program prog, Function allocSiteFunc)
            {
                this.prog = prog;
                currCmd = null;
                this.allocSiteFunc = allocSiteFunc;
                currAllocSiteMapInfo = null;
                insertedTypeWarnings = new HashSet<Tuple<Expr, string>>();
                unhandledCommands = new HashSet<Cmd>();
                //find all the allocation sites 
                allAllocSites = prog.Constants
                    .Where(x => x.TypedIdent.Type.ToString() == "AS")
                    .Select(x => x.ToString())
                    .ToList();
                allAllocSites.Add(SplitConsts.externalAlloc);
            }
            public override Program VisitProgram(Program node)
            {
                var p = base.VisitProgram(node);
                if (insertedTypeWarnings.Count > 0)
                    Console.WriteLine("Warning!: {0} cases of missing inserted types", insertedTypeWarnings.Count);
                if (unhandledCommands.Count > 0)
                    Console.WriteLine("Warning!: {0} cases of unhandled commands", unhandledCommands.Count);
                return p;
            }
            public override Implementation VisitImplementation(Implementation node)
            {
                currImpl = node;
                var n = base.VisitImplementation(node);
                return n;
            }
            public override Block VisitBlock(Block node)
            {
                currAllocSiteMapInfo = new Dictionary<Expr, HashSet<Expr>>(); //clear this after each assigns
                //collect the assume commands from allocSiteAssume to be removed from Cmds
                var allocAssumeCmds = new HashSet<AssumeCmd>();
                foreach (var cmd in node.Cmds)
                {
                    var asumCmd = cmd as AssumeCmd;
                    //update the mapping from an expr to its allocation sites
                    if (asumCmd != null)
                    {
                        var exprArgName = QKeyValue.FindStringAttribute(asumCmd.Attributes, SplitConsts.allocAssumeAttr);
                        if (exprArgName != null)
                        {
                            var allocSites = ExtractAllocSitesFromExpr(asumCmd.Expr);
                            if (allocSites != null) //not assume true
                            {
                                currAllocSiteMapInfo[allocSites.Item1] = allocSites.Item2; //overwrite any previous, even in same cmd
                            }
                            allocAssumeCmds.Add(asumCmd);
                        }
                    }
                    Visit(cmd);
                    if (cmd is AssignCmd)
                        currAllocSiteMapInfo.Clear(); //clear so that the map for 
                }
                node.Cmds.RemoveAll(allocAssumeCmds.Contains);
                return node;
            }
            public override Cmd VisitHavocCmd(HavocCmd node)
            {
                if (node.Vars.All(x => !x.Type.IsMap))
                    return base.VisitHavocCmd(node);
                throw new Exception(string.Format("Do not allow havoc over map variables, found {0}", node.ToString()));
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
            /// <summary>
            /// Rewrite map assignments to parallel assignments
            /// </summary>
            /// <param name="node"></param>
            /// <returns></returns>
            public override Cmd VisitAssignCmd(AssignCmd node)
            {
                var ac = (AssignCmd) base.VisitAssignCmd(node);
                var lhss = ac.Lhss;
                var containsMapAssign = lhss.Any(x => x.DeepAssignedVariable.TypedIdent.Type.IsMap);
                if (!containsMapAssign)
                    return ac;
                int i = 0;
                //create a new assignment with splitting the map assignments
                List<AssignLhs> nLhss = new List<AssignLhs>();
                List<Expr> nRhss = new List<Expr>();
                for (; i < lhss.Count; ++i)
                {
                    var lhs = ac.Lhss[i];
                    var rhs = ac.Rhss[i];
                    if (!lhs.DeepAssignedVariable.TypedIdent.Type.IsMap)
                    {
                        nLhss.Add(lhs);
                        nRhss.Add(rhs);
                        continue;
                    }
                    //split the map
                    var splitAssign = VisitMapAssignment(lhs, rhs);
                    nLhss.AddRange(splitAssign.Lhss);
                    nRhss.AddRange(splitAssign.Rhss);                    
                }
                ac.Lhss = nLhss;
                ac.Rhss = nRhss;
                return ac;
            }
            private AssignCmd VisitMapAssignment(AssignLhs lhs, Expr rhs)
            {
                Debug.Assert(lhs.DeepAssignedVariable.TypedIdent.Type.IsMap);
                var ac = new AssignCmd(Token.NoToken, new List<AssignLhs>() { lhs }, new List<Expr>() { rhs });
                if (lhs.Type.IsMap)
                {
                    ac = VisitEntireMapAssignment(lhs, rhs);
                    return ac;
                }
                var index = (lhs.AsExpr as NAryExpr).Args[1];
                var l = VisitMapStore(lhs.DeepAssignedIdentifier, index, rhs);
                if (l != null)
                {
                    ac = new AssignCmd(Token.NoToken, new List<AssignLhs>(), new List<Expr>()); //overwrite
                    //to generate M'[x] := y
                    ac.Lhss = l
                        .Select(x => new MapAssignLhs(Token.NoToken, new SimpleAssignLhs(Token.NoToken, x.Item1), new List<Expr>() { index }))
                        .ToList<AssignLhs>();
                    ac.Rhss = l
                        .Select(x => x.Item2)
                        .ToList();
                }
                return ac;
            }
            /// <summary>
            /// M := E
            /// </summary>
            /// <param name="lhs"></param>
            /// <param name="rhs"></param>
            /// <returns></returns>
            private AssignCmd VisitEntireMapAssignment(AssignLhs lhs, Expr rhs)
            {
                Debug.Assert(lhs.DeepAssignedVariable.TypedIdent.Type.IsMap);
                var ac = new AssignCmd(Token.NoToken, new List<AssignLhs>() { lhs }, new List<Expr>() { rhs });
                //M := old(M)
                if (!
                    (rhs is OldExpr &&
                    ((OldExpr)rhs).Expr is IdentifierExpr &&
                    ((IdentifierExpr)((OldExpr)rhs).Expr).Decl == lhs.DeepAssignedVariable)
                    )
                {
                    Console.WriteLine("Don't handle direct stores M := e yet, found {0}", ac.ToString());
                    unhandledCommands.Add(ac);
                    return ac;
                }
                var splitVars = allAllocSites
                    .Select(x => GetOrCreateSplitMap(lhs.DeepAssignedVariable, x))
                    .ToList();
                ac.Lhss = splitVars.Select(x => (AssignLhs) new SimpleAssignLhs(Token.NoToken, IdentifierExpr.Ident(x))).ToList();
                ac.Rhss = splitVars.Select(x => (Expr) new OldExpr(Token.NoToken, (Expr) IdentifierExpr.Ident(x))).ToList();
                return ac;
            }
            /// <summary>
            /// Rewirte map select expressions to ITE expressions
            /// </summary>
            /// <param name="node"></param>
            /// <returns></returns>
            public override Expr VisitNAryExpr(NAryExpr node)
            {
                var e = base.VisitNAryExpr(node);
                var ret = e as NAryExpr;
                if (ret == null) return e;
                if (ret.Fun is MapSelect && ret.Fun.ArgumentCount == 2)
                    return VisitMapSelect(ret.Args[0], ret.Args[1], node.Type);
                if (ret.Fun is MapStore && ret.Fun.ArgumentCount == 3)
                    Console.WriteLine("Map stores directly not handled yet");
                return ret;
            }
            /// <summary>
            /// Returns a set {m_i, updateexpr_i} for all m_i that are updated
            /// </summary>
            /// <param name="map"></param>
            /// <param name="index"></param>
            /// <param name="value"></param>
            /// <param name="btype"></param>
            /// <returns></returns>
            private List<Tuple<IdentifierExpr, Expr>> VisitMapStore(IdentifierExpr mv, Expr index, Expr value)
            {
                //get AS set and ASFunc for this map. lookup by name
                //create m@1,..
                //create n parallel assignments with 1 ite
                //m@1[index], m@2[index],.. = ite(AS(index,AS1), value, m@1[index]), ite(...),..
                var aSites = currAllocSiteMapInfo.ContainsKey(index) ? currAllocSiteMapInfo[index] : (new HashSet<Expr>());
                if (aSites.Count == 0)
                {
                    //Case where AS(index) = {}
                    var splitMapVar = GetOrCreateSplitMap(mv.Decl, SplitConsts.externalAlloc);
                    return new List<Tuple<IdentifierExpr, Expr>>() {Tuple.Create(IdentifierExpr.Ident(splitMapVar), value)};
                }
                var btype = value.Type;
                if (btype == null)
                   Console.WriteLine("Stop here");
                Debug.Assert(btype != null);
                var iteArgs = new List<Tuple<IdentifierExpr, Expr>>(); //list of (mv', ite(cond,trueExpr,falseExpr)) tuples
                aSites
                    .Iter(x =>
                    {
                        var cond = Utils.DeclUtils.MkFuncApp(allocSiteFunc, new List<Expr>() { index, x }); //AS(index,AS1)
                        var splitMapVar = GetOrCreateSplitMap(mv.Decl, x.ToString());      //m@AS1
                        var arg = Expr.Select(IdentifierExpr.Ident(splitMapVar), new Expr[] { index }); //m@AS1[index]
                        if (arg.Type == null)
                        {
                            arg.Type = (splitMapVar.TypedIdent.Type as MapType).Result;
                            //Console.WriteLine("Inserted missing type for  mapselect expr {0}", arg);
                            insertedTypeWarnings.Add(Tuple.Create((Expr)arg, "mapselect"));
                        }

                        Debug.Assert(arg.Type != null);
                        var iteFunc = Utils.DeclUtils.MkOrGetFunc(prog, SplitConsts.iteFuncName, btype,
                            new List<Microsoft.Boogie.Type>() { Microsoft.Boogie.Type.Bool, btype, btype });
                        var iteVal =
                            Utils.DeclUtils.MkFuncApp(iteFunc, new List<Expr>() { (Expr)cond, value, (Expr)arg}); //ite(AS(index,AS1), value, m@AS1[index])
                        if (iteVal.Type == null)
                        {
                            //Console.WriteLine("Inserted missing type for ite expr {0}", iteVal);
                            insertedTypeWarnings.Add(Tuple.Create((Expr)iteVal, "ite"));
                            iteVal.Type = arg.Type;
                        }
                        iteArgs.Add(Tuple.Create(IdentifierExpr.Ident(splitMapVar),  (Expr)iteVal)); 
                    }
                    );
                return iteArgs;
            }
            private Expr VisitMapSelect(Expr map, Expr index, Microsoft.Boogie.Type btype)
            {
                //get AS set and ASFunc for this map. lookup by name
                //create m@1,..
                //create ite with n-1 choices
                //ite(AS(index,a1), m@1[index], ite(..))
                var mv = map as IdentifierExpr;
                if (mv == null) throw new Exception(string.Format("Expecting an identifier as map in Select, found {0}", map));
                //find the AS for index
                var aSites = currAllocSiteMapInfo.ContainsKey(index) ? currAllocSiteMapInfo[index] : (new HashSet<Expr>());
                if (aSites.Count == 0)
                {
                    //Case where AS(index) = {}
                    var splitMapVar = GetOrCreateSplitMap(mv.Decl, SplitConsts.externalAlloc);
                    var ms = Expr.Select(IdentifierExpr.Ident(splitMapVar), new Expr[] { index});
                    if (ms.Type == null)
                    {
                        ms.Type = (splitMapVar.TypedIdent.Type as MapType).Result; 
                        //Console.WriteLine("Inserted missing type for  mapselect expr {0}", ms);
                        insertedTypeWarnings.Add(Tuple.Create((Expr)ms, "mapselect"));

                    }
                    Debug.Assert(ms.Type != null);
                    return ms;
                }

                var iteArgs = new List<Tuple<Expr, Expr>>(); //list of (cond,expr) pair
                aSites
                    .Iter(x =>
                    {
                        var cond = Utils.DeclUtils.MkFuncApp(allocSiteFunc, new List<Expr>() { index, x });
                        var splitMapVar = GetOrCreateSplitMap(mv.Decl, x.ToString());
                        var arg = Expr.Select(IdentifierExpr.Ident(splitMapVar), new Expr[] {index});
                        if (arg.Type == null)
                        {
                            arg.Type = (splitMapVar.TypedIdent.Type as MapType).Result;
                            //Console.WriteLine("Inserted missing type for  mapselect expr {0}", arg);
                            insertedTypeWarnings.Add(Tuple.Create((Expr)arg, "mapselect"));
                        }
                        Debug.Assert(arg.Type != null);
                        iteArgs.Add(Tuple.Create((Expr)cond, (Expr)arg));
                    }
                    );
                //create the nested n-1 level ite expression
                if (iteArgs.Count == 1)
                    return iteArgs[0].Item2;
                if (btype == null)
                    Console.WriteLine("Stop here");
                Debug.Assert(btype != null);
                var iteFunc = Utils.DeclUtils.MkOrGetFunc(prog, SplitConsts.iteFuncName, btype,
                    new List<Microsoft.Boogie.Type>() { Microsoft.Boogie.Type.Bool, btype, btype });
                //Create the n-1 level expression
                iteArgs.Reverse();
                var end = iteArgs[0].Item2;
                iteArgs.RemoveAt(0);
                var mkIteExpr = iteArgs
                    .Aggregate(end,
                    (x, y) => 
                        {
                            var iteVal = Utils.DeclUtils.MkFuncApp(iteFunc, new List<Expr>() { y.Item1, y.Item2, x });
                            if (iteVal.Type == null)
                            {
                                //Console.WriteLine("Inserted missing type for ite expr {0}", iteVal);
                                insertedTypeWarnings.Add(Tuple.Create((Expr)iteVal, "ite"));
                                iteVal.Type = x.Type;
                            }
                            return iteVal;
                        }
                    );
                return mkIteExpr;
            }
            private Variable GetOrCreateSplitMap(Variable m, string allocSite)
            {
                var splitname = m.Name + "_" + allocSite;
                if (m is GlobalVariable)
                {
                    var y = prog.TopLevelDeclarations.OfType<Variable>()
                        .Where(x => x.Name == splitname)
                        .FirstOrDefault();
                    if (y != null) return y;
                    Debug.Assert(m.TypedIdent.Type != null);
                    return Utils.DeclUtils.MkGlobalVariable(prog, splitname, m.TypedIdent.Type);
                }
                else if (m is LocalVariable)
                {
                    var y = currImpl.LocVars.OfType<Variable>()
                        .Where(x => x.Name == splitname)
                        .FirstOrDefault();
                    if (y != null) return y;
                    Debug.Assert(m.TypedIdent.Type != null);
                    return Utils.DeclUtils.MkLocalVariable(prog, currImpl, splitname, m.TypedIdent.Type);
                }
                throw new Exception(string.Format("Maps are not allowed as parameters, found {0} in {1}", m, currImpl.Name));
            }
            /// <summary>
            /// </summary>
            /// <param name="expr"></param>
            /// <returns></returns>
            private Tuple<Expr, HashSet<Expr>> ExtractAllocSitesFromExpr(Expr expr)
            {
                var asExtractor = new AllocSiteExtractor();
                asExtractor.Visit(expr);
                if (asExtractor.expr == null) return null;
                return Tuple.Create(asExtractor.expr, asExtractor.allocSites);
            }
            class AllocSiteExtractor : StandardVisitor
            {
                //AllocSites(expr, allocSites)
                public Expr expr;
                public HashSet<Expr> allocSites;
                public AllocSiteExtractor() { expr = null; allocSites = new HashSet<Expr>(); }
                public override Expr VisitNAryExpr(NAryExpr node)
                {
                    //AllocSite(a,A1) && AllocSite(a,A2) && ...
                    if (node.Fun is FunctionCall &&
                        node.Fun.FunctionName == SplitConsts.allocSiteFuncName)
                    {
                        expr = node.Args[0];
                        allocSites.Add(node.Args[1]);
                    }
                    return base.VisitNAryExpr(node);
                }
            }
        }
    }
}
