using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;
using Microsoft.Boogie;
using B = SDiff.Boogie;
using Microsoft.Boogie.Houdini;
using SymDiffUtils;
using SymDiff;
using Util = SymDiffUtils.Util;

namespace SDiff
{
    /// <summary>
    /// This class implements the Mutual summaries (mutual summary and relative termination) (CADE'13)
    /// It also implements the 2->1 program transformation from Rahul Sharma's internship (FSE'13)
    /// 
    /// Do all the lookups by name since we have 3 programs p1, p2, p12 
    /// </summary>
    class MutualSummary
    {
        //options
        static Options.DAC_ENCODING_OPT dacEncoding = Options.DAC_ENCODING_OPT.DAC_NORMAL;
        static bool dontUseMSAsAxioms = false; //when true, use the transformation in DAC paper without any R_f relations
        static bool useHoudini = true; //use houdini for candiates on MS procedures as pre/post
        static Options.INFER_OPT houdiniInferOpt; //use Houdini/AbsHoudini/...
        static bool checkMutualPreconditionsForInfiniteLoops = false; //checking mutual preconditions in the presence of non-terminating programs
        static bool typeCheckMergedProgram = true; //avoid type checking the in memory mergedProgSingle as the type symbols in ms_symdiff_file.bpl are not merged
        static bool checkAssertsOnly = false; //if true, we only check OK1 => OK2
        //if false, then we check Dep(o1) == Dep(o2) ==> o1 == o2 (non-roots: all outs, roots: outvars)

        //globals
        static bool freeContracts = false;
        static bool callCorralOnMergedProgram = false;

        static Program mergedProgram; //don't expose the progs p1 and p2, they are only used in Initialize
        static string p1Prefix, p2Prefix;
        static List<Variable> gSeq_p1, gSeq_p2; //refine it with r/w set of each procedure
        static Dictionary<Procedure, Function> summaryFuncs;
        static Dictionary<string, string> implProcMap, stubProcMap; //mapping of (impl, impl) and (a, b) where either a/b is stub
        static Config cfg;
        static CallGraph cg1, cg2; //the call graphs
        static HashSet<Function> msFuncAxiomsAdded; //list of msfuncs for which axioms have been added (to account for user provided msfuncs separately)
        static Dictionary<Implementation, LocalVariable> abortVars; //each implementation has a local variable to abort
        static HashSet<Procedure> rootMSProcs; //set of MS_Check_ procedures not invoked in the module

        //TODO: move dependency related stuff to a separate class/file
        //parse dependencies out of input files
        static Dictionary<Procedure, Dictionary<Variable, List<Variable>>> dependency = new Dictionary<Procedure, Dictionary<Variable, List<Variable>>>();
        //parse bottom up taints for procedures
        static Dictionary<Procedure, HashSet<Variable>> bottomUpTaintVars = new Dictionary<Procedure, HashSet<Variable>>();

        //entry method
        public static void Start(Program p1, Program p2, Program mergedProgram, string p1Prefix, string p2Prefix, Config cfg1,
            bool checkAssertsOnlyParam,
            bool useMutualSummariesAsAxioms,
            Options.INFER_OPT useHoudiniOption,
            bool checkPreconditions, bool freeContractsIn,
            bool dontTypeCheckMergedProg,
            Options.DAC_ENCODING_OPT dacEnc, 
            bool callCorral = false)
        {

            typeCheckMergedProgram = !dontTypeCheckMergedProg;
            ParseAddtionalMSFile(mergedProgram); //look for additional files
            dontUseMSAsAxioms = !useMutualSummariesAsAxioms;
            checkAssertsOnly = checkAssertsOnlyParam && !Options.checkEquivWithDependencies;
            useHoudini = dontUseMSAsAxioms && (useHoudiniOption != Options.INFER_OPT.NO_INFER);
            houdiniInferOpt = useHoudiniOption;
            freeContracts = freeContractsIn;
            dacEncoding = dacEnc;
            checkMutualPreconditionsForInfiniteLoops = dontUseMSAsAxioms && checkPreconditions;
            callCorralOnMergedProgram = callCorral;
            //lets drop the modifies of all procedures (e.g. default generated alloc/detchoicent by havoc
            if (!freeContractsIn)
                Util.DropAllModifies(mergedProgram);
            ModSetCollector c = new ModSetCollector(BoogieUtils.BoogieOptions);
            c.DoModSetAnalysis(mergedProgram); //important that we do it on the merged program
            //get the call graphs
            cg1 = CallGraph.Make(p1);
            cg2 = CallGraph.Make(p2);
            Initialize(p1, p2, mergedProgram, p1Prefix, p2Prefix, cfg1);
            MutualSummaryStart(mergedProgram);


            //If inferContracts is specified, then we call Houdini and do Inference and persist output into mergedProgram
            //add the flags for /inferContracts to Boogie
            if (useHoudini && houdiniInferOpt == Options.INFER_OPT.HOUDINI) PerformHoudiniInferece();
        }

        /// <summary>
        /// Reads mergedProgSingle directly
        /// </summary>
        public static void PerformHoudiniInferece()
        {
            Console.WriteLine("Performing Houdini inference from within Symdiff.exe ");

            Options.VerboseBoogieEnvironment = true; //just to debug
            BoogieUtils.BoogieOptions.UseUnsatCoreForContractInfer = true; //ROHIT
            BoogieUtils.BoogieOptions.PrintInstrumented = true;
            BoogieUtils.BoogieOptions.UseSubsumption = CoreOptions.SubsumptionOption.Never;
            BoogieUtils.BoogieOptions.ContractInfer = true;

            //TODO: need to pass inferContracts options that run_symdiff_bpl passed to Boogie.exe
            var boogieOptions = " /typeEncoding:m /noinfer " + Options.BoogieUserOpts /* + " /trace " */;
            SDiff.Boogie.Process.InitializeBoogie(boogieOptions);
            var mps = Options.MergedProgramOutputFile; 
            var program = BoogieUtils.ParseProgram(mps);
            BoogieUtils.ResolveAndTypeCheckThrow(program, mps, BoogieUtils.BoogieOptions);             
            (new TaintBasedSimplification(program)).StartSimplifications();

            if (Options.dacConsiderChangedProcsUptoDistance >= 0)
            {
                var changedProcs = SymDiffUtils.Util.FindChangedMSProcs(program, Options.dacConsiderChangedProcsUptoDistance);
                new HoudiniAnalyzeImplSubset(program, changedProcs).Visit(program);
            }

            //if (Options.inlineDepthInferContracts == 0)
            //    new FreesPruning(program).Prune(); //this does not work well when inlining

            //prune existential vars not present in any exprs, otherwise printed the # of inferred annotations
            //they are removed either by DAC simplification (candidate -> free), or droppring procedures 
            new SymDiffUtils.HoudiniPruneUnusedExistentialConstants(program).Visit(program);


            var mpsPi = "mergedProgSingle_preInferred.bpl";
            BoogieUtils.PrintProgram(program, mpsPi);
            program = BoogieUtils.ParseProgram(mpsPi);
            BoogieUtils.ResolveAndTypeCheckThrow(program, mpsPi, BoogieUtils.BoogieOptions); 


            Console.WriteLine("Analyzing the list of implementations in Houdini = [{0}]",
                string.Join(",", program.TopLevelDeclarations.OfType<Implementation>().Select(x => x.Name)));
            Console.WriteLine("Inline depth for Houdini = {0}", Options.inlineDepthInferContracts);

            var oldInlineDepth = BoogieUtils.BoogieOptions.InlineDepth;
            BoogieUtils.BoogieOptions.InlineDepth = Options.inlineDepthInferContracts;
            //BoogieUtils.BoogieOptions.Trace = true; //uncomment to look into Houdini
            HoudiniSession.HoudiniStatistics houdiniStats = new HoudiniSession.HoudiniStatistics();
            Houdini houdini = new Houdini(Console.Out, BoogieUtils.BoogieOptions, program, houdiniStats);
            HoudiniOutcome outcome = houdini.PerformHoudiniInference().Result;
            houdini.Close();
            Console.WriteLine("Houdini statistics:: Prover Time {0} NumProver Queries {1} UnsatProver time {2} NumUnsat prunings {3}", 
                houdiniStats.proverTime,
                houdiniStats.numProverQueries,
                houdiniStats.unsatCoreProverTime,
                houdiniStats.numUnsatCorePrunings);
            //program changes due to Houdini transformations
            program = BoogieUtils.ParseProgram(mpsPi);
            BoogieUtils.ResolveAndTypeCheckThrow(program, mpsPi, BoogieUtils.BoogieOptions); 
            var trueConstants = extractVariableAssigned(true, outcome);
            var falseConstants = extractVariableAssigned(false, outcome);
            persistHoudiniInferredFacts(trueConstants, falseConstants, program, houdini);
            BoogieUtils.PrintProgram(program, "mergedProgSingle_inferred.bpl");
            Console.WriteLine("Houdini finished and inferred {0}/{1} contracts", trueConstants.Count, outcome.assignment.Count());
            Console.WriteLine("Houdini finished with {0} verified, {1} errors, {2} inconclusives, {3} timeouts",
                    outcome.Verified, outcome.ErrorCount, outcome.Inconclusives, outcome.TimeOuts);
            BoogieUtils.BoogieOptions.InlineDepth = oldInlineDepth;
        }

        private static void persistHoudiniInferredFacts(HashSet<string> trueConstants, HashSet<string> falseConstants, Program program, Houdini houdini)
        {
            new HoudiniInferredFilter(trueConstants, falseConstants, program, houdini).StartSimplifications();
        }
        private static HashSet<string> extractVariableAssigned(bool b, HoudiniOutcome outcome)
        {
            var trueConstants = new HashSet<string>();
            outcome.assignment.ForEach(kvp => { if (kvp.Value == b) trueConstants.Add(kvp.Key); });
            return trueConstants;
        }

        private static void ParseAddtionalMSFile(Program mergedProgram)
        {
            var ms_file = @".\ms_symdiff_file.bpl";
            if (!System.IO.File.Exists(ms_file)) return;
            Program ms = BoogieUtils.ParseProgram(ms_file);
            //TODO: Have to merge the new types (including datatypes)
            if (ms == null) throw new Exception("Parsing of ms_symdiff_file.bpl failed");
            mergedProgram.AddTopLevelDeclarations(ms.TopLevelDeclarations);
            mergedProgram.Resolve(BoogieUtils.BoogieOptions);
        }
        public static void Initialize(Program q1, Program q2, Program mp, string q1Prefix, string q2Prefix, Config cfg1)
        {
            mergedProgram = mp; p1Prefix = q1Prefix; p2Prefix = q2Prefix;
            var mpUses = Boogie.Process.GetUsedVariables(mergedProgram).GetUseSetForProgram(); 
            //look for uses in mergedProgram as some variables are not present in either q1 or q2 (e.g. OK)
            var allGlobals = mp.TopLevelDeclarations.OfType<GlobalVariable>()
                .Where(x => mpUses.Any(y => y.Name == x.Name));
            gSeq_p1 = q1.TopLevelDeclarations.OfType<GlobalVariable>()
                .Where(x => allGlobals.Any(y => y.Name == x.Name))  //ensure that the collection is non-empty
                .Select(x => allGlobals.Where(y => y.Name == x.Name).First()) 
                .ToList<Variable>();
            gSeq_p2 = q2.TopLevelDeclarations.OfType<GlobalVariable>()
                .Where(x => allGlobals.Any(y => y.Name == x.Name)) //ensure that the collection is non-empty
                .Select(x => allGlobals.Where(y => y.Name == x.Name).First())
                .ToList<Variable>();               

            summaryFuncs = new Dictionary<Procedure, Function>();
            cfg = cfg1;
            rootMSProcs = new HashSet<Procedure>();
            InitializeProcMaps(cfg);
            msFuncAxiomsAdded = new HashSet<Function>();
            abortVars = new Dictionary<Implementation, LocalVariable>();
        }

        private static void InitializeProcMaps(Config cfg)
        {
            implProcMap = new Dictionary<string, string>();
            stubProcMap = new Dictionary<string, string>();
            foreach (var kv in cfg.GetProcedureDictionary())
            {
                if (mergedProgram.Implementations.Where(i => i.Name == kv.Key).Count() != 0 &&
                    mergedProgram.Implementations.Where(i => i.Name == kv.Value).Count() != 0)
                    implProcMap.Add(kv.Key, kv.Value);
                else
                {
                    stubProcMap.Add(kv.Key, kv.Value);
                }
            }
        }

        private static void MutualSummaryStart(Program mergedProgram)
        {
            if (!dontUseMSAsAxioms)
            {
                var allProcs = new HashSet<Procedure>(mergedProgram.TopLevelDeclarations.OfType<Procedure>());
                foreach (Procedure f in allProcs)
                    CreateSummaryRelation(f);
            }
            foreach (var kv in stubProcMap)
            {
                Debug.Assert(false, string.Format("Stub encountered {0}...did you not run dependency.exe", kv.Key));
                //Console.WriteLine("StubMap: {0}, {1}", kv.Key, kv.Value);
                //var f1 = Util.getProcedureByName(mergedProgram, kv.Key);
                //var f2 = Util.getProcedureByName(mergedProgram, kv.Value);
                ////Create MSCheck procedure
                //AddDefaultStubSpec(f1, p1Prefix);
                //AddDefaultStubSpec(f2, p2Prefix);
            }
            foreach (var kv in implProcMap)
            {
                Console.WriteLine("ImplMap: {0}, {1}", kv.Key, kv.Value);
                var f1 = Util.getProcedureByName(mergedProgram, kv.Key);
                var f2 = Util.getProcedureByName(mergedProgram, kv.Value);
                //Create MSCheck procedure
                var msproc = FindOrCreateMSCheckProcedure(f1, f2);
                if (IsRootProcedures(f1, cg1) || IsRootProcedures(f2, cg2)) rootMSProcs.Add(msproc);
            }
            //this does not verify, and also produces @ symbols in the resulting printed file
            Util.DumpBplAST(mergedProgram, Options.MergedProgramOutputFile);
            if (typeCheckMergedProgram)
            {
                Log.Out(Log.Normal, "Resolving and typechecking");
                BoogieUtils.ResolveAndTypeCheckThrow(mergedProgram, Options.MergedProgramOutputFile, BoogieUtils.BoogieOptions);
            }

            if (callCorralOnMergedProgram)
                (new CorralChecker(mergedProgram, rootMSProcs)).CheckCandidateAsserts();
        }

        /// <summary>
        /// The default spec when at least one version is a stub is 
        /// output o_i = functionOf(params, modset)
        /// </summary>
        /// <param name="f1"></param>
        private static void AddDefaultStubSpec(Procedure f, string prefix)
        {
            Debug.Assert(mergedProgram.TopLevelDeclarations.OfType<Procedure>().Contains(f),
                string.Format("Procedure {0} does not belong to the mergedProgram", f.Name));
            //return;
            var outs = f.OutParams.Union(f.Modifies.Select(x => x.Decl));
            var ins = f.InParams.Union(f.Modifies.Select(x => x.Decl));
            foreach (Variable o in outs)
            {
                var oname = o is GlobalVariable ? Util.TrimPrefixWithDot(o.Name, prefix) : o.Name;
                var fnName = "StubFunction__" + Util.TrimPrefixWithDot(f.Name, prefix) + "_" + oname;
                Function oFunc = DeclUtils.MkOrGetFunc(mergedProgram, fnName, o.TypedIdent.Type, ins.Select(x => x.TypedIdent.Type).ToList());
                var fExpr = DeclUtils.MkFuncApp(oFunc, ins.Select(x => (Expr)Expr.Ident(x)).ToList());
                var ens = Expr.Eq(Expr.Ident(o), new OldExpr(Token.NoToken, fExpr));
                f.Ensures.Add(new Ensures(true, ens));
            }
        }

        //Creates R_f(in, old_g, g, out) and adds a free postcondtion to f
        private static void CreateSummaryRelation(Procedure p)
        {
            Debug.Assert(mergedProgram.TopLevelDeclarations.OfType<Procedure>().Contains(p),
                string.Format("Procedure {0} does not belong to the mergedProgram", p.Name));

            var globs = p.Name.StartsWith(p1Prefix) ? gSeq_p1 : gSeq_p2;
            List<TypeVariable> tS;
            var paramListR = GetParamsForSummaryRelation(p, globs, "", out tS); //its ok to have "" prefix when creating R_f1 and R_f2 separately
            Function funcR = new Function(new Token(), "R__" + p.Name, paramListR,
                new Formal(Token.NoToken, new TypedIdent(new Token(), "return", BasicType.Bool), false));
            mergedProgram.AddTopLevelDeclaration(funcR);
            var callR = new FunctionCall(funcR);
            var exprListR = new List<Expr>();
            exprListR.AddRange(Util.VarSeqToExprSeq(p.InParams));
            exprListR.AddRange(Util.VarSeqToOldExprSeq(globs));
            //exprListR.AddRange(Util.VarSeqToExprSeq(glob));
            exprListR.AddRange(p.Modifies);
            exprListR.AddRange(Util.VarSeqToExprSeq(p.OutParams));
            summaryFuncs[p] = funcR;
            p.Ensures.Add(new Ensures(true, new NAryExpr(new Token(), callR, exprListR)));
        }
        //returns {in} U {old_g} U {g} U {out}, in/out have to renamed to avoid clash when creating MS(...) args
        private static List<Variable> GetParamsForSummaryRelation(Procedure p, List<Variable> globs, string prefix,
            out List<TypeVariable> typeSeq, bool includeGlobals = true, bool includeInputs = true, bool includeOutputs = true, bool includeOldGlobals = true)
        {
            Debug.Assert(mergedProgram.TopLevelDeclarations.OfType<Procedure>().Contains(p),
                string.Format("Procedure {0} does not belong to the mergedProgram", p.Name));

            var paramListR = new List<Variable>();
            typeSeq = new List<TypeVariable>();
            if (includeInputs)
            {
                foreach (Variable x in p.InParams)
                {
                    paramListR.Add(B.Factory.MakeFormal(prefix + "." + x.Name, x.TypedIdent.Type, false));
                }
            }
            if (includeOldGlobals) //for constructing args of a procedure, we don't need the globals
            {
                //foreach (IdentifierExpr g in p.Modifies/*globs*/)
                foreach (Variable g in globs)
                {
                    paramListR.Add(new Formal(Token.NoToken, new TypedIdent(Token.NoToken, g.Name + "_old", g.TypedIdent.Type), false));
                }
            }
            if (includeGlobals) //for constructing args of a procedure, we don't need the globals
            {
                foreach (IdentifierExpr g in p.Modifies /*globs*/)
                //foreach(Variable g in globs) //Can limit this to only the modifies set
                {
                    paramListR.Add(new Formal(Token.NoToken, new TypedIdent(Token.NoToken, g.Name + "_", g.Type), false));
                }
            }
            if (includeOutputs)
            {
                foreach (Variable x in p.OutParams)
                {
                    paramListR.Add(B.Factory.MakeFormal(prefix + "." + x.Name, x.TypedIdent.Type, false));
                }
            }
            return paramListR;
        }
        /// <summary>
        /// Creates MS_f1_f2(...) and adds the axiom connecting with R_f1 and R_f2
        /// </summary>
        /// <param name="f1"></param>
        /// <param name="f2"></param>
        /// <returns></returns>
        private static Function CreateMutualSummaryRelation(Procedure f1, Procedure f2)
        {
            Debug.Assert(mergedProgram.TopLevelDeclarations.OfType<Procedure>().Contains(f1), string.Format("Procedure {0} does not belong to the mergedProgram", f1.Name));
            Debug.Assert(mergedProgram.TopLevelDeclarations.OfType<Procedure>().Contains(f2), string.Format("Procedure {0} does not belong to the mergedProgram", f2.Name));

            var predicates = new List<Expr>();
            //pull this earlier as we need them irrespective if msFunc is defined in the ms_symdiff_file.bpl
            var msFuncParams = new List<Variable>();
            List<TypeVariable> tS;
            var i1 = GetParamsForSummaryRelation(f1, gSeq_p1, p1Prefix, out tS, false, true, false, true); //inputs for f1
            var i2 = GetParamsForSummaryRelation(f2, gSeq_p2, p2Prefix, out tS, false, true, false, true); //inputs for f2
            var o1 = GetParamsForSummaryRelation(f1, gSeq_p1, p1Prefix, out tS, true, false, true, false); //outputs for f1
            var o2 = GetParamsForSummaryRelation(f2, gSeq_p2, p2Prefix, out tS, true, false, true, false); //outputs for f2
            var a1 = new List<Variable>(); a1.AddRange(i1); a1.AddRange(o1);  //GetParamsForSummaryRelation(f1, gSeq_p1, p1Prefix, out tS);
            var a2 = new List<Variable>(); a2.AddRange(i2); a2.AddRange(o2);  //GetParamsForSummaryRelation(f2, gSeq_p2, p2Prefix, out tS);
            msFuncParams.AddRange(a1);
            msFuncParams.AddRange(a2);

            var msfuncName = "MS$" + f1.Name + "$" + f2.Name;
            Function msFunc = mergedProgram.TopLevelDeclarations.FirstOrDefault(x => (x is Function) && ((Function)x).Name == msfuncName) as Function;
            if (msFunc != null) //present 
            {
                if (msFuncAxiomsAdded.Contains(msFunc)) //already done processing this function
                    return msFunc;
            }
            else //create the new function
            {
                var pm = cfg.FindProcedure(f1.Name, f2.Name);
                msFunc = new Function(new Token(), msfuncName,
                    msFuncParams,
                    new Formal(new Token(), new TypedIdent(new Token(), "ret", BasicType.Bool), false));
                msFunc.Body = MkMutualSummaryBody(f1, f2, pm, i1, o1, i2, o2);
                mergedProgram.AddTopLevelDeclaration(msFunc);
                msFunc.AddAttribute("inline", new Expr[] { Expr.True });
            }
            //Check if predicates are specified for non-stub pair
            if (IsNonStubProcedurePair(f1, cg1, f2, cg2))
                GenerateMSFuncBodyFromPredicates(msFunc, i1, i2, o1, o2);

            if (dontUseMSAsAxioms) return msFunc;

            //Add the MS axiom (only when we use the R_f relations)
            var r1 = summaryFuncs[f1];
            var r2 = summaryFuncs[f2];
            var cr1 = new FunctionCall(r1);
            var cr2 = new FunctionCall(r2);
            var cms = new FunctionCall(msFunc);

            List<Expr> exprsR1 = Util.VarSeqToExprSeq(a1);
            List<Expr> exprsR2 = Util.VarSeqToExprSeq(a2);
            List<Expr> exprsMS = Util.VarSeqToExprSeq(msFuncParams);

            var r1call = new NAryExpr(Token.NoToken, cr1, exprsR1);
            var r2call = new NAryExpr(Token.NoToken, cr2, exprsR2);
            var TriggerSeq = new List<Expr>();
            TriggerSeq.Add(r1call);
            TriggerSeq.Add(r2call);

            Axiom MSAxiom = new Axiom(new Token(),
                new ForallExpr(new Token(), msFuncParams, new Trigger(new Token(), true, TriggerSeq), Expr.Imp(Expr.And(r1call, r2call),
                    new NAryExpr(new Token(), cms, exprsMS))));
            mergedProgram.AddTopLevelDeclaration(MSAxiom);
            msFuncAxiomsAdded.Add(msFunc);
            return msFunc;
        }

        /// <summary>
        /// Generate teh body of MS$_f1_f2/MS_pre_f1_f2 with a candidate ensures based on relational predicates + predicates provided by user
        /// For MS_pre, o1 and o2 should be empty lists
        /// </summary>
        /// <param name="msFunc"></param>
        /// <param name="i1"></param>
        /// <param name="i2"></param>
        /// <param name="o1"></param>
        /// <param name="o2"></param>
        private static void GenerateMSFuncBodyFromPredicates(Function msFunc, List<Variable> i1, List<Variable> i2, List<Variable> o1, List<Variable> o2)
        {
            if (houdiniInferOpt == Options.INFER_OPT.ABS_HOUDINI)
            {
                bool allPreds, predicateAttrPresent;
                var userPreds = GetPredicatesFromFunc(msFunc, out allPreds, out predicateAttrPresent)
                    .Select(x => MkExprWithAttr(x, "", new List<object>() { }));

                //ensure that the body is 'true' in case a predicate is specified
                var msBodyExpr = msFunc.Body as LiteralExpr;
                var trivialBodyPresent = (msBodyExpr != null && msBodyExpr.IsTrue);
                Debug.Assert(!predicateAttrPresent || trivialBodyPresent,
                    string.Format("Predicates provided in {0} with non-trivial body {1}",
                    msFunc.Name, msFunc.Body));
                if (!trivialBodyPresent) return; //ignore any predicates 

                if (allPreds)
                {
                    //only consider predicates provided explicitly by user
                    var absHoudiniPred1 = DACHoudiniTemplates.FreshAbsHoudiniPred(userPreds.Count());
                    var expr = new NAryExpr(Token.NoToken,
                        new FunctionCall(absHoudiniPred1),
                        userPreds.Select(x => x.Expr).ToList());
                    msFunc.Body = expr;
                    return;
                }


                var andExpr = (Expr)Expr.True;
                var inpPreds = CreateVariableSeqComparisons(i1, i2).Union(userPreds);
                var outPreds = CreateVariableSeqComparisons(o1, o2).Union(userPreds);

                var args = inpPreds.Union(outPreds);
                var absHoudiniPred = DACHoudiniTemplates.FreshAbsHoudiniPred(args.Count());
                andExpr = Expr.And(andExpr, new NAryExpr(Token.NoToken, new FunctionCall(absHoudiniPred), args.Select(x => x.Expr).ToList()));

                #region Split predicates by output (expensive)
                if (false)
                {
                    //I = input preds, O = output preds, Q = user preds 
                    //I' = I U Q
                    //O' = O U Q
                    //foreach o in O'  pred(I' U o)
                    if (outPreds.Count() == 0)
                    {
                        absHoudiniPred = DACHoudiniTemplates.FreshAbsHoudiniPred(inpPreds.Count());
                        andExpr = new NAryExpr(Token.NoToken,
                            new FunctionCall(absHoudiniPred),
                            inpPreds.Select(x => x.Expr).ToList());
                    }
                    else
                    {
                        andExpr = (Expr)Expr.True;
                        foreach (var op in outPreds)
                        {
                            args = inpPreds.Union(new List<ExprWithAttributes>() { op });
                            absHoudiniPred = DACHoudiniTemplates.FreshAbsHoudiniPred(args.Count());
                            andExpr = Expr.And(andExpr, new NAryExpr(Token.NoToken, new FunctionCall(absHoudiniPred), args.Select(x => x.Expr).ToList()));
                        }
                    }
                }
                #endregion
                msFunc.Body = andExpr;
            }
        }
        /// <summary>
        /// Creates MS_pre$f1$f2(...) and adds it as requires to MS_Check_f1_f2
        /// </summary>
        /// <param name="f1"></param>
        /// <param name="f2"></param>
        /// <returns></returns>
        private static Function CreateMutualPreconditionRelation(Procedure f1, Procedure f2)
        {
            Debug.Assert(mergedProgram.TopLevelDeclarations.OfType<Procedure>().Contains(f1), string.Format("Procedure {0} does not belong to the mergedProgram", f1.Name));
            Debug.Assert(mergedProgram.TopLevelDeclarations.OfType<Procedure>().Contains(f2), string.Format("Procedure {0} does not belong to the mergedProgram", f2.Name));

            var predicates = new List<Expr>();
            //pull this earlier as we need them irrespective if msFunc is defined in the ms_symdiff_file.bpl
            var msPreFuncParams = new List<Variable>();
            List<TypeVariable> tS;
            var i1 = GetParamsForSummaryRelation(f1, gSeq_p1, p1Prefix, out tS, false, true, false, true); //inputs for f1
            var i2 = GetParamsForSummaryRelation(f2, gSeq_p2, p2Prefix, out tS, false, true, false, true); //inputs for f2
            var a1 = new List<Variable>(); a1.AddRange(i1);
            var a2 = new List<Variable>(); a2.AddRange(i2);
            msPreFuncParams.AddRange(a1);
            msPreFuncParams.AddRange(a2);

            var msPreFuncName = "MS_pre_$" + f1.Name + "$" + f2.Name;
            Function msPreFunc = mergedProgram.TopLevelDeclarations.FirstOrDefault(x => (x is Function) && ((Function)x).Name == msPreFuncName) as Function;
            if (msPreFunc != null) //present 
            {
                if (msFuncAxiomsAdded.Contains(msPreFunc)) //already done processing this function
                    return msPreFunc;
            }
            else //create the new function
            {
                var pm = cfg.FindProcedure(f1.Name, f2.Name);
                msPreFunc = new Function(new Token(), msPreFuncName,
                    msPreFuncParams,
                    new Formal(new Token(), new TypedIdent(new Token(), "ret", BasicType.Bool), false));
                msPreFunc.Body = Expr.True;
                mergedProgram.AddTopLevelDeclaration(msPreFunc);
                msPreFunc.AddAttribute("inline", new Expr[] { Expr.True });
            }

            if (!IsEntryProcedurePair(f1, cg1, f2, cg2))
                GenerateMSFuncBodyFromPredicates(msPreFunc, i1, i2, new List<Variable>(), new List<Variable>());

            return msPreFunc;
        }

        /// <summary>
        /// allPreds = true if only these predicates have to be used for Boolean combination
        /// 
        /// </summary>
        /// <param name="msFunc"></param>
        /// <param name="allPreds"></param>
        /// <returns></returns>
        private static List<Expr> GetPredicatesFromFunc(Function msFunc, out bool allPreds, out bool predicateAttrPresent)
        {
            allPreds = false; //true only when predicate_ms_only is specified
            predicateAttrPresent = true; //no {:predicate_ms .. } or {:predicate_ms_only ..}  present
            var preds = new List<Expr>();
            var attr1 = msFunc.FindAttribute("predicates_ms");
            var attr2 = msFunc.FindAttribute("predicates_ms_only");
            Debug.Assert(!(attr1 != null && attr2 != null),
                string.Format("At most only one of two attributes 'predicates_ms' or 'predicaes_ms_only' can be present for {0}", msFunc.Name));
            if (attr1 == null && attr2 == null) { predicateAttrPresent = false; return new List<Expr>(); }
            var attr = attr1 != null ? attr1 : attr2;
            allPreds = attr1 != null ? false : true;
            Console.WriteLine("Predicates for {0} = [{1}]", msFunc.Name, string.Join(", ", attr.Params));
            return attr.Params.Select(x => (Expr)x).ToList();
        }

        //Creates the body of the mutual summary
        //Currently simply creates 1-1 equality between two lists (i1 == i2 ==> o1 == o2)
        //TODO: use the parameter mappinging from CFG
        //TODO: use mutual summary inference to fill up the body
        private static Expr MkMutualSummaryBodyOneOne(Procedure f1, Procedure f2, ParamMap pm, List<Variable> i1, List<Variable> o1, List<Variable> i2, List<Variable> o2)
        {
            Debug.Assert(mergedProgram.TopLevelDeclarations.OfType<Procedure>().Contains(f1), string.Format("Procedure {0} does not belong to the mergedProgram", f1.Name));
            Debug.Assert(mergedProgram.TopLevelDeclarations.OfType<Procedure>().Contains(f2), string.Format("Procedure {0} does not belong to the mergedProgram", f2.Name));

            Expr pre = Expr.True;
            var b1 = i1.Count <= i2.Count ? i1 : i2;
            var b2 = i1.Count <= i2.Count ? i2 : i1;
            for (int i = 0; i < b1.Count; ++i)
            {
                var ei = Expr.Eq(Expr.Ident(b1[i]), Expr.Ident(b2[i]));
                pre = Expr.And(pre, ei);
            }
            Expr post = Expr.True;
            var c1 = o1.Count <= o2.Count ? o1 : o2;
            var c2 = o1.Count <= o2.Count ? o2 : o1;
            for (int i = 0; i < c1.Count; ++i)
            {
                var ei = Expr.Eq(Expr.Ident(c1[i]), Expr.Ident(c2[i]));
                post = Expr.And(post, ei);
            }
            return Expr.Imp(pre, post);
        }
        //this creats i1 == i2 ==> o1 == o2
        //where we map i to map(i) if present
        private static Expr MkMutualSummaryBody(Procedure f1, Procedure f2, ParamMap pm, List<Variable> i1, List<Variable> o1, List<Variable> i2, List<Variable> o2)
        {
            if (useHoudini) return Expr.True; //we will have cpre/cpost instead

            Expr pre = CreateVariableEqualities(i1, i2);
            Expr post = CreateVariableEqualities(o1, o2);
            return Expr.Imp(pre, post);
        }

        /// <summary>
        /// Class for attaching attribute to an expression
        /// </summary>
        class ExprWithAttributes
        {
            public Expr Expr { get; set; }
            public QKeyValue Attribute { get; set; }
            public ExprWithAttributes(Expr e, QKeyValue a) { Expr = e; Attribute = a; }
        }

        private static List<ExprWithAttributes> CreateIdentExprSeqComparisons(List<IdentifierExpr> i1, List<IdentifierExpr> i2)
        {
            var ret = new List<ExprWithAttributes>();
            foreach (IdentifierExpr u in i1)
            {
                //find p2prefix + (i1[i] - p1prefix) in i2
                foreach (IdentifierExpr v in i2)
                    if (Util.TrimPrefixWithDot(v.Name, p2Prefix) == Util.TrimPrefixWithDot(u.Name, p1Prefix))
                    {
                        ret.AddRange(CreateVariableComparisons(u.Decl, v.Decl));
                        break;
                    }
            }
            return ret;
        }
        private static List<ExprWithAttributes> CreateVariableSeqComparisons(List<Variable> i1, List<Variable> i2)
        {
            var ret = new List<ExprWithAttributes>();
            foreach (Variable u in i1)
            {
                //find p2prefix + (i1[i] - p1prefix) in i2
                foreach (Variable v in i2)
                    if (Util.TrimPrefixWithDot(v.Name, p2Prefix) == Util.TrimPrefixWithDot(u.Name, p1Prefix))
                    {
                        ret.AddRange(CreateVariableComparisons(u, v));
                        break;
                    }
            }
            return ret;
        }
        private static ExprWithAttributes MkExprWithAttr(Expr e, string s, List<object> l)
        {
            return new ExprWithAttributes(e, new QKeyValue(Token.NoToken, s, l, null));
        }

        private static List<ExprWithAttributes> CreateVariableComparisons(Variable u, Variable v)
        {

            var ret = new List<ExprWithAttributes>();
            var ue = Expr.Ident(u);
            var ve = Expr.Ident(v);
            Debug.Assert(u.TypedIdent.Type.Equals(v.TypedIdent.Type), "Expecting equal types for compared variables" + u + ", " + v);
            var t = u.TypedIdent.Type;
            if (t.Equals(Microsoft.Boogie.Type.Bool))
            {
                ret.Add(MkExprWithAttr(Expr.Imp(ue, ve), "DAC_IMPLIES", new List<object>() { ue, ve }));
                ret.Add(MkExprWithAttr(Expr.Imp(ve, ue), "DAC_IMPLIES", new List<object>() { ve, ue }));
            }
            else if (t.Equals(Microsoft.Boogie.Type.Int))
            {
                ret.Add(MkExprWithAttr(Expr.Le(ue, ve), "DAC_LE", new List<object>() { ue, ve }));
                ret.Add(MkExprWithAttr(Expr.Le(ve, ue), "DAC_LE", new List<object>() { ve, ue }));
            }
            else
                ret.Add(MkExprWithAttr(Expr.Eq(ue, ve), "DAC_EQ", new List<object>() { ue, ve }));
            return ret;
        }
        private static Expr CreateVariableEqualities(List<Variable> i1, List<Variable> i2)
        {
            Expr pre = Expr.True;
            foreach (Variable u in i1)
            {
                //find p2prefix + (i1[i] - p1prefix) in i2
                foreach (Variable v in i2)
                    if (Util.TrimPrefixWithDot(v.Name, p2Prefix) == Util.TrimPrefixWithDot(u.Name, p1Prefix))
                    {
                        var ei = Expr.Eq(Expr.Ident(u), Expr.Ident(v));
                        pre = Expr.And(pre, ei);
                        break;
                    }
            }
            return pre;
        }
        private static Variable GetOKVariable(List<Variable> vs, string prefix)
        {
            foreach (Variable v in vs)
                if (Util.TrimPrefixWithDot(v.Name, prefix) == "OK")
                    return v;
            return null;
        }
        //Creates the MS_Check_f1_f2(x1, x2) returns (r1, r2) {... } 
        //creates nested MS_Check_f1_f2 procedure/impls 
        private static Procedure FindOrCreateMSCheckProcedure(Procedure f1, Procedure f2)
        {
            Debug.Assert(mergedProgram.TopLevelDeclarations.OfType<Procedure>().Contains(f1), string.Format("Procedure {0} does not belong to the mergedProgram", f1.Name));
            Debug.Assert(mergedProgram.TopLevelDeclarations.OfType<Procedure>().Contains(f2), string.Format("Procedure {0} does not belong to the mergedProgram", f2.Name));


            var procName = "MS_Check_" + f1.Name + "__" + f2.Name;
            var proc = Util.getProcedureByName(mergedProgram, procName);
            if (proc != null) return proc;

            var ivarSeq = new List<Variable>();
            var tvarSeq = new List<TypeVariable>();
            List<TypeVariable> t1;
            var a1 = GetParamsForSummaryRelation(f1, null, p1Prefix, out t1, false, true, false, false);
            List<TypeVariable> t2;
            var a2 = GetParamsForSummaryRelation(f2, null, p2Prefix, out t2, false, true, false, false);
            ivarSeq.AddRange(a1); ivarSeq.AddRange(a2);
            var b1 = GetParamsForSummaryRelation(f1, null, p1Prefix, out t1, false, false, true, false);
            var b2 = GetParamsForSummaryRelation(f2, null, p2Prefix, out t2, false, false, true, false);
            var ovarSeq = new List<Variable>();
            ovarSeq.AddRange(b1); ovarSeq.AddRange(b2);

            //ensures MS_f1_f2(x1, old(g1), g1, r1, x2, old(g2), g2, r2);
            var exprListR = new List<Expr>();
            exprListR.AddRange(Util.VarSeqToExprSeq(a1));
            exprListR.AddRange(Util.VarSeqToOldExprSeq(gSeq_p1));
            //exprListR.AddRange(Util.VarSeqToExprSeq(gSeq_p1));
            exprListR.AddRange(f1.Modifies);
            exprListR.AddRange(Util.VarSeqToExprSeq(b1));
            exprListR.AddRange(Util.VarSeqToExprSeq(a2));
            exprListR.AddRange(Util.VarSeqToOldExprSeq(gSeq_p2));
            //exprListR.AddRange(Util.VarSeqToExprSeq(gSeq_p2));
            exprListR.AddRange(f2.Modifies);
            exprListR.AddRange(Util.VarSeqToExprSeq(b2));
            var ensuresSeq = new List<Ensures>();
            var ms = CreateMutualSummaryRelation(f1, f2);
            var callMS = new FunctionCall(ms);
            ensuresSeq.Add(new Ensures(false, new NAryExpr(new Token(), callMS, exprListR)));
            var requiresSeq = new List<Requires>();
            var msPre = CreateMutualPreconditionRelation(f1, f2);
            var callMSPre = new FunctionCall(msPre);
            exprListR = new List<Expr>();
            exprListR.AddRange(Util.VarSeqToExprSeq(a1));
            exprListR.AddRange(gSeq_p1.Select(x => IdentifierExpr.Ident(x)));
            exprListR.AddRange(Util.VarSeqToExprSeq(a2));
            exprListR.AddRange(gSeq_p2.Select(x => IdentifierExpr.Ident(x)));
            requiresSeq.Add(new Requires(false, new NAryExpr(new Token(), callMSPre, exprListR)));

            if (Options.checkEquivWithDependencies)
            {
                //Can't do it earlier as we need the variables for the MS_f1_f2 procedures that are only created in this 
                //method (e.g. a1, a2, b1, b2)
                Debug.Assert(freeContracts, "-checkEquivWithDependencies requires -freeContracts flag to be on");
                ParseTaintAndDependenciesForProc(f1, p1Prefix, gSeq_p1, a1, b1);
                ParseTaintAndDependenciesForProc(f2, p2Prefix, gSeq_p2, a2, b2);
            }

            if (useHoudini)
            {
                if (!callCorralOnMergedProgram) //Corral only expects equiv specs
                    DACHoudiniTemplates.AddHoudiniTemplates(ref requiresSeq, ref ensuresSeq, f1, f2, a1, a2, b1, b2);
                if (Options.checkEquivWithDependencies) //add in addition to regular DAC candidates as well
                    EquivWithDependencyHoudiniTemplates.AddHoudiniTemplates(ref requiresSeq, ref ensuresSeq, f1, f2, a1, a2, b1, b2);
            }
            //create signature (x1, x2) : (r1, r2)
            Procedure mschkProc =
                new Procedure(Token.NoToken,
                    procName,
                    new List<TypeVariable>(),
                    ivarSeq,
                    ovarSeq,
                    isPure:false,
                    requiresSeq,
                    new List<IdentifierExpr>(),
                    ensuresSeq);
            mschkProc.AddAttribute("MS_procs", f1.Name, f2.Name);
            mergedProgram.AddTopLevelDeclaration(mschkProc);
            //don't create body if either procedure does not have a body
            if (IsStubProcedure(f1) || IsStubProcedure(f2))
            {
                Debug.Assert(false, string.Format("No stub procedure expected {0} {1}, did you do stubInlining?", f1.Name, f2.Name));
                //remember to add the modset from the declarations as /doModsetAnalysis will keep the modset as {}
                mschkProc.Modifies.AddRange(f1.Modifies);
                mschkProc.Modifies.AddRange(f2.Modifies);
                return mschkProc;
            }
            ///////////////// The body of ms_check_f1_f2 ///////////////////
            //block: r1 := callCmd(f1, x1);
            //block: r2 := callCmd(f2, x2);
            var cmds = new List<Cmd>();
            var c1 = new CallCmd(Token.NoToken, f1.Name, B.U.ExprSeqOfVariableSeq(a1), B.U.IdentifierExprSeqOfVariableSeq(b1));
            c1.Proc = f1;
            cmds.Add(c1);
            var c2 = new CallCmd(Token.NoToken, f2.Name, B.U.ExprSeqOfVariableSeq(a2), B.U.IdentifierExprSeqOfVariableSeq(b2));
            c2.Proc = f2;
            cmds.Add(c2);
            var block = new Block(Token.NoToken, "START", cmds, new ReturnCmd(Token.NoToken));
            var bbl = new List<Block>();
            bbl.Add(block);
            Implementation mschkImpl =
                new Implementation(Token.NoToken,
                    procName,
                    new List<TypeVariable>(),
                    ivarSeq,
                    ovarSeq,
                    new List<Variable>(),
                    bbl
                    );
            mschkImpl.Proc = mschkProc;
            mergedProgram.AddTopLevelDeclaration(mschkImpl);

            //inline f1, f2
            //The inline:spec inlines a procedure with {:inline 1} 1 times and uses the call for deeper calls
            var boogieOptions = " -inline:spec " + Options.BoogieUserOpts;
            SDiff.Boogie.Process.InitializeBoogie(boogieOptions);
            Util.InlineProcsInCaller(mergedProgram, mschkImpl, new Procedure[] { f1, f2 });
            //Add additional instrumentation for 2->1 program transformation
            if (dontUseMSAsAxioms)
                TrapCallArgs(mergedProgram, mschkImpl, f1, f2);
            //throw new NotImplementedException();
            return mschkProc;
        }

        private static void ParseTaintAndDependenciesForProc(Procedure f, string prefix,
            List<Variable> globals, List<Variable> ins, List<Variable> outs)
        {
            Debug.Assert(mergedProgram.TopLevelDeclarations.OfType<Procedure>().Contains(f), string.Format("Procedure {0} does not belong to the mergedProgram", f.Name));

            dependency[f] = new Dictionary<Variable, List<Variable>>();
            //get the dependecies
            foreach (var en in f.Ensures)
            {
                if (en.Attributes == null || en.Attributes.Key != "io_dependency") continue;
                var deps = en.Attributes.Params.Select(x => x.ToString()).ToList();
                Debug.Assert(deps.Count() > 0, "A dependency needs to at least have the output variable");
                var ovar = Util.getVariableByName(prefix + "." + deps[0], globals.Union(outs));
                deps.RemoveAt(0);
                var ivars = deps.Select(x => Util.getVariableByName(prefix + "." + x, globals.Union(ins)));
                //Console.WriteLine("Dependency[{2}]: {0} -> {1}", ovar.Name, string.Join(", ", ivars.Select(x => x.Name)),f.Name);
                dependency[f][ovar] = ivars.ToList();
            }
            //Sometimes (in hte presence of non-terminating recursion foo(x) { foo(x+1); }, the dependency set can be empty
            outs.Union(f.Modifies.Select(x => x.Decl))
                .ForEach(v =>
                    {
                        if (!dependency[f].ContainsKey(v)) dependency[f][v] = new List<Variable>();
                    });
            Debug.Assert(dependency[f].Keys.Count() == outs.Count + f.Modifies.Count,
                string.Format("Mismatched number of output variables and io_dependency annotations for {0}", f.Name));

            //TODO: This part should be deprecated as we already look for tainted variables (input/output/summary)
            //get the set of bottom up taints
            bool foundBottomUpTaintedInfo = false; //whether we have any annotation about "bottomup_tainted_vars"
            foreach (var en in f.Ensures)
            {
                if (en.Attributes == null || en.Attributes.Key != "bottomup_tainted_vars") continue;
                foundBottomUpTaintedInfo = true;
                var varNames = en.Attributes.Params.Select(x => x.ToString()).ToList();
                var ovars = varNames.Select(x => Util.getVariableByName(prefix + "." + x, globals.Union(outs)));
                //Console.WriteLine("BottomUpTaint[{0}] = [{1}]", f.Name, string.Join(",", ovars.Select(y => y.Name)));
                bottomUpTaintVars[f] = new HashSet<Variable>(ovars);
            }
            if (!foundBottomUpTaintedInfo)
            {
                //Console.WriteLine("Warning! Found no bottomup_tainted_vars attributes (forgot /abstractNonTainted?), making all outputs + modifies tainted");
                bottomUpTaintVars[f] = new HashSet<Variable>(outs.Union(f.Modifies.Select(x => x.Decl))); //assume all are tainted
            }
        }


        //methods specific to 2->1 program translation
        private static void TrapCallArgs(Program mergedProgram, Implementation f, Procedure f1, Procedure f2)
        {
            Debug.Assert(mergedProgram.TopLevelDeclarations.OfType<Procedure>().Contains(f1), string.Format("Procedure {0} does not belong to the mergedProgram", f1.Name));
            Debug.Assert(mergedProgram.TopLevelDeclarations.OfType<Procedure>().Contains(f2), string.Format("Procedure {0} does not belong to the mergedProgram", f2.Name));

            int pairCnt = 0;
            if (f == null) return;
            var cr = new CallInstrumentforDAC(mergedProgram, f, f1, f2, p1Prefix, p2Prefix);
            cr.VisitImplementation(f);
            Block nxtBlock = null; //its the label of the next block
            List<Block> extraBlocks = new List<Block>(); //new blocks created
            //We reverse the keys so that MS_f_f' comes after MS_g_g' if f << g in block order
            if (dacEncoding == Options.DAC_ENCODING_OPT.DAC_LINEAR)
                Console.WriteLine("Using the DAC_LINEAR option that is more compact but may lose precision. Remove -dacEncodingLinear option to use the more precise encoding");
            Dictionary<string, int> v1ProcInstance = new Dictionary<string, int>();
            foreach (var h1 in cr.calleeArgs.Keys.Reverse())
            {
                foreach (var h2 in cr.calleeArgs.Keys.Reverse())
                {
                    if (implProcMap.Contains(new KeyValuePair<string, string>(h1.Name, h2.Name)))
                    {
                        int i1 = 0, i2; //callsite number
                        foreach (Tuple<Variable, List<Variable>, List<Variable>> ca1 in cr.calleeArgs[h1])
                        {
                            i2 = 0;
                            i1++;
                            foreach (Tuple<Variable, List<Variable>, List<Variable>> ca2 in cr.calleeArgs[h2])
                            {
                                i2++;
                                //[DAC_LINEAR] keep track of the occurrence of each procedure to be able to map (ith version of foo, ith version of foo') 
                                if (dacEncoding != Options.DAC_ENCODING_OPT.DAC_LINEAR ||
                                    i1 == i2)
                                    MkMSCallCmds(f, f1, f2, h1, h2, ca1, ca2, pairCnt++, ref nxtBlock, ref extraBlocks);
                            }
                        }
                    }
                }
            }
            //change any return --> goto nxtBlock; return, which makes the return unreachable
            //careful not to add the extraBlocks as they have a return too that will get rewritten
            if (nxtBlock != null)
            {
                if (checkMutualPreconditionsForInfiniteLoops)
                {
                    var sb = new AbortInstrumentForDAC(nxtBlock);
                    sb.VisitImplementation(f);
                }

                var rc = new RedirectReturnForDAC(nxtBlock);
                rc.VisitImplementation(f);
            }
            //now add the new blocks
            foreach (Block b in extraBlocks)
                f.Blocks.Add(b);
        }
        private static void MkMSCallCmds(Implementation f, Procedure f1, Procedure f2,
             Procedure h1, Procedure h2,
             Tuple<Variable, List<Variable>, List<Variable>> cargs1,
             Tuple<Variable, List<Variable>, List<Variable>> cargs2,
            int pairCnt,
            ref Block nxtBlock,
            ref List<Block> newBlocks)
        {
            Debug.Assert(mergedProgram.TopLevelDeclarations.OfType<Procedure>().Contains(f1), string.Format("Procedure {0} does not belong to the mergedProgram", f1.Name));
            Debug.Assert(mergedProgram.TopLevelDeclarations.OfType<Procedure>().Contains(f2), string.Format("Procedure {0} does not belong to the mergedProgram", f2.Name));

            var cmds = new List<Cmd>();
            //guard it if the calls have been made along the path
            var b1 = cargs1.Item1;
            var b2 = cargs2.Item1;

            //store the mod globals for the parent functions
            var modStores1 = new List<Variable>();
            var modStores2 = new List<Variable>();
            foreach (IdentifierExpr g in f1.Modifies) modStores1.Add(B.Factory.MakeLocal("store__" + pairCnt + "_" + g.Name, g.Type));
            foreach (IdentifierExpr g in f2.Modifies) modStores2.Add(B.Factory.MakeLocal("store__" + pairCnt + "_" + g.Name, g.Type));
            var cmd0 = Util.MkAssignCmdIdentSeq(modStores1, f1.Modifies);
            if (cmd0 != null) cmds.Add(cmd0);
            var cmd1 = Util.MkAssignCmdIdentSeq(modStores2, f2.Modifies);
            if (cmd1 != null) cmds.Add(cmd1);
            f.LocVars.AddRange(new List<Variable>(modStores1.ToArray()));
            f.LocVars.AddRange(new List<Variable>(modStores2.ToArray()));
            //extract the inps/globals, outs/globals
            List<Variable> in1_g, in2_g, in1_p, in2_p; //part of input for input globals and params
            List<Variable> out1_g, out2_g, out1_p, out2_p; //part of output for modified globals
            Util.PartitionVarListByIndex(cargs1.Item2, h1.InParams.Count, out in1_g, out in1_p);
            Util.PartitionVarListByIndex(cargs1.Item3, h1.OutParams.Count, out out1_g, out out1_p);
            Util.PartitionVarListByIndex(cargs2.Item2, h2.InParams.Count, out in2_g, out in2_p);
            Util.PartitionVarListByIndex(cargs2.Item3, h2.OutParams.Count, out out2_g, out out2_p);

            //set the globals to the recoreded value
            var cmd2 = Util.MkAssignCmdIdentSeq(f1.Modifies, new List<IdentifierExpr>(in1_g.Map(x => Expr.Ident(x)).ToArray()));
            if (cmd2 != null) cmds.Add(cmd2);
            var cmd3 = Util.MkAssignCmdIdentSeq(f2.Modifies, new List<IdentifierExpr>(in2_g.Map(x => Expr.Ident(x)).ToArray()));
            if (cmd3 != null) cmds.Add(cmd3);

            ////call (o1,o2) := MS_f1_f2(i1,i2);
            var call_out = new List<Variable>();
            call_out.AddRange(out1_p.Map(x => B.Factory.MakeLocal("out_" + x.Name + "_" + pairCnt, x.TypedIdent.Type)));
            call_out.AddRange(out2_p.Map(x => B.Factory.MakeLocal("out_" + x.Name + "_" + pairCnt, x.TypedIdent.Type)));
            var call_in = new List<Expr>();
            call_in.AddRange(new List<Expr>(in1_p.Map(x => Expr.Ident(x)).ToArray()));
            call_in.AddRange(new List<Expr>(in2_p.Map(x => Expr.Ident(x)).ToArray()));
            var callee = FindOrCreateMSCheckProcedure(h1, h2);
            var call_out_exprs = new List<IdentifierExpr>(call_out.Map(x => Expr.Ident(x)).ToArray());
            var cmd4 = new CallCmd(Token.NoToken, callee.Name, call_in, call_out_exprs);
            cmds.Add(cmd4);
            cmd4.Proc = callee; //to fool the typechecker
            f.LocVars.AddRange(new List<Variable>(call_out.ToArray()));

            //assume outs == recorded outs
            var h1mods = Util.IdentSeqToIdentList(h1.Modifies);
            var h2mods = Util.IdentSeqToIdentList(h2.Modifies);
            var cmd5 = new AssumeCmd(Token.NoToken, h1mods.Zip(out1_g, (x, y) => Expr.Eq(x, Expr.Ident(y))).Aggregate((Expr)Expr.True, (a, b) => Expr.And(a, b)));
            var cmd6 = new AssumeCmd(Token.NoToken, h2mods.Zip(out2_g, (x, y) => Expr.Eq(x, Expr.Ident(y))).Aggregate((Expr)Expr.True, (a, b) => Expr.And(a, b)));
            var out_p = out1_p.Concat(out2_p);
            var cmd7 = new AssumeCmd(Token.NoToken, out_p.Zip(call_out, (x, y) => Expr.Eq(Expr.Ident(x), Expr.Ident(y))).Aggregate((Expr)Expr.True, (a, b) => Expr.And(a, b)));
            cmds.Add(cmd5); cmds.Add(cmd6); cmds.Add(cmd7);
            //restore the globals
            var cmd8 = Util.MkAssignCmdIdentSeq(f1.Modifies, new List<IdentifierExpr>(modStores1.Map(x => Expr.Ident(x)).ToArray()));
            if (cmd8 != null) cmds.Add(cmd8);
            var cmd9 = Util.MkAssignCmdIdentSeq(f2.Modifies, new List<IdentifierExpr>(modStores2.Map(x => Expr.Ident(x)).ToArray()));
            if (cmd9 != null) cmds.Add(cmd9);
            //var cmds = new List<Cmd>() { cmd0, cmd1, cmd2, cmd3, cmd4, cmd5, cmd6, cmd7, cmd8, cmd9 };

            //L0: goto L1, L2
            //L1: assume b1 && b2; {.. call MS_check_h1_h2(); ...;} goto L3;
            //L2: assume !(b1 && b2);  goto L3;
            //L3: goto nxtBlock; //except for the first block which is return;
            Block bl0, bl1, bl2, bl3;
            var exprTaken = Expr.And(Expr.Ident(cargs1.Item1), Expr.Ident(cargs2.Item1));
            var assumeTaken = new AssumeCmd(Token.NoToken, exprTaken);
            var assumeNotTaken = new AssumeCmd(Token.NoToken, Expr.Not(exprTaken));
            var transferCmd = nxtBlock == null ?
                (new ReturnCmd(Token.NoToken) as TransferCmd) :
                (new GotoCmd(Token.NoToken, new List<Block>() { nxtBlock }) as TransferCmd);
            var meetCmds = new List<Cmd>();
            if (checkMutualPreconditionsForInfiniteLoops)
                meetCmds.Add(new AssumeCmd(Token.NoToken, Expr.Not(new IdentifierExpr(Token.NoToken, abortVars[f]))));
            bl3 = new Block(Token.NoToken, "MS_L_meet_" + pairCnt, meetCmds, transferCmd);
            var cmds1 = new List<Cmd>(); cmds1.Add(assumeTaken); cmds1.AddRange(cmds);
            bl1 = new Block(Token.NoToken, "MS_L_taken_" + pairCnt, cmds1, new GotoCmd(Token.NoToken, new List<Block>() { bl3 }));
            bl2 = new Block(Token.NoToken, "MS_L_not_taken_" + pairCnt, new List<Cmd>() { assumeNotTaken }, new GotoCmd(Token.NoToken, new List<Block>() { bl3 }));
            bl0 = new Block(Token.NoToken, "MS_L_0_" + pairCnt, new List<Cmd>(), new GotoCmd(Token.NoToken, new List<Block>() { bl1, bl2 }));
            nxtBlock = bl0; //destination of previous block
            newBlocks.AddRange(new List<Block>() { bl0, bl1, bl2, bl3 });

            //add the commands before the return statement
            //var rc = new ReturnInstrumentforDAC(cmds);
            //rc.VisitImplementation(f);

        }
        public static void GetCallCmdArgsForDAC(List<Expr> vars, string name, List<IdentifierExpr> globs, out List<Variable> ins, out List<Expr> callInps, string tag)
        {
            callInps = new List<Expr>(vars); //make a copy, otherwise vars will be changed
            callInps.AddRange(globs);
            ins = new List<Variable>();
            var incnt = 0;
            foreach (var i in callInps)
                ins.Add(new LocalVariable(Token.NoToken, new TypedIdent(Token.NoToken, name + tag + (incnt++), i.Type)));
        }

        //callgraph related methods
        //TODO: the CallGraph is over individual program, but f is from mergedProgram
        public static bool IsRootProcedures(Procedure f, CallGraph cg)
        {
            var n1 = cg.NodeOfName(f.Name); //have to lookup by name since f is not in cg
            if (n1 == null) return false;
            if (cg.Roots.Contains(n1))
                return true;
            return false;
        }
        public static bool IsStubProcedure(Procedure f1)
        {
            return (Util.getImplByName(mergedProgram, f1.Name) == null);
        }
        //check on MS_f_f' for a pair of procedures
        public static bool IsEntryProcedurePair(Procedure f1, CallGraph cg1, Procedure f2, CallGraph cg2)
        {
            return IsRootProcedures(f1, cg1) || IsRootProcedures(f2, cg2);
        }
        public static bool IsNonStubProcedurePair(Procedure f1, CallGraph cg1, Procedure f2, CallGraph cg2)
        {
            return !IsStubProcedure(f1) && !IsStubProcedure(f2);
        }


        /// <summary>
        /// class for houdini related stuff for DAC (FSE'13 encoding)
        /// </summary>
        public static class DACHoudiniTemplates
        {
            //Adds candidate and non-candidates for the MS procedures based on whether they are roots, leaves or neither
            static HashSet<Constant> houdiniGuards = new HashSet<Constant>();
            static HashSet<Function> absHoudiniFunctions = new HashSet<Function>();
            public static void AddHoudiniTemplates(ref List<Requires> requiresSeq, ref List<Ensures> ensuresSeq, Procedure f1, Procedure f2,
                List<Variable> i1, List<Variable> i2, List<Variable> o1, List<Variable> o2)
            {
                if (IsEntryProcedurePair(f1, cg1, f2, cg2))
                {
                    AddDACCheck(ref requiresSeq, ref ensuresSeq, f1, f2, i1, i2, o1, o2);
                    AddCandEnsures(ref ensuresSeq, f1, f2, i1, i2, o1, o2, true); //add any other posts
                    return;
                }
                if (IsNonStubProcedurePair(f1, cg1, f2, cg2))
                    AddCandEnsures(ref ensuresSeq, f1, f2, i1, i2, o1, o2, true);
                else
                    AddCandEnsures(ref ensuresSeq, f1, f2, i1, i2, o1, o2, false); //trust that outputs are equal
                AddCandRequires(ref requiresSeq, f1, f2, i1, i2, o1, o2); //we already know that both f1/f2 are non-entry procedures
                //add candidates for loop extracted procedures
                if (f1.Name.Contains("_loop_"))
                    AddLoopEnsures(f1, p1Prefix);
                if (f2.Name.Contains("_loop_"))
                    AddLoopEnsures(f2, p2Prefix);
                return;
            }
            private static void AddLoopEnsures(Procedure f, string prefix)
            {
                var i = f.InParams;
                var o = f.OutParams;
                //name starts with _v1.in_/_v2.in
                //get {x | in_x in i, out_x in o}
                var inouts = new HashSet<Tuple<Variable, Variable>>(); //(in,out)
                i.ForEach(x => o.ForEach(y => inouts.Add(Tuple.Create(x, y))));
                var res = inouts
                    .Where(x => ((Variable)x.Item1).Name.Replace("in_", "")
                                            == ((Variable)x.Item2).Name.Replace("out_", ""));
                var comparisons = new HashSet<ExprWithAttributes>(); //comparisons
                res.ForEach(x => CreateVariableComparisons(x.Item1, x.Item2).ForEach(y => comparisons.Add(y)));
                var censures = comparisons.Select(x => new Ensures(false, MkCandidateExpr(x.Expr)));
                f.Ensures.AddRange(censures);
            }
            private static void AddCandRequires(ref List<Requires> requiresSeq, Procedure f1, Procedure f2,
                List<Variable> i1, List<Variable> i2, List<Variable> o1, List<Variable> o2,
                bool isCandidate = true)
            {
                var comps = CreateVariableSeqComparisons(i1, i2);
                comps.AddRange(CreateVariableSeqComparisons(gSeq_p1, gSeq_p2));
                List<Requires> crequires;
                if (isCandidate)
                    crequires = comps.Map(x => new Requires(Token.NoToken, false, MkCandidateExpr(x.Expr), "DAC candidate", x.Attribute));
                else
                    crequires = comps.Map(x => new Requires(false, x.Expr));
                requiresSeq.AddRange(new List<Requires>(crequires.ToArray()));
            }
            private static Expr MkCandidateExpr(Expr x)
            {
                if (houdiniInferOpt == Options.INFER_OPT.HOUDINI)
                {
                    return Expr.Imp(FreshHoudiniVar(), x);
                }
                else if (houdiniInferOpt == Options.INFER_OPT.ABS_HOUDINI)
                {
                    var f = FreshAbsHoudiniPred(1);
                    return new NAryExpr(Token.NoToken, new FunctionCall(f), new List<Expr>() { x });
                }
                throw new NotImplementedException();
            }
            private static Expr FreshHoudiniVar()
            {
                var n = new Constant(Token.NoToken, new TypedIdent(Token.NoToken, "_houdini_" + houdiniGuards.Count, Microsoft.Boogie.Type.Bool), false);
                n.AddAttribute("existential", Expr.True);
                houdiniGuards.Add(n);
                mergedProgram.AddTopLevelDeclaration(n);
                return Expr.Ident(n);
            }
            public static Function FreshAbsHoudiniPred(int arity)
            {
                var args = new List<Variable>();
                for (int i = 0; i < arity; ++i)
                    args.Add(new Formal(Token.NoToken, new TypedIdent(Token.NoToken, "i" + i, Microsoft.Boogie.Type.Bool), true));
                var f = new Function(Token.NoToken, "_abshoudini_" + absHoudiniFunctions.Count + "_" + arity, args,
                    new Formal(Token.NoToken, new TypedIdent(Token.NoToken, "r", Microsoft.Boogie.Type.Bool), false), "abshouini");
                f.AddAttribute("existential", Expr.True);
                absHoudiniFunctions.Add(f);
                mergedProgram.AddTopLevelDeclaration(f);
                return f;
            }
            private static void AddCandEnsures(ref List<Ensures> ensuresSeq, Procedure f1, Procedure f2,
                List<Variable> i1, List<Variable> i2, List<Variable> o1, List<Variable> o2,
                bool isCandidate = true)
            {
                var comps = CreateVariableSeqComparisons(o1, o2);
                comps.AddRange(CreateIdentExprSeqComparisons(f1.Modifies, f2.Modifies));
                List<Ensures> censures;
                if (isCandidate)
                    censures = comps.Map(x => new Ensures(Token.NoToken, false, MkCandidateExpr(x.Expr), "DAC candidate", x.Attribute));
                else
                {
                    //params1 U old(mod1) == params2 U old(mod) ==> mod1 U o1 == mod2 U o2
                    var inp = CreateVariableEqualities(i1, i2);
                    inp = new OldExpr(Token.NoToken,
                        Expr.And(inp, CreateVariableEqualities(Util.IdentSeqToVarSeq(f1.Modifies), Util.IdentSeqToVarSeq(f2.Modifies))));
                    var summ = comps.Aggregate((Expr)Expr.True, (x, y) => Expr.And(x, y.Expr));
                    censures = new List<Ensures>();
                    censures.Add(new Ensures(false, Expr.Imp(inp, summ)));
                }
                ensuresSeq.AddRange(new List<Ensures>(censures.ToArray()));
            }
            private static void AddDACCheck(ref List<Requires> requiresSeq, ref List<Ensures> ensuresSeq, Procedure f1, Procedure f2,
                List<Variable> i1, List<Variable> i2, List<Variable> o1, List<Variable> o2)
            {
                Expr pre = CreateVariableEqualities(i1, i2);
                pre = Expr.And(pre, CreateVariableEqualities(gSeq_p1, gSeq_p2));
                var ok1 = GetOKVariable(gSeq_p1, p1Prefix);
                var ok2 = GetOKVariable(gSeq_p2, p2Prefix);
                Expr post = Expr.True;
                if (ok1 != null && ok2 != null)
                    post = Expr.Imp(Expr.Ident(ok1), Expr.Ident(ok2));
                else
                    Console.WriteLine("---> Unable to find OK variables!!");
                //adding an implication does not help, as we need a pre that is equal
                requiresSeq.Add(new Requires(false, pre));
                ensuresSeq.Add(new Ensures(false, post));
            }
        }

        /// <summary>
        /// class for houdini related stuff for DAC (checking equivalence using dependencies. Sept 2014)
        /// </summary>
        public static class EquivWithDependencyHoudiniTemplates
        {
            static HashSet<Constant> houdiniGuards = new HashSet<Constant>();
            //Adds candidate and non-candidates for the MS procedures based on whether they are roots, leaves or neither

            public static void AddHoudiniTemplates(ref List<Requires> requiresSeq, ref List<Ensures> ensuresSeq, Procedure f1, Procedure f2,
                List<Variable> i1, List<Variable> i2, List<Variable> o1, List<Variable> o2)
            {
                //we are going to add 
                //cand ensures dep(o) == dep(o') ==> o == o' for every o in output
                //we do this for roots, non-roots (no more stubs as expanded in front end)
                //AddCandEnsures(ref ensuresSeq, f1, f2, i1, i2, o1, o2); //without dependencies
                AddCandEnsuresWithDependency(ref ensuresSeq, f1, f2, i1, i2, o1, o2);
                if (Options.checkEquivForRoots && (IsRootProcedures(f1, cg1) || IsRootProcedures(f2, cg2)))
                {
                    //if mainprocedure is specified we only add it 
                    if (Options.mainProcedure == null)
                        AddCandEnsuresWithDependency(ref ensuresSeq, f1, f2, i1, i2, o1, o2, false);
                    else if (f1.Name.Contains(Options.mainProcedure)) // only if it matches main
                        AddCandEnsuresWithDependency(ref ensuresSeq, f1, f2, i1, i2, o1, o2, false);

                }
                return;
            }
            private static Expr FreshHoudiniVar(string procName, string tag)
            {
                var n = new Constant(Token.NoToken,
                    new TypedIdent(Token.NoToken, "_houdini_" + procName + "_" + tag + "_" + houdiniGuards.Count, Microsoft.Boogie.Type.Bool), false);
                n.AddAttribute("existential", Expr.True);
                houdiniGuards.Add(n);
                mergedProgram.AddTopLevelDeclaration(n);
                return Expr.Ident(n);
            }
            //create ensures Dep(o1) == Dep(o2) => o1 == o2, 
            private static void AddCandEnsuresWithDependency(ref List<Ensures> ensuresSeq, Procedure f1, Procedure f2,
                List<Variable> i1, List<Variable> i2, List<Variable> o1, List<Variable> o2,
                bool isCandidate = true)
            {
                if (!dependency.ContainsKey(f1) || !dependency.ContainsKey(f2))
                    return;
                var fname = Util.TrimPrefixWithDot(f1.Name, p1Prefix);
                List<Ensures> censures = new List<Ensures>();
                Comparison<Variable> varOrder = delegate(Variable x, Variable y) { return x.Name.CompareTo(y.Name); };
                var og1 = o1.Union(gSeq_p1).ToList();
                var og2 = o2.Union(gSeq_p2).ToList();
                og1.Sort(varOrder); og2.Sort(varOrder);
                //pair variables by names
                List<Variable> mismatch1, mismatch2;  
                var l12 = FindMatchingPairs(og1, og2, p1Prefix, p2Prefix, out mismatch1, out mismatch2);
                foreach (var o12 in l12)
                {
                    // Fix: we want to consider the cases when o12 is only assigned on one of the sides
                    if (!dependency[f1].ContainsKey(o12.Item1) && !dependency[f2].ContainsKey(o12.Item2)) continue;
                    List<Variable> dep1, dep2;
                    dependency[f1].TryGetValue(o12.Item1, out dep1); if (dep1 == null) dep1 = new List<Variable>();
                    dependency[f2].TryGetValue(o12.Item2, out dep2); if (dep2 == null) dep2 = new List<Variable>();
                    //TODO: for named inputs (e.g. result.get_char$23 and result.get_char$24 on two sides, there is no named mapping)
                    MakeDependenciesIdentical(dep1, dep2, i2.Union(gSeq_p2), p1Prefix, p2Prefix); //updates dep2 with dep1\dep2
                    MakeDependenciesIdentical(dep2, dep1, i1.Union(gSeq_p1), p2Prefix, p1Prefix); //updates dep1 with dep2\dep1
                    dep1.Sort(varOrder); dep2.Sort(varOrder);
                    if (dep1.Count != dep2.Count)
                    {
                        Util.PrintError(string.Format("WARNING: Expecting cardinality of dependencies for {0} to be identical. No candidate variable ", o12.Item1.Name));
                        var ens = new Ensures(false,
                                Expr.Imp(FreshHoudiniVar(fname, Util.TrimPrefixWithDot(o12.Item1.Name, p1Prefix)), Expr.False));
                        ensuresSeq.Add(ens);
                        continue; //we add a dummy houdini variable just to be able to count this output variable
                    }
                    //Debug.Assert(dep1.Count == dep2.Count, string.Format("Expecting cardinality of dependencies for {0} to be identical", o12.Item1.Name));
                    Expr pre = new OldExpr(Token.NoToken, CreateVariableEqualities(dep1, dep2));
                    Expr post = Expr.Imp(pre, Expr.Eq((Expr)IdentifierExpr.Ident(o12.Item1), (Expr)IdentifierExpr.Ident(o12.Item2)));
                    Ensures ens1 = null;
                    if (bottomUpTaintVars[f1].Contains(o12.Item1) || bottomUpTaintVars[f2].Contains(o12.Item2))
                    {
                        if (isCandidate)
                        {
                            //Add a candidate houdini variable only when the static analysis thinks at least one of them is tainted
                            ens1 = new Ensures(false, Expr.Imp(FreshHoudiniVar(fname, Util.TrimPrefixWithDot(o12.Item1.Name, p1Prefix)), post));
                            ens1.Attributes = new QKeyValue(Token.NoToken, "DAC_SUMMARY", new List<object> { Expr.Ident(o12.Item1), Expr.Ident(o12.Item2) }, null);
                        }
                        else
                        {
                            //Add a true postcondition only when the static analysis thinks at least one of them is tainted
                            ens1 = new Ensures(false, post);
                            ens1.Attributes = new QKeyValue(Token.NoToken, "TOP_LEVEL_EQUIV_CHECK", new List<object> { Expr.Ident(o12.Item1), Expr.Ident(o12.Item2) }, null);
                        }
                    }
                    else
                    {
                        //Add a free ensures that will be assumed while inlining (needs the attribute "InlineAssume")
                        ens1 = new Ensures(true, post);
                        ens1.Attributes = new QKeyValue(Token.NoToken, "InlineAssume", new List<object>(), ens1.Attributes);
                    }
                    ensuresSeq.Add(ens1);
                }
            }

            private static void MakeDependenciesIdentical(List<Variable> dep1, List<Variable> dep2,
                IEnumerable<Variable> ins2, string prefix1, string prefix2)
            {
                foreach (var i in dep1)
                {
                    var name = Util.TrimPrefixWithDot(i.Name, prefix1);
                    if (dep2.Any(x => Util.TrimPrefixWithDot(x.Name, prefix2) == name)) continue;
                    var missing2 = ins2.Where(x => Util.TrimPrefixWithDot(x.Name, prefix2) == name);
                    if (missing2.Count() != 1)
                    {
                        Util.PrintError(string.Format("WARNING: Expecting exactly 1 match for {0}, found {1}", name, missing2.Count()));
                        throw new Exception("Getting hacky, aborting!!!!");
                    }
                    dep2.Add(missing2.First());
                }
            }
            /// <summary>
            /// Returns {(v1.x, v2.x) | v1.x in l1 and v2.x in l2}
            /// also returns the mismatched variables in l1 and l2
            /// </summary>
            /// <param name="l1"></param>
            /// <param name="l2"></param>
            /// <returns></returns>
            private static List<Tuple<Variable, Variable>> FindMatchingPairs(List<Variable> l1, List<Variable> l2,
                string prefix1, string prefix2, 
                out List<Variable> misMatched1, out List<Variable> misMatched2)
            {
                var pairList = new List<Tuple<Variable, Variable>>();
                misMatched1 = new List<Variable>();
                misMatched2 = new List<Variable>();
                foreach (var i in l1)
                {
                    var name = Util.TrimPrefixWithDot(i.Name, prefix1);
                    if (l2.Any(x => Util.TrimPrefixWithDot(x.Name, prefix2) == name))
                    {
                        var j = l2.First(x => Util.TrimPrefixWithDot(x.Name, prefix2) == name);
                        pairList.Add(Tuple.Create(i, j));
                        continue;
                    }
                    misMatched1.Add(i);
                }
                misMatched2 = l2.Where(x => !pairList.Select(y => y.Item2).Contains(x)).ToList();
                return pairList;
            }

        }


        //instrument a call to capture the args for 2->1 program transformation
        public class CallInstrumentforDAC : FixedVisitor
        {
            int callCnt;
            Program prog;
            Procedure f1, f2;
            string p1Prefix;
            string p2Prefix;
            public Dictionary<Procedure, List<Tuple<Variable, List<Variable>, List<Variable>>>> calleeArgs;
            Implementation impl;
            List<LocalVariable> callWitnessVars;

            public CallInstrumentforDAC(Program prog, Implementation impl, Procedure f1, Procedure f2, string p1Prefix, string p2Prefix)
            {
                this.prog = prog;
                this.p1Prefix = p1Prefix;
                this.p2Prefix = p2Prefix;
                calleeArgs = new Dictionary<Procedure, List<Tuple<Variable, List<Variable>, List<Variable>>>>();
                this.impl = impl;
                this.f1 = f1;
                this.f2 = f2;
                this.callCnt = 0;
                callWitnessVars = new List<LocalVariable>();
            }
            public override Block VisitBlock(Block b)
            {
                var cmds = new List<Cmd>();
                foreach (var c in b.Cmds)
                    if (c is CallCmd)
                    {
                        callCnt++;
                        //for a call o = call(i)
                        var c1 = c as CallCmd;
                        var name = c1.Proc.Name;

                        List<Variable> ins, outs;
                        List<Expr> callInps, callOuts;

                        //I = i U mod-globs(f1)
                        //mod-globals(caller) \superseteq mod-globals(callee)
                        var gl = (c1.Proc.Name.StartsWith(p1Prefix + ".") ? f1.Modifies : f2.Modifies);
                        var globs = new List<IdentifierExpr>();
                        foreach (IdentifierExpr g in gl) globs.Add(g);
                        GetCallCmdArgsForDAC(c1.Ins, name, globs, out ins, out callInps, "_in_" + callCnt + "_");
                        var cmd0 = Util.MkAssignCmdExprSeq(ins, new List<Expr>(callInps.ToArray()));
                        if (cmd0 != null) cmds.Add(cmd0);

                        //add the call
                        cmds.Add(c);

                        //Add a Variable to denote the call was made
                        var calldone = B.Factory.MakeLocal(name + "_" + callCnt + "_done", Microsoft.Boogie.Type.Bool);
                        var tmp0 = new List<Variable>(); tmp0.Add(calldone);
                        var tmp1 = new List<Expr>(); tmp1.Add(Expr.True);
                        cmds.Add(Util.MkAssignCmdExprSeq(tmp0, tmp1));
                        impl.LocVars.Add(calldone); //init to false 
                        callWitnessVars.Add(calldone);

                        //O = o U mod_globs (callee)
                        List<IdentifierExpr> mods = new List<IdentifierExpr>();
                        foreach (IdentifierExpr m in c1.Proc.Modifies) mods.Add(m);
                        GetCallCmdArgsForDAC(c1.Outs.Map(x => x as Expr), name, mods, out outs, out callOuts, "_out_" + callCnt + "_");
                        var cmd1 = Util.MkAssignCmdExprSeq(outs, new List<Expr>(callOuts.ToArray()));
                        if (cmd1 != null) cmds.Add(cmd1);

                        //declare and store the locals
                        foreach (var i in ins) impl.LocVars.Add(i);
                        foreach (var i in outs) impl.LocVars.Add(i);
                        var args = Tuple.Create<Variable, List<Variable>, List<Variable>>(calldone, ins, outs);
                        if (!calleeArgs.ContainsKey(c1.Proc))
                            calleeArgs[c1.Proc] = new List<Tuple<Variable, List<Variable>, List<Variable>>>();
                        calleeArgs[c1.Proc].Add(args);
                    }
                    else
                        cmds.Add(c);
                Block newbl = new Block(Token.NoToken, b.Label, cmds, b.TransferCmd);
                return base.VisitBlock(newbl);
            }
            public override Implementation VisitImplementation(Implementation node)
            {
                var impl = base.VisitImplementation(node);
                //declare the abort variable
                if (checkMutualPreconditionsForInfiniteLoops)
                {
                    abortVars[node] = new LocalVariable(Token.NoToken, new TypedIdent(Token.NoToken, "abortVarSymDiff_" + node.Name, BasicType.Bool));
                    impl.LocVars.Add(abortVars[node]);
                }
                if (callWitnessVars.Count > 0)
                    impl.Blocks[0].Cmds.Add(new AssignCmd(Token.NoToken,
                        callWitnessVars.Map(x => (AssignLhs)new SimpleAssignLhs(Token.NoToken, Expr.Ident(x))),
                        callWitnessVars.Map(x => (Expr)Expr.False)));
                return impl;
            }
        }

        //split blocks after calls to add abortVar
        //only do this when checking mutual preconditions
        public class AbortInstrumentForDAC : FixedVisitor
        {
            Block nxtBlock;
            Implementation impl;
            public AbortInstrumentForDAC(Block nxtBlock)
            {
                this.nxtBlock = nxtBlock;
            }
            public override Implementation VisitImplementation(Implementation node)
            {
                Debug.Assert(checkMutualPreconditionsForInfiniteLoops, "This should only be invoked when checkMutualPrecondition flag is on");
                impl = node;
                var blks = node.Blocks;
                var newBlks = new List<Block>();
                foreach (Block b in blks)
                {
                    var splitBlks = SplitBlocksByCallsForAbort(b, 0);
                    newBlks.AddRange(splitBlks);
                }
                node.Blocks = newBlks;
                return base.VisitImplementation(node);
            }
            private List<Block> SplitBlocksByCallsForAbort(Block b, int level)
            {
                var i = b.Cmds.FindIndex(x => x is CallCmd);
                if (i == -1) return new List<Block>() { b };
                var abortVar = abortVars[impl];
                var normalAssume = new AssumeCmd(Token.NoToken, Expr.Not(new IdentifierExpr(Token.NoToken, abortVar)));
                var abortAssume = new AssumeCmd(Token.NoToken, (new IdentifierExpr(Token.NoToken, abortVar)));
                var newCmds = new List<Cmd>() { normalAssume };
                newCmds.AddRange(b.Cmds.GetRange(i + 1, b.Cmds.Count - i - 1));
                var blk1 = new Block(b.tok, b.Label + "__normal_" + level, newCmds, b.TransferCmd);
                var blk2 = new Block(b.tok, b.Label + "__abort_" + level, new List<Cmd>() { abortAssume }, new GotoCmd(Token.NoToken, new List<Block>() { nxtBlock }));
                b.Cmds = b.Cmds.GetRange(0, i + 1);
                b.Cmds.Add(new HavocCmd(Token.NoToken, new List<IdentifierExpr>() { new IdentifierExpr(Token.NoToken, abortVar) }));
                b.TransferCmd = new GotoCmd(Token.NoToken, new List<Block>() { blk1, blk2 });
                var nextBlocks = SplitBlocksByCallsForAbort(blk1, level + 1);
                return (new List<Block>() { b, blk2 }).Concat(nextBlocks).ToList();
            }
        }

        //instrument returns to add a sequence of commands
        public class ReturnInstrumentforDAC : FixedVisitor
        {
            List<Cmd> retcmds;
            public ReturnInstrumentforDAC(List<Cmd> cmds) { retcmds = cmds; }
            public override Block VisitBlock(Block b)
            {
                List<Cmd> ret = new List<Cmd>();
                if (!(b.TransferCmd is ReturnCmd)) return base.VisitBlock(b);
                b.Cmds.AddRange(retcmds);
                return base.VisitBlock(b);
            }
        }

        //return --> goto L, where L adds extra calls to MS_f1_f2 procedures
        public class RedirectReturnForDAC : FixedVisitor
        {
            Block nxtBlock;
            public RedirectReturnForDAC(Block nxt) { this.nxtBlock = nxt; }
            public override Block VisitBlock(Block b)
            {
                List<Cmd> ret = new List<Cmd>();
                if (!(b.TransferCmd is ReturnCmd)) return base.VisitBlock(b);
                b.TransferCmd = new GotoCmd(Token.NoToken, new List<Block>() { nxtBlock });
                return base.VisitBlock(b);
            }
        }
    }

    public class HoudiniInferredFilter : SimplificationVisitor
    {
        public static string HoudiniInferredAttribute = "inferred_houdini";
        public static string HoudiniInferredComment = "Houdini-Inferred DAC Candidate";
        private HashSet<string> trueHoudinis;
        private HashSet<string> falseHoudinis;
        private Houdini houdini;
        public HoudiniInferredFilter(HashSet<string> trueHoudinis, HashSet<string> falseHoudinis, Program p, Houdini h)
            : base(p, HoudiniInferredComment, HoudiniInferredAttribute)
        {
            this.trueHoudinis = trueHoudinis;
            this.falseHoudinis = falseHoudinis;
            this.houdini = h;
        }
        public override Procedure VisitProcedure(Procedure node)
        {
            var ensToAdd = new List<Ensures>();
            var ensToRem = new List<Ensures>();
            var reqToAdd = new List<Requires>();
            var reqToRem = new List<Requires>();

            foreach (var req in node.Requires)
            {
                string candidate;
                if (this.houdini.MatchCandidate(req.Condition, out candidate))
                {
                    if (this.trueHoudinis.Contains(candidate))
                    {
                        this.makeFreeRequires(node, req, reqToAdd, reqToRem);
                    }
                    else
                    {
                        Debug.Assert(this.falseHoudinis.Contains(candidate));
                        reqToRem.Add(req);
                    }

                }
            }
            foreach (var ens in node.Ensures)
            {
                string candidate;
                if (this.houdini.MatchCandidate(ens.Condition, out candidate))
                {
                    if (this.trueHoudinis.Contains(candidate))
                    {
                        this.makeFreeEnsures(node, ens, ensToAdd, ensToRem);
                    }
                    else
                    {
                        Debug.Assert(this.falseHoudinis.Contains(candidate));
                        ensToRem.Add(ens);
                    }

                }
            }

            reqToAdd.ForEach(node.Requires.Add);
            reqToRem.ForEach(x => node.Requires.Remove(x));
            ensToAdd.ForEach(node.Ensures.Add);
            ensToRem.ForEach(x => node.Ensures.Remove(x));
            return base.VisitProcedure(node);
        }
    }

}
