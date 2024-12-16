using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.IO;
using System.Diagnostics;
using System.Threading;
using Microsoft.Boogie;
using Microsoft.Boogie.VCExprAST;
using VC;
using Microsoft.BaseTypes;
using SymDiffUtils;
using BType = Microsoft.Boogie.Type;

namespace Rootcause
{
    class EqualityFixes
    {
        private static Stopwatch sw;

        //\phi becomes (phi_guard ==> \phi \land neg_phi_guard ==> \neg \phi)
        private static Constant phi_guard = null;
        private static Constant neg_phi_guard = null;

        //Since the original Blocks are destroyed after passification
        private static Dictionary<Cmd, Block> cmdToBlock = null;
        private static Dictionary<Block, List<Cmd>> blockToCmdSeq = null;
        private static Dictionary<AssignCmd, BigNum> CmdToSourceline = null;
        private static Dictionary<AssignCmd, Tuple<List<AssignCmd>, List<AssignCmd>>> cdfg = null;

        //Global set of outputs for the html output
        private static List<Tuple<BigNum, string, BigNum, string>> htmlOutputs = null;

        private static Program program = null;
        private static Implementation implementation = null;

        public static void PerformRootcause(Program prog, Implementation impl)
        {
            program = prog;
            implementation = impl;
            htmlOutputs = new List<Tuple<BigNum, string, BigNum, string>>();

            sw = Stopwatch.StartNew();

            (new Utils.ExtractCalleeConstVisitor()).Visit(program);
            (new Utils.MiscStatementPruner()).Visit(program);
            if (Options.liftConditionals) { Utils.liftConditionalsInCFG(program, implementation); }

            if (Utils.verbosityLevel(2))
            {
                Console.WriteLine("Phase 0.1: Source Transformation in {0}", sw.Elapsed.TotalSeconds);
            }

            Utils.PrintProg(program);

            Tuple<List<Block>, List<Block>> LR = Utils.GetLeftRightBlocks(implementation);
            List<Block> L = LR.Item1;
            List<Block> R = LR.Item2;
            //L and R are original program blocks

            cdfg = computeAssignmentCDFG(implementation);
            if (Utils.verbosityLevel(2))
            {
                Console.WriteLine("Phase 0.2: Computed CDFG in {0}", sw.Elapsed.TotalSeconds);
            }
            cmdToBlock = computeCmdToBlockMapping(L.Concat(R).ToList());
            blockToCmdSeq = computeBlockToCmdSeqMapping(L.Concat(R).ToList());
            CmdToSourceline = new Preprocessor(program, implementation).preprocess(L, R); //computes source lines

            if (Utils.verbosityLevel(2))
            {
                Console.WriteLine("Phase 0.3: Computed cmdToBlock,blockToCmdSeq,CmdToSourceline in {0}", sw.Elapsed.TotalSeconds);
            }

            Utils.PrintProg(program);
            Dictionary<Tuple<AssignCmd, Variable>, HashSet<Variable>> dependencies = new Dictionary<Tuple<AssignCmd, Variable>, HashSet<Variable>>();
            if (Options.independantFilter == FilterAction.Drop)
            {
                analyzeDependencies(program, implementation, L, R, dependencies);
                if (Utils.verbosityLevel(2))
                {
                    Console.WriteLine("Phase 0.4: Computed dependencies in {0}", sw.Elapsed.TotalSeconds);
                }
            }

            //Add assume (b) for each block on the left
            var guardBlocks = new GuardBlocks(program, implementation, L, R);
            guardBlocks.Visit(implementation);
            Tuple<Dictionary<Block, Constant>, Dictionary<Block, Constant>> assumeFalseConsts = guardBlocks.GetAssumeFalseConsts();

            if (Utils.verbosityLevel(2))
            {
                Console.WriteLine("Phase 0.5: Guarded assumes on Left in {0}", sw.Elapsed.TotalSeconds);
            }

            Dictionary<AssignCmd, Constant> assignAssertGuards = new Dictionary<AssignCmd, Constant>();
            Dictionary<AssignCmd, Constant> assignAssertConstants = new Dictionary<AssignCmd, Constant>();
            //introduces dummy asserts to move equalities earlier
            injectAssignAssertsOnRight(program, implementation, L, R, assignAssertGuards, assignAssertConstants);
            Utils.PrintProg(program);

            if (Utils.verbosityLevel(2))
            {
                Console.WriteLine("Phase 0.6: Instrumented assignment level asserts in {0}", sw.Elapsed.TotalSeconds);
            }

            //Inject assumes on Left program
            Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> leftAssumeConsts = new Dictionary<AssignCmd, List<Tuple<Variable, Constant>>>();
            injectAssumesOnLeft(program, implementation, L, R, leftAssumeConsts);
            Utils.PrintProg(program);
            //L contains injected assumes

            if (Utils.verbosityLevel(2))
            {
                Console.WriteLine("Phase 0.7: Instrumented constants on Left in {0}", sw.Elapsed.TotalSeconds);
            }

            //Inject assumes on Right program
            //Dictionary<Block(Right program), List<Tuple<Constant(Candidate, Block(Left program), Variable (right), Variable(left)>>>
            Dictionary<AssignCmd, List<Tuple<Constant, AssignCmd, Variable, Variable>>> rightCandidates =
                new Dictionary<AssignCmd, List<Tuple<Constant, AssignCmd, Variable, Variable>>>();
            Dictionary<AssignCmd, Expr> rightAxioms = new Dictionary<AssignCmd, Expr>();
            Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> rightAssumeConsts = new Dictionary<AssignCmd, List<Tuple<Variable, Constant>>>();
            injectAxiomsOnRight(program, implementation, L, R, leftAssumeConsts, rightCandidates, rightAxioms, rightAssumeConsts, dependencies);
            //L contains injected assumes, R contains candidate assumes
            Utils.PrintProg(program);

            if (Utils.verbosityLevel(2))
            {
                Console.WriteLine("Phase 0.8: Instrumented constants,axioms on Right in {0}", sw.Elapsed.TotalSeconds);
            }

            //Dictionary<Block, Constant> assertConsts = new Dictionary<Block, Constant>();
            //checking consistency checks at each block
            //curretnly turned off
            injectGuardedAssertsOnRight(program, implementation, L, R); //FIXME: We don't want assert False in final \phi block
            Utils.PrintProg(program);

            if (Utils.verbosityLevel(2))
            {
                Console.WriteLine("Phase 0.9: Guarded asserts on Right in {0}", sw.Elapsed.TotalSeconds);
            }

            //make program predicated
            Dictionary<AssignCmd, Dictionary<Variable, Constant>> predConsts = new Dictionary<AssignCmd, Dictionary<Variable, Constant>>();
            //x := if (g) e else havoc_x;
            guardAssignmentsOnRight(program, implementation, L, R, predConsts);
            Utils.PrintProg(program);

            if (Utils.verbosityLevel(2))
            {
                Console.WriteLine("Phase 0.10: predicate assignments on Right in {0}", sw.Elapsed.TotalSeconds);
            }

            //Dictionary<AssumeCmd, Constant> guardAssumeConsts = new Dictionary<AssumeCmd, Constant>();
            //assume e --> assume g => e, where g is a boolean const that we can toggle
            //if (Options.assumeToSkip)
            //{
            //    guardAssumesOnLeftRight(program, implementation, L, R, guardAssumeConsts);
            //}

            if (Utils.verbosityLevel(1))
            {
                Console.WriteLine("Phase 1: Instrumented Program in {0}", sw.Elapsed.TotalSeconds);
            }

            if (Utils.verbosityLevel(3))
            {
                foreach (Expr axiomExpr in rightAxioms.Values) { Console.WriteLine(axiomExpr); }
                foreach (AssignCmd key in rightCandidates.Keys)
                {
                    List<Tuple<Constant, AssignCmd, Variable, Variable>> listOfTuples = rightCandidates[key];
                    foreach (Tuple<Constant, AssignCmd, Variable, Variable> tuple in listOfTuples)
                    {
                        Console.WriteLine("Cause ==> Candidate: {0}\n leftAssign: {1} rightAssign: {2} left: {3}\n right: {4}",
                            tuple.Item1, tuple.Item2, key, tuple.Item4, tuple.Item3);
                    }
                }
            }


            //typecheck the instrumented program
            program.Resolve(BoogieUtils.BoogieOptions);
            program.Typecheck(BoogieUtils.BoogieOptions);

            //Generate VC
            VC.InitializeVCGen(program);
            VCExpr programVC = VC.GenerateVC(program, implementation);

            if (Utils.verbosityLevel(1))
            {
                Console.WriteLine("Phase 2: Generated VC in {0}", sw.Elapsed.TotalSeconds);
            }


            //Compute a model, and its counter-example
            //Compute model by disabling all candidate equality assumes

            //List<Constant> falseAssertConstants = assertConsts.Values.Aggregate(new List<Constant>(),
            //    (List<Constant> a, Constant b) => a.Concat(new Constant[] { b }).ToList<Constant>());
            //VCExpr allFalseAssertsDisabled = falseAssertConstants.ConvertAll<VCExpr>(x => VC.translator.LookupVariable(x)).
            //        Aggregate<VCExpr, VCExpr>(VCExpressionGenerator.True, (VCExpr a, VCExpr b) => VC.exprGen.And(a, VC.exprGen.Not(b)));

            List<Constant> falseAssignAssertConstants = assignAssertGuards.Values.Aggregate(new List<Constant>(),
                (List<Constant> a, Constant b) => a.Concat(new Constant[] { b }).ToList<Constant>());
            VCExpr falseAssignAssertConstantsDisabled = falseAssignAssertConstants.ConvertAll<VCExpr>(x => VC.translator.LookupVariable(x)).
                    Aggregate<VCExpr, VCExpr>(VCExpressionGenerator.True, (VCExpr a, VCExpr b) => VC.exprGen.And(a, VC.exprGen.Not(b)));

            VCExpr ensureAssert = VC.exprGen.And(VC.translator.LookupVariable(phi_guard), VC.exprGen.Not(VC.translator.LookupVariable(neg_phi_guard)));
            VCExpr ensureNegAssert = VC.exprGen.And(VC.translator.LookupVariable(neg_phi_guard), VC.exprGen.Not(VC.translator.LookupVariable(phi_guard)));
            VCExpr ensureEither = VCExpressionGenerator.True;

            VCExpr allCandidatesDisabled = listCandidates(rightCandidates, R, L).ConvertAll<VCExpr>(x => VC.translator.LookupVariable(x)).
                Aggregate<VCExpr, VCExpr>(VCExpressionGenerator.True, (VCExpr a, VCExpr b) => VC.exprGen.And(a, VC.exprGen.Not(b)));

            //make all predConsts true during MAXSAT (true means original assignments)
            List<Constant> allPredConst = predConsts.Values.Aggregate(new List<Constant>(),
                (List<Constant> aaa, Dictionary<Variable, Constant> bbb) => aaa.Concat(
                    bbb.Values.Aggregate(new List<Constant>(), (List<Constant> aaaa, Constant bbbb) => aaaa.Concat(new Constant[] { bbbb }).ToList())).ToList());
            VCExpr allPredConst_True = allPredConst.ConvertAll<VCExpr>(x => VC.translator.LookupVariable(x)).
                Aggregate<VCExpr, VCExpr>(VCExpressionGenerator.True, (VCExpr currentExpr, VCExpr nextConst) => VC.exprGen.And(currentExpr, nextConst));
            VCExpr allGuardConst_LeftTrue = assumeFalseConsts.Item1.Aggregate(VCExpressionGenerator.True, (a, b)
                => VC.exprGen.And(a, VC.translator.LookupVariable(b.Value)));
            VCExpr allGuardConst_RightTrue = assumeFalseConsts.Item2.Aggregate(VCExpressionGenerator.True, (a, b)
                => VC.exprGen.And(a, VC.translator.LookupVariable(b.Value)));
            VCExpr allGuardConst_True = VC.exprGen.And(allGuardConst_LeftTrue, allGuardConst_RightTrue);
            VCExpr allAssumeGuard_True = VCExpressionGenerator.True; /*guardAssumeConsts.Aggregate(VCExpressionGenerator.True, (a, b)
                => VC.exprGen.And(a, VC.translator.LookupVariable(b.Value)));*/

            VCExpr demonicAxiomVC = VCExpressionGenerator.True;
            if (Options.demonizeUninterpreted)
            {
                List<Expr> demonicAxioms = Utils.constructDemonicAxioms(program);
                demonicAxiomVC = demonicAxioms.ConvertAll<VCExpr>(x => VC.translator.Translate(x)).
                    Aggregate<VCExpr, VCExpr>(VCExpressionGenerator.True, (VCExpr currentExpr, VCExpr nextConst) => VC.exprGen.And(currentExpr, nextConst));
            }

            Counterexample failing_cex = getCounterExample(VC.exprGen.Implies(
                VC.exprGen.And(allAssumeGuard_True, VC.exprGen.And(falseAssignAssertConstantsDisabled, VC.exprGen.And(allGuardConst_True,
                VC.exprGen.And(allPredConst_True, VC.exprGen.And(allCandidatesDisabled, ensureAssert))))), programVC));

            if (failing_cex == null) { Console.WriteLine("Left and Right programs are equivalent. Exiting..."); return; }
            if (Options.findEarliestAssertionByMapMismatch)
            {
                List<Block> L_cex = blocksInCexPath(failing_cex, L);
                List<Block> R_cex = blocksInCexPath(failing_cex, R);
                VCExpr failing_or_passing_vc = VC.exprGen.Implies(
                    VC.exprGen.And(allAssumeGuard_True, VC.exprGen.And(falseAssignAssertConstantsDisabled, VC.exprGen.And(allGuardConst_True,
                    VC.exprGen.And(allPredConst_True, VC.exprGen.And(allCandidatesDisabled, ensureEither))))), programVC);
                Counterexample new_cex = FindCexWithFirstMemMismatch(failing_or_passing_vc, failing_cex, L_cex, R_cex, leftAssumeConsts, rightAssumeConsts);
                if (new_cex != null) { failing_cex = new_cex; }
            }


            List<Counterexample> passing_cexs = getCorrectExample(VC.exprGen.Implies(VC.exprGen.And(demonicAxiomVC,
                VC.exprGen.And(allAssumeGuard_True, VC.exprGen.And(falseAssignAssertConstantsDisabled, VC.exprGen.And(allGuardConst_True,
                VC.exprGen.And(allPredConst_True, VC.exprGen.And(allCandidatesDisabled, ensureNegAssert)))))), programVC));



            VC.FinalizeVCGen(program);

            if (Utils.verbosityLevel(1))
            {
                Console.WriteLine("Phase 3: Generated 1 failing and {1} passing cexs in {0}", sw.Elapsed,
                    (passing_cexs != null ? passing_cexs.Count : 0));
            }

            if (Options.htmlInput != "")
            {
                if (!matchCexHtmlLines(failing_cex, L, R)) { ; } // return; } //our failing cex is not the one shown in html
            }

            //Setup code has now finished.
            //Use an algorithm of choice to compute root causes
            //List<Constant> rootcauseCandidates = BlockByBlock(L, R, predConsts, leftAssumeConsts, rightCandidates, rightAxioms, assertConsts, assumeFalseConsts, programVC, cex);
            List<Constant> rootcauseCandidates = TopDown(L, R, predConsts, dependencies, leftAssumeConsts, rightAssumeConsts, rightCandidates, rightAxioms,
                                                    assumeFalseConsts, assignAssertGuards, assignAssertConstants, programVC, failing_cex, passing_cexs);

            if (Utils.verbosityLevel(1))
            {
                Console.WriteLine("Phase 6: Terminated rootcause analysis in {0}", sw.Elapsed.TotalSeconds);
            }

            foreach (Constant rootcauseCand in rootcauseCandidates)
            {
                printErrorReport(rightCandidates, rootcauseCand);
            }
            Utils.PrintHtmlOutput(htmlOutputs);

            if (rootcauseCandidates.Count == 0) { Console.WriteLine("Unable to find rootcause"); }
        }

        public static void PerformCEGIS(Program prog, Implementation impl)
        {
            program = prog;
            implementation = impl;
            htmlOutputs = new List<Tuple<BigNum, string, BigNum, string>>();

            sw = Stopwatch.StartNew();

            (new Utils.ExtractCalleeConstVisitor()).Visit(program);
            (new Utils.MiscStatementPruner()).Visit(program);

            List<Variable> ctobpl_consts = program.TopLevelDeclarations.Where(x => x is Constant).Cast<Variable>().
                Where(x => x.Name.Contains("ctobpl")).ToList<Variable>();
            program.RemoveTopLevelDeclarations(x => ctobpl_consts.Contains(x));

            if (Options.liftConditionals) { Utils.liftConditionalsInCFG(program, implementation); }

            if (Utils.verbosityLevel(2))
            {
                Console.WriteLine("Phase 0.1: Source Transformation in {0}", sw.Elapsed.TotalSeconds);
            }

            List<Variable> prog_inputs = new List<Variable>();
            //gather inputs, constants and globals
            foreach (Variable v in implementation.InParams) prog_inputs.Add(v);
            prog_inputs.AddRange(program.TopLevelDeclarations.Where(x => x is Constant).Cast<Variable>()
                .Where(x => true)); //constants

            prog_inputs.AddRange(program.GlobalVariables); //globals
            prog_inputs.RemoveAll(x => x.Name.Contains("ctobpl"));
            //it is not true that all the values are present as assignment of inputs/consts/globals/localvars,
            //some output of functions such as select don't appear in locvars
            //foreach (Variable v in impl.LocVars) inputs.Add(v); //incarnation variables h@1, h@3, ..
            List<Variable> prog_locals = prog_inputs.Concat(implementation.LocVars.Cast<Variable>()).ToList();
            List<Function> prog_fns = new List<Function>(program.TopLevelDeclarations.Where(x => x is Function).Cast<Function>());
            //Console.WriteLine("Inputs = {0}", String.Join(", ", prog_inputs.ConvertAll<string>(x => x.Name)));
            //Console.WriteLine("Funcs = {0}", String.Join(", ", prog_fns.ConvertAll<string>(x => x.Name)));

            StreamWriter writer = new StreamWriter(Options.outputPath + @"\rootcause_input" + Options.htmlTag + @".config", false);
            foreach (Variable v in prog_inputs) {
                writer.WriteLine("input: " + v.Name);
            }

            foreach (Function f in prog_fns) {
                writer.WriteLine("func: " + f.Name);
            }
            foreach (Variable v in prog_locals)
            {
                writer.WriteLine("local: " + v.Name);
            }

            Utils.PrintProg(program);

            Tuple<List<Block>, List<Block>> LR = Utils.GetLeftRightBlocks(implementation);
            List<Block> L = LR.Item1;
            List<Block> R = LR.Item2;
            //L and R are original program blocks

            cdfg = computeAssignmentCDFG(implementation);
            if (Utils.verbosityLevel(2))
            {
                Console.WriteLine("Phase 0.2: Computed CDFG in {0}", sw.Elapsed.TotalSeconds);
            }
            cmdToBlock = computeCmdToBlockMapping(L.Concat(R).ToList());
            blockToCmdSeq = computeBlockToCmdSeqMapping(L.Concat(R).ToList());
            CmdToSourceline = new Preprocessor(program, implementation).preprocess(L, R); //computes source lines

            if (Utils.verbosityLevel(2))
            {
                Console.WriteLine("Phase 0.3: Computed cmdToBlock,blockToCmdSeq,CmdToSourceline in {0}", sw.Elapsed.TotalSeconds);
            }

            Utils.PrintProg(program);
            Dictionary<Tuple<AssignCmd, Variable>, HashSet<Variable>> dependencies = new Dictionary<Tuple<AssignCmd, Variable>, HashSet<Variable>>();
            if (Options.independantFilter == FilterAction.Drop)
            {
                analyzeDependencies(program, implementation, L, R, dependencies);
                if (Utils.verbosityLevel(2))
                {
                    Console.WriteLine("Phase 0.4: Computed dependencies in {0}", sw.Elapsed.TotalSeconds);
                }
            }

            //Add assume (b) for each block on the left, used in /constrainLeftPath and /constrainRightPath
            var guardBlocks = new GuardBlocks(program, implementation, L, R);
            guardBlocks.Visit(implementation);
            Tuple<Dictionary<Block, Constant>, Dictionary<Block, Constant>> assumeFalseConsts = guardBlocks.GetAssumeFalseConsts();

            if (Utils.verbosityLevel(2))
            {
                Console.WriteLine("Phase 0.5: Guarded assumes on Left in {0}", sw.Elapsed.TotalSeconds);
            }

            //rootcause_ph_guard for toggling earlier asserts, used in /findEarliestMapEqualityMismatch
            Dictionary<AssignCmd, Constant> assignAssertGuards = new Dictionary<AssignCmd, Constant>();
            //used for dynamically setting what memory is used for the earlier asserts, used in /findEarliestMapEqualityMismatch
            Dictionary<AssignCmd, Constant> assignAssertConstants = new Dictionary<AssignCmd, Constant>();
            //introduces dummy asserts to move equalities earlier
            injectAssignAssertsOnRight(program, implementation, L, R, assignAssertGuards, assignAssertConstants);
            Utils.PrintProg(program);

            if (Utils.verbosityLevel(2))
            {
                Console.WriteLine("Phase 0.6: Instrumented assignment level asserts in {0}", sw.Elapsed.TotalSeconds);
            }

            //Inject assumes on Left program
            Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> leftAssumeConsts = new Dictionary<AssignCmd, List<Tuple<Variable, Constant>>>();
            injectAssumesOnLeft(program, implementation, L, R, leftAssumeConsts);
            Utils.PrintProg(program);
            //L contains injected assumes

            if (Utils.verbosityLevel(2))
            {
                Console.WriteLine("Phase 0.7: Instrumented constants on Left in {0}", sw.Elapsed.TotalSeconds);
            }

            //Inject assumes on Right program
            //Dictionary<Block(Right program), List<Tuple<Constant(Candidate, Block(Left program), Variable (right), Variable(left)>>>
            Dictionary<AssignCmd, List<Tuple<Constant, AssignCmd, Variable, Variable>>> rightCandidates =
                new Dictionary<AssignCmd, List<Tuple<Constant, AssignCmd, Variable, Variable>>>();
            Dictionary<AssignCmd, Expr> rightAxioms = new Dictionary<AssignCmd, Expr>();
            Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> rightAssumeConsts = new Dictionary<AssignCmd, List<Tuple<Variable, Constant>>>();
            injectAxiomsOnRightCEGIS(program, implementation, L, R, leftAssumeConsts, rightCandidates, rightAxioms, rightAssumeConsts, dependencies);
            //L contains injected assumes, R contains candidate assumes
            Utils.PrintProg(program);

            if (Utils.verbosityLevel(2))
            {
                Console.WriteLine("Phase 0.8: Instrumented constants,axioms on Right in {0}", sw.Elapsed.TotalSeconds);
            }

            //rootcause_phi_guard => phi /\ rootcause_neg_phi_guard => ~ phi
            injectGuardedAssertsOnRight(program, implementation, L, R); //FIXME: We don't want assert False in final \phi block
            Utils.PrintProg(program);

            if (Utils.verbosityLevel(2))
            {
                Console.WriteLine("Phase 0.9: Guarded asserts on Right in {0}", sw.Elapsed.TotalSeconds);
            }

            //make program predicated
            Dictionary<AssignCmd, Dictionary<Variable, Constant>> predConsts = new Dictionary<AssignCmd, Dictionary<Variable, Constant>>();
            //x := e --> x := if (!b_pred) then havoc_x else e;
            guardAssignmentsOnRight(program, implementation, L, R, predConsts);
            Utils.PrintProg(program);

            if (Utils.verbosityLevel(2))
            {
                Console.WriteLine("Phase 0.10: predicate assignments on Right in {0}", sw.Elapsed.TotalSeconds);
            }


            if (Utils.verbosityLevel(1))
            {
                Console.WriteLine("Phase 1: Instrumented Program in {0}", sw.Elapsed.TotalSeconds);
            }

            if (Utils.verbosityLevel(3))
            {
                foreach (Expr axiomExpr in rightAxioms.Values) { Console.WriteLine(axiomExpr); }
                foreach (AssignCmd key in rightCandidates.Keys)
                {
                    List<Tuple<Constant, AssignCmd, Variable, Variable>> listOfTuples = rightCandidates[key];
                    foreach (Tuple<Constant, AssignCmd, Variable, Variable> tuple in listOfTuples)
                    {
                        Console.WriteLine("Cause ==> Candidate: {0}\n leftAssign: {1} rightAssign: {2} left: {3}\n right: {4}",
                            tuple.Item1, tuple.Item2, key, tuple.Item4, tuple.Item3);
                    }
                }
            }

            foreach (Constant c in listCandidates(rightCandidates, R, L))
            {
                writer.WriteLine("Candidate: " + c.Name);
            }
            List<Constant> allPredConst = predConsts.Values.Aggregate(new List<Constant>(),
                (List<Constant> aaa, Dictionary<Variable, Constant> bbb) => aaa.Concat(
                    bbb.Values.Aggregate(new List<Constant>(), (List<Constant> aaaa, Constant bbbb)
                    => aaaa.Concat(new Constant[] { bbbb }).ToList())).ToList());
            foreach (Constant c in allPredConst)
            {
                writer.WriteLine("Beta: " + c.Name);
            }
            foreach (AssignCmd a in assignAssertGuards.Keys)
            {
                writer.WriteLine("AssignAssert: " +
                    "(" + assignAssertGuards[a].Name + "," + assignAssertConstants[a].Name + ")");
            }
            foreach (Constant c in assumeFalseConsts.Item1.Values)
            {
                writer.WriteLine("LeftGuard: " + c.Name);
            }
            foreach (Constant c in assumeFalseConsts.Item2.Values)
            {
                writer.WriteLine("RightGuard: " + c.Name);
            }
            writer.WriteLine("phi: " + phi_guard.Name);
            writer.WriteLine("negphi: " + neg_phi_guard.Name);
            writer.Close();

            //typecheck the instrumented program
            program.Resolve(BoogieUtils.BoogieOptions);
            program.Typecheck(BoogieUtils.BoogieOptions);

            //Generate VC
            VC.InitializeVCGen(program);
            VCExpr programVC = VC.GenerateVC(program, implementation);

            if (Utils.verbosityLevel(1))
            {
                Console.WriteLine("Phase 2: Generated VC in {0}", sw.Elapsed.TotalSeconds);
            }

            Counterexample failing_cex = getCounterExample(programVC);

            VCExpr modelExpr = Utils.ModelToConstraintHelper(prog, impl,
                new List<Counterexample>(new Counterexample[] {failing_cex}), prog_inputs, prog_locals);
            Console.WriteLine(modelExpr);
        }

        // Check if the counterexample matches the one provided in the /htmlInput file
        public static bool matchCexHtmlLines(Counterexample failing_cex, List<Block> L, List<Block> R)
        {
            if (Options.htmlInput == "")
            {
                throw new Exception("Warning!! Empty option /htmlInput");
            }
            var fileName = Options.htmlInput + ".html";
            if (!System.IO.File.Exists(fileName))
            {
                throw new Exception("Warning!! The input html file does not exist");
            }
            var l = System.IO.File.ReadAllLines(fileName);
            Tuple<List<int>, List<int>> o = Utils.parseHtmlForCexLines(l);
            List<int> leftHtmlLines = o.Item1;
            List<int> rightHtmlLines = o.Item2;

            List<Block> L_cex = blocksInCexPath(failing_cex, L);
            List<Block> R_cex = blocksInCexPath(failing_cex, R);
            var leftCexLines = new List<int>();
            var rightCexLines = new List<int>();
            foreach (var bl in L_cex)
                foreach (var c in blockToCmdSeq[bl])
                    if (c is AssignCmd)
                    {
                        int line = CmdToSourceline[c as AssignCmd].ToInt;
                        if (!leftCexLines.Contains(line)) leftCexLines.Add(line);
                    }
            foreach (var bl in R_cex)
                foreach (var c in blockToCmdSeq[bl])
                    if (c is AssignCmd)
                    {
                        int line = CmdToSourceline[c as AssignCmd].ToInt;
                        if (!rightCexLines.Contains(line)) rightCexLines.Add(line);
                    }

            leftCexLines.RemoveAt(0); leftCexLines.RemoveAt(0);
            leftCexLines.RemoveAt(leftCexLines.Count - 1); leftCexLines.RemoveAt(leftCexLines.Count - 1);
            rightCexLines.RemoveAt(0); rightCexLines.RemoveAt(0);
            rightCexLines.RemoveAt(rightCexLines.Count - 1); rightCexLines.RemoveAt(rightCexLines.Count - 1);
            var leftMismatchLines = leftCexLines.Where(x => !leftHtmlLines.Contains(x));
            var rightMismatchLines = rightCexLines.Where(x => !rightHtmlLines.Contains(x));
            bool leftCexWithinHtml = leftMismatchLines.Count() == 0;  //leftCexLines.TrueForAll(x => leftHtmlLines.Contains(x));
            bool rightCexWithinHtml = rightMismatchLines.Count() == 0; //rightCexLines.TrueForAll(x => rightHtmlLines.Contains(x));

            if (leftCexWithinHtml && rightCexWithinHtml) { Console.WriteLine("Found CEX & HTML match"); }
            else
            {
                Console.WriteLine("WARNING!!! ------- Found CEX & HTML mismatch ------------");
                Console.WriteLine("\nLeft HTML Lines: ");
                foreach (int line in leftHtmlLines) { Console.Write(line + ","); }
                Console.WriteLine("\nLeft CEX Lines: ");
                foreach (int line in leftCexLines) { Console.Write(line + ","); }
                Console.WriteLine("\nLeft CEX Mismatches: ");
                foreach (int line in leftMismatchLines) { Console.Write(line + ","); }

                Console.WriteLine("\nRight HTML Lines: ");
                foreach (int line in rightHtmlLines) { Console.Write(line + ","); }
                Console.WriteLine("\nRight CEX Lines: ");
                foreach (int line in rightCexLines) { Console.Write(line + ","); }
                Console.WriteLine("\nRight CEX Mismatches: ");
                foreach (int line in rightMismatchLines) { Console.Write(line + ","); }
                Console.Write("\n");
            }

            return leftCexWithinHtml && rightCexWithinHtml;
        }

        //performs runtime optimizations: move up the assert, binary search, trim candidates
        //TODO: refactored
        private static List<Constant> TopDown(
            List<Block> L, List<Block> R,
            //Dictionary<AssumeCmd, Constant> guardAssumeConsts,
            Dictionary<AssignCmd, Dictionary<Variable, Constant>> predConsts, //enabled
            Dictionary<Tuple<AssignCmd, Variable>, HashSet<Variable>> dependencies,
            Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> leftAssumeConsts, //noop instrumentation
            Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> rightAssumeConsts, //noop instrumentation
            Dictionary<AssignCmd, List<Tuple<Constant, AssignCmd, Variable, Variable>>> rightCandidates, //added on demand via axiom
            Dictionary<AssignCmd, Expr> rightAxioms, //added on demand
            Tuple<Dictionary<Block, Constant>, Dictionary<Block, Constant>> assumeFalseConsts, //set false under constrainLeftPath
            Dictionary<AssignCmd, Constant> assignAssertGuards, //disabled
            Dictionary<AssignCmd, Constant> assignAssertConstants, //added on demand under mismatch
            VCExpr programVC,
            Counterexample failing_cex,
            List<Counterexample> passing_cexs)
        {
            List<Block> L_cex = blocksInCexPath(failing_cex, L);
            List<Block> R_cex = blocksInCexPath(failing_cex, R);

            List<Constant> assignAssertGuardList = assignAssertGuards.Values.Aggregate(new List<Constant>(),
                (List<Constant> a, Constant b) => a.Concat(new Constant[] { b }).ToList<Constant>());
            VCExpr assignAssertGuardsDisabled = assignAssertGuardList.ConvertAll<VCExpr>(x => VC.translator.LookupVariable(x)).
                Aggregate<VCExpr, VCExpr>(VCExpressionGenerator.True, (VCExpr a, VCExpr b) => VC.exprGen.And(a, VC.exprGen.Not(b)));

            //make all predConsts true during MAXSAT (true means original assignments)
            List<Constant> predConstList = predConsts.Values.Aggregate(new List<Constant>(),
                (List<Constant> aaa, Dictionary<Variable, Constant> bbb) => aaa.Concat(
                    bbb.Values.Aggregate(new List<Constant>(), (List<Constant> aaaa, Constant bbbb) => aaaa.Concat(new Constant[] { bbbb }).ToList())).ToList());
            VCExpr predConstsEnabled = predConstList.ConvertAll<VCExpr>(x => VC.translator.LookupVariable(x)).
                Aggregate<VCExpr, VCExpr>(VCExpressionGenerator.True, (VCExpr currentExpr, VCExpr nextConst) => VC.exprGen.And(currentExpr, nextConst));



            VCExpr ensureAssert = VCExpressionGenerator.True;

            Constant firstMapMismatchLeft = null, firstMapMismatchRight = null;
            AssignCmd lMismatchAssign = null, rMismatchAssign = null;
            List<AssignCmd> leftEqMemAssigns = null;
            List<AssignCmd> rightEqMemAssigns = null;
            bool foundMismatch = false;

            #region Earliest locations (l1,l2) in the two programs that diverge in their memories (in failing cex)
            if (Options.findEarliestAssertionByMapMismatch || Options.pruneAfterMapMismatch || Options.callAlignWindow > 0)
            {
                foundMismatch = FindFirstMemMismatchFromFail(failing_cex, L_cex, R_cex, leftAssumeConsts, rightAssumeConsts,
                     out firstMapMismatchLeft, out firstMapMismatchRight, out lMismatchAssign, out rMismatchAssign, out leftEqMemAssigns, out rightEqMemAssigns);
                if (Utils.verbosityLevel(1) && foundMismatch)
                {
                    Console.WriteLine("Phase 4.1: Found first MemMismatch in lines ({1},{2}) from fail in {0}", sw.Elapsed,
                        CmdToSourceline[lMismatchAssign], CmdToSourceline[rMismatchAssign]);
                    Console.Write("Phase 4.1: Found the following matching mem updates: ");
                    foreach (Tuple<BigNum, BigNum> pair in leftEqMemAssigns.Zip(rightEqMemAssigns, (a, b) => new Tuple<BigNum, BigNum>(CmdToSourceline[a], CmdToSourceline[b])))
                    {
                        RegisterForHtmlOutput(pair.Item1, " Mem equality Left ", pair.Item2, " Mem equality right ");
                        Console.Write("({0},{1})", pair.Item1, pair.Item2);
                    }
                    Console.Write("\n");
                }
                if (foundMismatch)
                {
                    RegisterForHtmlOutput(CmdToSourceline[lMismatchAssign], " fail Mem Diseq Left ", CmdToSourceline[rMismatchAssign], " fail Mem Diseq Right ");
                }
                else {
                    if (Utils.verbosityLevel(1))
                    {
                        Console.WriteLine("Phase 4.1: Cannot find a MemMismatch from fail in {0}", sw.Elapsed.TotalSeconds);
                    }
                }

            }
            #endregion

            #region Experimenting with finding equalities from passing that fail in cex (just printing results on html)
            /*
            Constant firstMapMismatchLeftPass = null, firstMapMismatchRightPass = null;
            AssignCmd lMismatchAssignPass = null, rMismatchAssignPass = null;
            bool foundMismatchPass = false;

            if (Options.findEarliestAssertionByMapMismatch)
            {
                //finds the earliest one from the set
                foundMismatchPass = FindFirstMemMismatchFromPassFail(failing_cex, passing_cexs, L_cex, R_cex, leftAssumeConsts, rightAssumeConsts,
                    out firstMapMismatchLeftPass, out firstMapMismatchRightPass, out lMismatchAssignPass, out rMismatchAssignPass);
                if (Utils.verbosityLevel(1) && foundMismatchPass)
                {
                    Console.WriteLine("Phase 4.2: Found first MemMismatch in lines ({1},{2}) from passfail in {0}", sw.Elapsed,
                        CmdToSourceline[lMismatchAssignPass], CmdToSourceline[rMismatchAssignPass]);
                }
                if (foundMismatchPass)
                {
                    //just prints the earliest
                    RegisterForHtmlOutput(CmdToSourceline[lMismatchAssignPass], " passfail Mem Diseq Left ", CmdToSourceline[rMismatchAssignPass], " passfail Mem Diseq Right ");
                }
                else { Console.WriteLine("Phase 4.2: Cannot find a MemMismatch from passfail in {0}", sw.Elapsed.TotalSeconds); }
            }
             */
            #endregion

            Constant lastMapLeft = null, lastMapRight = null;
            AssignCmd lNewAssertAssign = null, rNewAssertAssign = null;
            bool foundAssertion = false;

            #region find earlier assertion based on user input
            if (Options.findEarliestAssertionByLine)
            {
                if (Options.newAssertLeftLine == -1 || Options.newAssertRightLine == -1)
                {
                    throw new Exception("Set good values for options newAssertLeftLine and newAssertRightLine");
                }
                foundAssertion = FindMemEqualityAtLine(Options.newAssertLeftLine, Options.newAssertRightLine,
                    L_cex, R_cex, leftAssumeConsts, rightAssumeConsts,
                    out lastMapLeft, out lastMapRight, out lNewAssertAssign, out rNewAssertAssign);
                if (Utils.verbosityLevel(1) && foundAssertion)
                {
                    Console.WriteLine("Phase 4.3: Found new assertion in {0}", sw.Elapsed,
                        CmdToSourceline[lNewAssertAssign], CmdToSourceline[rNewAssertAssign]);
                }
                if (foundAssertion)
                {
                    RegisterForHtmlOutput(CmdToSourceline[lNewAssertAssign], " new Left Assert ", CmdToSourceline[rNewAssertAssign], " new Right Assert ");
                }
                else { Console.WriteLine("Phase 4.3: Cannot find a new assertion in {0}", sw.Elapsed.TotalSeconds); }
            }
            #endregion

            Constant mapLeft = Options.findEarliestAssertionByLine ? lastMapLeft :
                (Options.findEarliestAssertionByMapMismatch || Options.pruneAfterMapMismatch || Options.callAlignWindow > 0) ? firstMapMismatchLeft : null;
            Constant mapRight = Options.findEarliestAssertionByLine ? lastMapRight :
                (Options.findEarliestAssertionByMapMismatch || Options.pruneAfterMapMismatch || Options.callAlignWindow > 0) ? firstMapMismatchRight : null;
            AssignCmd lAssign = Options.findEarliestAssertionByLine ? lNewAssertAssign :
                (Options.findEarliestAssertionByMapMismatch || Options.pruneAfterMapMismatch || Options.callAlignWindow > 0) ? lMismatchAssign : null;
            AssignCmd rAssign = Options.findEarliestAssertionByLine ? rNewAssertAssign :
                (Options.findEarliestAssertionByMapMismatch || Options.pruneAfterMapMismatch || Options.callAlignWindow > 0) ? rMismatchAssign : null;

            #region Moving the assertion upto earliest MemMismatch in failing cex
            if ((Options.findEarliestAssertionByMapMismatch && foundMismatch) ||
                (Options.findEarliestAssertionByLine && foundAssertion))
            {
                String cause = Options.findEarliestAssertionByLine ? "findEarliestAssertionByLine" : "findEarliestAssertionByMapMismatch";
                //moving the assertion up
                Console.WriteLine("{0}: Moving up the assertion...", cause);
                List<Constant> falseAssignAssertConstantsPrime = new List<Constant>();
                VCExpr someAssignAssertGuardsDisabled = VCExpressionGenerator.True;
                foreach (AssignCmd cmd in assignAssertGuards.Keys)
                {
                    if (cmd == rAssign)
                    {
                        //enable the assert for the matching assign
                        someAssignAssertGuardsDisabled = VC.exprGen.And(someAssignAssertGuardsDisabled,
                            VC.translator.LookupVariable(assignAssertGuards[cmd]));
                    }
                    else
                    {
                        //turn off for all other assign
                        someAssignAssertGuardsDisabled = VC.exprGen.And(someAssignAssertGuardsDisabled,
                            VC.exprGen.Not(VC.translator.LookupVariable(assignAssertGuards[cmd])));
                    }
                }

                //provide the constant with the actual variable
                VCExpr memConstraint = VC.exprGen.Eq(VC.translator.LookupVariable(mapLeft),
                    VC.translator.LookupVariable(assignAssertConstants[rAssign]));

                //turn off the final assign
                ensureAssert = VC.exprGen.And(someAssignAssertGuardsDisabled,
                    VC.exprGen.And(VC.translator.LookupVariable(phi_guard),
                    VC.exprGen.Not(VC.translator.LookupVariable(neg_phi_guard))));

                ensureAssert = VC.exprGen.And(ensureAssert, memConstraint);
            }
            else
            {
                //use the original
                ensureAssert = VC.exprGen.And(assignAssertGuardsDisabled,
                    VC.exprGen.And(VC.translator.LookupVariable(phi_guard),
                    VC.exprGen.Not(VC.translator.LookupVariable(neg_phi_guard))));
            }
            #endregion

            #region Optimization for computing assignmentsToExplore: only include assignments visited in cex path before assertion
            //compute assignments to explore, all assignments visited in cex path that happen to be before the assert
            List<AssignCmd> assignmentsToExplore = new List<AssignCmd>();
            foreach (AssignCmd cmd in rightAxioms.Keys)
            {
                if (R_cex.Contains(cmdToBlock[cmd]))
                {
                    if ((Options.findEarliestAssertionByMapMismatch && foundMismatch) ||
                        (Options.findEarliestAssertionByLine && foundAssertion) ||
                        (Options.pruneAfterMapMismatch && foundMismatch) ||
                        (Options.callAlignWindow > 0))
                    {
                        if (Options.callAlignWindow > 0)
                        {
                            //only keep assignments within window
                            bool b1 = earlierAssignmentByLineNumber(cmd, rAssign);
                            bool b2 = Options.callAlignWindow > rightEqMemAssigns.Count ? true :
                                !earlierAssignmentByLineNumber(cmd, rightEqMemAssigns.ElementAt(rightEqMemAssigns.Count - Options.callAlignWindow));
                            if (b1 && b2)
                            {
                                assignmentsToExplore.Add(cmd);
                            }
                        }
                        else
                        {
                            if (earlierAssignmentByLineNumber(cmd, rAssign))
                            {
                                assignmentsToExplore.Add(cmd);
                            }
                        }
                    }
                    else
                    {
                        //unable to prune, so explore this assignment
                        assignmentsToExplore.Add(cmd);
                    }
                }
            }
            #endregion

            //compute candidates to explore

            //inequalities from passing tests
            List<Tuple<Constant, Constant>> passingInequalities = new List<Tuple<Constant, Constant>>();
            if (Options.prunePassingInequalities && passing_cexs != null)
            {
                foreach (Counterexample passing_cex in passing_cexs)
                {
                    foreach (Tuple<Constant, Constant> inequality in
                        FindDisequalitiesFromTest(program, implementation, L, R, passing_cex, leftAssumeConsts, rightAssumeConsts))
                    {
                        if (!passingInequalities.Contains(inequality)) { passingInequalities.Add(inequality); }
                    }
                }
                if (Utils.verbosityLevel(1)) { Console.WriteLine("Found {0} inequalities from passing tests.", passingInequalities.Count); }
            }

            //equalities from failing cex
            List<Tuple<Constant, Constant>> failingEqualities = new List<Tuple<Constant, Constant>>();
            if (Options.pruneFailingEqualities)
            {
                failingEqualities = FindEqualitiesFromTest(program, implementation, L, R, failing_cex, leftAssumeConsts, rightAssumeConsts);
            }

            //candidates on cex path
            List<Constant> allBlockCand_cex = listCandidates(rightCandidates, R_cex, L_cex);
            List<Constant> allBlockCand_all = listCandidates(rightCandidates, R, L);

            #region Optimization for computing candidatesToExplore, also known as runtime filters
            HashSet<Constant> candidatesToExplore = new HashSet<Constant>();
            int passingFilterCount = 0; int cexFilterCount = 0; int earlierFilterCount = 0; int failingFilterCount = 0; int callWindowFilterCount = 0;

            foreach (AssignCmd assignCmd in rightAxioms.Keys)
            {
                foreach (Tuple<Constant, AssignCmd, Variable, Variable> right_tuple in rightCandidates[assignCmd])
                {
                    //passing run filter
                    Constant left_c = null, right_c = null;
                    AssignCmd right_cmd = assignCmd, left_cmd = right_tuple.Item2;

                    //
                    left_c = right_tuple.Item4 as Constant;
                    foreach (Tuple<Variable, Constant> left_tuple in rightAssumeConsts[assignCmd])
                    {
                        if (left_tuple.Item1 == right_tuple.Item3) { right_c = left_tuple.Item2; }
                    }

                    //filter1: pruning from passing tests
                    bool passingRunFilter;
                    if (Options.prunePassingInequalities)
                    {
                        passingRunFilter = !passingInequalities.Contains(new Tuple<Constant, Constant>(left_c, right_c));
                    }
                    else { passingRunFilter = true; }

                    //filter2: prune from failing tests
                    bool failingRunFilter;
                    if (Options.pruneFailingEqualities)
                    {
                        failingRunFilter = !failingEqualities.Contains(new Tuple<Constant, Constant>(left_c, right_c));
                    }
                    else { failingRunFilter = true; }

                    //filter3: prune candidates that don't lie on the Cex.
                    //i.e. prune candidates for which either left or right assignment is not on cex.
                    bool presentInCexFilter = allBlockCand_cex.Contains(right_tuple.Item1);

                    //filter4: prune candidates below (l,r) where (l==r) is the new equality
                    bool foundBeforeAssertFilter;
                    if ((Options.findEarliestAssertionByMapMismatch && foundMismatch) ||
                        (Options.findEarliestAssertionByLine && foundAssertion) ||
                        (Options.pruneAfterMapMismatch && foundMismatch))
                    {
                        foundBeforeAssertFilter = earlierAssignmentByLineNumber(left_cmd, lAssign) && earlierAssignmentByLineNumber(right_cmd, rAssign);
                    }
                    else { foundBeforeAssertFilter = true; }

                    bool callWindowFilter;
                    if (Options.callAlignWindow > 0)
                    {
                        bool b1 = earlierAssignmentByLineNumber(left_cmd, lAssign);
                        bool b2 = Options.callAlignWindow > leftEqMemAssigns.Count ? true :
                            !earlierAssignmentByLineNumber(left_cmd, leftEqMemAssigns.ElementAt(leftEqMemAssigns.Count - Options.callAlignWindow));
                        bool b3 = earlierAssignmentByLineNumber(right_cmd, rAssign);
                        bool b4 = Options.callAlignWindow > rightEqMemAssigns.Count ? true :
                            !earlierAssignmentByLineNumber(right_cmd, rightEqMemAssigns.ElementAt(rightEqMemAssigns.Count - Options.callAlignWindow));

                        callWindowFilter = b1 && b2 && b3 && b4;
                    }
                    else { callWindowFilter = true; }

                    if (!passingRunFilter) { passingFilterCount++; }
                    if (!failingRunFilter) { failingFilterCount++; }
                    if (!presentInCexFilter) { cexFilterCount++; }
                    if (!foundBeforeAssertFilter) { earlierFilterCount++; }
                    if (!callWindowFilter) { callWindowFilterCount++; }

                    //add if none of the filter applies
                    if (passingRunFilter && failingRunFilter && presentInCexFilter && foundBeforeAssertFilter && callWindowFilter)
                    {
                        candidatesToExplore.Add(right_tuple.Item1);
                    }
                }
            }
            #endregion

            //add everything that was pruned
            List<Constant> candidatesToIgnore = allBlockCand_all.Where(c => !candidatesToExplore.Contains(c)).ToList<Constant>();
            if (Utils.verbosityLevel(1))
            {
                Console.WriteLine("Ignoring {0} candidates, and exploring {1} candidates.",
                    candidatesToIgnore.Count, candidatesToExplore.Count);
            }

            if (Utils.verbosityLevel(1))
            {
                Console.WriteLine("stats_left_assigns: {0}", leftAssumeConsts.Keys.Count);
                Console.WriteLine("stats_right_assigns: {0}", rightAxioms.Keys.Count);
                Console.WriteLine("stats_total_candidates: {0}", candidatesToExplore.Count + candidatesToIgnore.Count);
                Console.WriteLine("stats_defaultpruning_candidates: {0}", candidatesToExplore.Count);
                Console.WriteLine("stats_defaultpruning_assigns: {0}", assignmentsToExplore.Count);
                Console.WriteLine("stats_passingFilterCount: {0}", passingFilterCount);
                Console.WriteLine("stats_failingFilterCount: {0}", failingFilterCount);
                Console.WriteLine("stats_callWindowFilterCount: {0}", callWindowFilterCount);
                Console.WriteLine("stats_cexFilterCount: {0}", cexFilterCount);
                Console.WriteLine("stats_earlierFilterCount: {0}", earlierFilterCount);
                Console.WriteLine("stats_passingcexs: {0}", passing_cexs == null ? 0 : passing_cexs.Count);
                //if (foundMismatchPass) { Console.WriteLine("stats_passfailMismatch: ({0},{1})", CmdToSourceline[lMismatchAssignPass], CmdToSourceline[rMismatchAssignPass]); }
                //else { Console.WriteLine("stats_passfailMismatch: ({0},{1})", 0, 0); }
            }
            if (Options.stats)
            {
                Console.WriteLine("NOTE: Exiting without rootcause analysis");
                return new List<Constant>();
            }


            List<VCExpr> Hard0 = new List<VCExpr>();
            Hard0.Add(VC.exprGen.Not(programVC));
            Hard0.Add(ensureAssert);
            Hard0.Add(predConstsEnabled); //dont' use x := havoc_x
            if (Options.constrainLeftPath)
            {
                //TODO
                Hard0.Add(assumeFalseConsts.Item1.Where(c => !L_cex.Contains(c.Key)).Aggregate(
                    VCExpressionGenerator.True, (a, b) => VC.exprGen.And(a, VC.exprGen.Not(VC.translator.LookupVariable(b.Value)))));
            }
            if (Options.constrainRightPath)
            {
                Hard0.Add(assumeFalseConsts.Item2.Where(c => !R_cex.Contains(c.Key)).Aggregate(
                    VCExpressionGenerator.True, (a, b) => VC.exprGen.And(a, VC.exprGen.Not(VC.translator.LookupVariable(b.Value)))));
            }
            if (Options.assumeToSkip)
            {
                VCExpr allAssumeGuard_False = VCExpressionGenerator.True; /*guardAssumeConsts.Aggregate(VCExpressionGenerator.True, (a, b)
                    => VC.exprGen.And(a, VC.exprGen.Not(VC.translator.LookupVariable(b.Value))));*/
                Hard0.Add(allAssumeGuard_False);
            }

            //Avoid performing binarySearch
            if (!Options.binarySearch)
            {
                if (Utils.verbosityLevel(1))
                {
                    Console.WriteLine("stats_binarysearch_assigns: {0}", assignmentsToExplore.Count);
                    Console.WriteLine("stats_binarysearch_candidates: {0}", candidatesToExplore.Count);
                }
                return AssignmentByAssignment(L, R, assignmentsToExplore, candidatesToExplore.ToList(), predConsts, leftAssumeConsts, rightAssumeConsts, rightCandidates, rightAxioms,
                    assumeFalseConsts, assignAssertGuards, assignAssertConstants, programVC, ensureAssert, failing_cex, passing_cexs);
            }

            #region binarySearching
            //Finds the earliest assign that is UNSAT
            int low = 0;
            int up = assignmentsToExplore.Count - 1;
            int loopCounter = 0;

            while (loopCounter <= 10 && (up - low > 1)) //FIXME: I chose an arbitrary iteration limit 10
            {
                List<VCExpr> Hard = new List<VCExpr>(Hard0.ToList());
                List<Constant> Soft = new List<Constant>();

                int curr = low + (up - low) / 2;

                for (int i = 0; i <= (loopCounter == 0 ? up : curr); i++)
                {
                    AssignCmd assignCmd = assignmentsToExplore[i];
                    if ((!rightAxioms.ContainsKey(assignCmd)) || (!rightCandidates.ContainsKey(assignCmd))) { continue; }

                    //HARD := HARD0
                    Hard.Add(VC.translator.Translate(rightAxioms[assignCmd]));

                    VCExpr candidatesToIgnore_Disabled = candidatesToIgnore.ToList<Constant>().ConvertAll<VCExpr>(x => VC.translator.LookupVariable(x)).
                        Aggregate<VCExpr, VCExpr>(VCExpressionGenerator.True, (VCExpr currentExpr, VCExpr nextCand) => VC.exprGen.And(currentExpr, VC.exprGen.Not(nextCand)));
                    Hard.Add(candidatesToIgnore_Disabled); //the axioms will take care of disabling cand in other blocks
                    //Hard now contains not(programVC), ensureAssert, inconsistentDisabled, otherBlocksDisabled

                    List<Constant> softCandidates = new List<Constant>();
                    foreach (Tuple<Constant, AssignCmd, Variable, Variable> right_tuple in rightCandidates[assignCmd])
                    {
                        if (candidatesToExplore.Contains(right_tuple.Item1)) { softCandidates.Add(right_tuple.Item1); }
                    }
                    Soft.AddRange(softCandidates);
                }

                VCExpr Soft_Expr = Soft.ConvertAll<VCExpr>(x => VC.translator.LookupVariable(x)).
                    Aggregate<VCExpr, VCExpr>(VCExpressionGenerator.True, (VCExpr currentExpr, VCExpr nextConst) => VC.exprGen.And(currentExpr, nextConst));

                //call to see if the assert is provable
                SolverOutcome outcome = CheckSatisfiability(
                    Hard.Union(new List<VCExpr>(new VCExpr[] { Soft_Expr })).ToList());

                if (loopCounter == 0)
                {
                    if (outcome == SolverOutcome.Invalid) //SAT
                    {
                        //Console.WriteLine("SAT");
                        return new List<Constant>(); //no rootcauses
                    }
                }
                else
                {
                    if (outcome == SolverOutcome.Invalid) //SAT
                    {
                        //Console.WriteLine("SAT");
                        //Console.WriteLine("low: {0}, up: {1}, curr: {2}", low, up, curr);
                        low = curr;
                    }
                    else if (outcome == SolverOutcome.Valid) //UNSAT
                    {
                        //Console.WriteLine("UNSAT");
                        //Console.WriteLine("low: {0}, up: {1}, curr: {2}", low, up, curr);
                        up = curr;
                    }
                }

                loopCounter++;
            }

            List<AssignCmd> subsetAssignments = new List<AssignCmd>();
            for (int i = 0; i < assignmentsToExplore.Count; i++)
            {
                if (i >= low) { subsetAssignments.Add(assignmentsToExplore[i]); }
            }

            int postBinarySearchCandidates = 0;
            foreach (AssignCmd assignCmd in subsetAssignments)
            {
                foreach (Tuple<Constant, AssignCmd, Variable, Variable> right_tuple in rightCandidates[assignCmd])
                {
                    if (candidatesToExplore.Contains(right_tuple.Item1)) { postBinarySearchCandidates += 1; }
                }
            }

            Console.WriteLine("stats_binarysearch_assigns: {0}", subsetAssignments.Count);
            Console.WriteLine("stats_binarysearch_candidates: {0}", postBinarySearchCandidates);
            Console.WriteLine("{0} iterations in binarySearch", loopCounter);
            #endregion binarySearching

            //only pass the interesting subsetAssignments to AssignmentByAssignment
            return AssignmentByAssignment(L, R, subsetAssignments, candidatesToExplore.ToList(), predConsts, leftAssumeConsts, rightAssumeConsts, rightCandidates, rightAxioms,
                assumeFalseConsts, assignAssertGuards, assignAssertConstants, programVC, ensureAssert, failing_cex, passing_cexs);
        }

        /* Proposed on July 25, 2013 */
        /// <summary>
        /// assertionSelector tells which assertion to check
        /// </summary>
        /// <param name="L"></param>
        /// <param name="R"></param>
        /// <param name="assignsToExplore"></param>
        /// <param name="candidatesToExplore"></param>
        /// <param name="predConsts"></param>
        /// <param name="leftAssumeConsts"></param>
        /// <param name="rightAssumeConsts"></param>
        /// <param name="rightCandidates"></param>
        /// <param name="rightAxioms"></param>
        /// <param name="assertConsts"></param>
        /// <param name="assumeFalseConsts"></param>
        /// <param name="assignAssertGuards"></param>
        /// <param name="assignAssertConstants"></param>
        /// <param name="programVC"></param>
        /// <param name="assertionSelector"></param>
        /// <param name="failing_cex"></param>
        /// <param name="passing_cexs"></param>
        /// <returns></returns>
        private static List<Constant> AssignmentByAssignment(
            List<Block> L, List<Block> R,
            //Dictionary<AssumeCmd, Constant> guardAssumeConsts,
            List<AssignCmd> assignsToExplore,
            List<Constant> candidatesToExplore,
            Dictionary<AssignCmd, Dictionary<Variable, Constant>> predConsts,
            Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> leftAssumeConsts,
            Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> rightAssumeConsts,
            Dictionary<AssignCmd, List<Tuple<Constant, AssignCmd, Variable, Variable>>> rightCandidates,
            Dictionary<AssignCmd, Expr> rightAxioms,
            Tuple<Dictionary<Block, Constant>, Dictionary<Block, Constant>> assumeFalseConsts,
            Dictionary<AssignCmd, Constant> assignAssertGuards,
            Dictionary<AssignCmd, Constant> assignAssertConstants,
            VCExpr programVC,
            VCExpr assertionSelector,
            Counterexample failing_cex, List<Counterexample> passing_cexs
            )
        {
            List<Block> L_cex = blocksInCexPath(failing_cex, L);
            List<Block> R_cex = blocksInCexPath(failing_cex, R);

            if (Utils.verbosityLevel(1))
            {
                Console.WriteLine("Phase 5: Within AssignmentByAssignment procedure");
                Console.WriteLine("Exploring over {0} assignments and {1} candidates.", assignsToExplore.Count, candidatesToExplore.Count);
                if (Utils.verbosityLevel(3))
                {
                    foreach (AssignCmd beingExplored in assignsToExplore) { Console.WriteLine("Exploring assignment: {0}", beingExplored); }
                    //foreach (Constant beingExplored in candidatesToExplore) { printErrorReport(rightCandidates, beingExplored); }
                }
            }
            List<Constant> output = new List<Constant>();

            List<Constant> predConstList = predConsts.Values.Aggregate(new List<Constant>(),
                (List<Constant> aaa, Dictionary<Variable, Constant> bbb) => aaa.Concat(
                bbb.Values.Aggregate(new List<Constant>(), (List<Constant> aaaa, Constant bbbb) => aaaa.Concat(new Constant[] { bbbb }).ToList())).ToList());
            VCExpr predConstsEnabled = predConstList.ConvertAll<VCExpr>(x => VC.translator.LookupVariable(x)).
                Aggregate<VCExpr, VCExpr>(VCExpressionGenerator.True, (VCExpr currentExpr, VCExpr nextConst) => VC.exprGen.And(currentExpr, nextConst));

            List<VCExpr> Hard0 = new List<VCExpr>();
            Hard0.Add(VC.exprGen.Not(programVC));
            Hard0.Add(assertionSelector);
            if (Options.constrainLeftPath)
            {
                Hard0.Add(assumeFalseConsts.Item1.Where(c => !L_cex.Contains(c.Key)).Aggregate(
                    VCExpressionGenerator.True, (a, b) => VC.exprGen.And(a, VC.exprGen.Not(VC.translator.LookupVariable(b.Value)))));
            }
            if (Options.constrainRightPath)
            {
                Hard0.Add(assumeFalseConsts.Item2.Where(c => !R_cex.Contains(c.Key)).Aggregate(
                    VCExpressionGenerator.True, (a, b) => VC.exprGen.And(a, VC.exprGen.Not(VC.translator.LookupVariable(b.Value)))));
            }
            if (Options.assumeToSkip)
            {
                VCExpr allAssumeGuard_False = VCExpressionGenerator.True; /*guardAssumeConsts.Aggregate(VCExpressionGenerator.True, (a, b)
                    => VC.exprGen.And(a, VC.exprGen.Not(VC.translator.LookupVariable(b.Value))));*/
                Hard0.Add(allAssumeGuard_False);
            }

            int stats_usefulCandidates = 0, stats_uselessCandidates = 0, stats_maxsatAssignments = 0;
            foreach (AssignCmd assignCmd in assignsToExplore)
            {
                //if (Utils.CheckTimeout(sw.Elapsed.TotalSeconds)) {  }
                if ((!rightAxioms.ContainsKey(assignCmd)) || (!rightCandidates.ContainsKey(assignCmd))) { continue; }
                stats_maxsatAssignments++;

                //HARD := HARD0
                List<VCExpr> Hard = new List<VCExpr>(Hard0.ToList());
                Hard.Add(VC.translator.Translate(rightAxioms[assignCmd]));

                //TODO: Find all Lists and make them hashsets
                HashSet<Constant> candidatesToIgnore = new HashSet<Constant>();
                HashSet<Constant> Soft = new HashSet<Constant>();
                foreach (Tuple<Constant, AssignCmd, Variable, Variable> right_tuple in rightCandidates[assignCmd])
                {
                    if (candidatesToExplore.Contains(right_tuple.Item1)) { Soft.Add(right_tuple.Item1); }
                    else { candidatesToIgnore.Add(right_tuple.Item1); }
                }

                VCExpr candidatesToIgnoreDisabled = candidatesToIgnore.ToList<Constant>().ConvertAll<VCExpr>(x => VC.translator.LookupVariable(x)).
                    Aggregate<VCExpr, VCExpr>(VCExpressionGenerator.True, (VCExpr currentExpr, VCExpr nextCand) => VC.exprGen.And(currentExpr, VC.exprGen.Not(nextCand)));

                Hard.Add(candidatesToIgnoreDisabled); //the axioms will take care of disabling cand in other blocks
                //Hard now contains not(programVC), ensureAssert, inconsistentDisabled, otherBlocksDisabled



                //Compute MAXSAT over all candidates in this block
                //Complement of MAXSAT (aka A1') are all the useful candidates.
                //A1_useless = MAXSAT(not(VC), Hard, SOFT) contains all the useless (satisfied) candidates in this block
                if ((!Options.disableMaxsat) && Utils.verbosityLevel(2)) { Console.WriteLine("Invoking MAXSAT for {0} on {1} clauses", assignCmd, Soft.Count); }
                List<Constant> uselessCandidates = Rootcause.Options.disableMaxsat || candidatesToExplore.Count > Options.maxsatLimit ?
                    new List<Constant>() :
                    MAXSATSolution(Hard.Union(new List<VCExpr>(new VCExpr[] { predConstsEnabled })).ToList(), Soft.ToList());
                List<Constant> usefulCandidates = Soft.Where(c => !uselessCandidates.Contains(c)).ToList<Constant>();

                stats_usefulCandidates += usefulCandidates.Count;
                stats_uselessCandidates += uselessCandidates.Count;
                if (Utils.verbosityLevel(2))
                {
                    Console.WriteLine("MAXSAT found {0} useless and {1} useful candidates in this assignment, disabling useless...", uselessCandidates.Count, usefulCandidates.Count);
                }

                //Disable these useless candidates.
                //HARD = HARD U {!a | a \in A1_useless}
                VCExpr uselessCandidatesDisabled = uselessCandidates.ConvertAll<VCExpr>(x => VC.translator.LookupVariable(x)).
                    Aggregate<VCExpr, VCExpr>(VCExpressionGenerator.True,
                        (VCExpr currentExpr, VCExpr nextCand) => VC.exprGen.And(currentExpr, VC.exprGen.Not(nextCand)));
                Hard.Add(uselessCandidatesDisabled);

                if (Utils.verbosityLevel(2))
                {
                    Console.Write("Exploring over candidates one by one: ");
                    foreach (Constant a in usefulCandidates) { Console.Write(a + ", "); } Console.Write("\n");
                }

                //foreach (a in A1\A1') //add useful candidate, 1 at a time
                foreach (Constant a in usefulCandidates)
                {
                    //Utils.CheckTimeout();
                    if (Utils.verbosityLevel(2))
                    {
                        Console.WriteLine("Checking candidate {0}", a);
                    }

                    //find out which AssignCmd we need to disable
                    List<Variable> variablesBeingModified = getVariableBeingEquated(a, rightCandidates);
                    AssignCmd assignmentBeingPerformed = getAssignmentForCandidate(a, rightCandidates);

                    List<Constant> predConstsForThisAssignment = variablesBeingModified.Aggregate(new List<Constant>(),
                        (List<Constant> list_const, Variable variableBeingModified) =>
                            list_const.Concat(new Constant[] { predConsts[assignmentBeingPerformed][variableBeingModified] }).ToList<Constant>());
                    List<Constant> otherPredConsts =
                        predConstList.Where(c => !predConstsForThisAssignment.Contains(c)).ToList<Constant>(); //assumes from other blocks

                    VCExpr predConstsForThisAssignment_False = predConstsForThisAssignment.ConvertAll<VCExpr>(x => VC.translator.LookupVariable(x)).
                        Aggregate<VCExpr, VCExpr>(VCExpressionGenerator.True, (VCExpr currentExpr, VCExpr nextConst) => VC.exprGen.And(currentExpr, VC.exprGen.Not(nextConst)));
                    VCExpr otherPredConsts_True = otherPredConsts.ConvertAll<VCExpr>(x => VC.translator.LookupVariable(x)).
                        Aggregate<VCExpr, VCExpr>(VCExpressionGenerator.True, (VCExpr currentExpr, VCExpr nextConst) => VC.exprGen.And(currentExpr, nextConst));

                    //if (MAXSAT(not(VC), Hard, {a}) == {})
                    SolverOutcome outcome1 = CheckSatisfiability(
                        Hard.Union(new List<VCExpr>(new VCExpr[] { VC.translator.LookupVariable(a), predConstsForThisAssignment_False, otherPredConsts_True })).ToList());

                    if (outcome1 == SolverOutcome.Valid)
                    {
                        if (Utils.verbosityLevel(2))
                        {
                            Console.WriteLine("Candidate {0} fixes program", a);
                        }
                        if (Utils.verbosityLevel(1))
                        {
                            Console.WriteLine("Found rootcause after {0}/{1} assigns", stats_maxsatAssignments, rightAxioms.Keys.Count);
                        }
                        output.Add(a);
                        if (Utils.verbosityLevel(1))
                        {
                            Console.WriteLine("stats_maxsat_useful: {0}", stats_usefulCandidates);
                            Console.WriteLine("stats_maxsat_useless: {0}", stats_uselessCandidates);
                            Console.WriteLine("stats_maxsat_assigns: {0}", stats_maxsatAssignments);
                        }
                        return output;
                    }
                }

            }
            if (Utils.verbosityLevel(1))
            {
                Console.WriteLine("stats_maxsat_useful: {0}", stats_usefulCandidates);
                Console.WriteLine("stats_maxsat_useless: {0}", stats_uselessCandidates);
            }
            return output;
        }

        //side effect: drops all blocks that do not appear on counterexample trace
        private static List<Block> blocksInCexPath(Counterexample counterexample, List<Block> blocks)
        {
            List<Block> cexblocks = new List<Block>();
            List<Block> outputblocks = new List<Block>();

            foreach (Block cexblock in counterexample.Trace) { cexblocks.Add(cexblock); }

            foreach (Block block in blocks)
            {
                if (cexblocks.Contains(block)) { outputblocks.Add(block); }
            }

            return outputblocks;
        }

        //Computer counter-example
        public static Counterexample getCounterExample(VCExpr vc)
        {
            List<Counterexample> cexs;
            Utils.CheckRootcauseTimeout(sw);
            var outcome = VC.VerifyVC("Rootcause", vc, out cexs);
            if (cexs.Count == 0 || outcome == SolverOutcome.Valid) { return null; }
            else { return cexs[0]; }
        }

        public static List<Counterexample> getCorrectExample(VCExpr vc)
        {
            List<Counterexample> cexs;
            Utils.CheckRootcauseTimeout(sw);
            var outcome = VC.VerifyVC("Rootcause", vc, out cexs);
            if (cexs.Count == 0 || outcome == SolverOutcome.Valid) { return null; }
            else { return cexs; }
        }

        //Check for satisfiability.
        private static SolverOutcome CheckSatisfiability(List<VCExpr> Hard)
        {
            Utils.CheckRootcauseTimeout(sw);
            var (outcome, _) = VC.proverInterface.CheckAssumptions(Hard, VC.handler, CancellationToken.None).Result;
            return outcome;
        }

        //returns the MAXSAT solution, not the complement
        private static List<Constant> MAXSATSolution(List<VCExpr> Hard, List<Constant> Soft)
        {
            List<VCExpr> HardVCExprs = Hard;
            List<VCExpr> SoftVCExprs = Soft.ConvertAll<VCExpr>(x => VC.translator.LookupVariable(x));

            Utils.CheckRootcauseTimeout(sw);
            var (outcome, unsatClauseIdentifiers) = VC.proverInterface.CheckAssumptions(HardVCExprs, VC.handler, CancellationToken.None).Result;

            //if outcome == Timeout, Z3 retunns UNSAT for later calls, best to exit
            if (outcome == SolverOutcome.TimeOut || outcome == SolverOutcome.OutOfMemory)
            {
                throw new Exception("ABORT! Z3 times out during MAXSAT, any future calls to Z3 returns bogus results");
            }

            if (outcome == SolverOutcome.Invalid)
            {
                List<Constant> usefulCandidates = unsatClauseIdentifiers.ConvertAll<Constant>(x => Soft[x]);
                List<Constant> uselessCandidates = Soft.Where(c => !usefulCandidates.Contains(c)).ToList<Constant>();
                return uselessCandidates;
            }
            else
            {
                return new List<Constant>(); //all candidates in Soft are useful, return empty solution
            }
        }


        //list all candidate constants within argument "rightBlocks" that relate to variables in argument "leftBlocks"
        private static List<Constant> listCandidates(Dictionary<AssignCmd, List<Tuple<Constant, AssignCmd, Variable, Variable>>> rightCandidates,
            List<Block> rightBlocks, List<Block> leftBlocks)
        {
            List<Constant> candidates = new List<Constant>();

            if (Utils.verbosityLevel(2)) { Console.WriteLine("listCandidates: # of rightCandidates = {0}\n Tuples = ", rightCandidates.Keys.Count); }
            Utils.CheckRootcauseTimeout(sw);
            foreach (AssignCmd key in rightCandidates.Keys)
            {
                if (!rightBlocks.Contains(cmdToBlock[key])) { continue; }
                //at this point we are only considering an assignment from rightProgram within rightBlocks
                List<Tuple<Constant, AssignCmd, Variable, Variable>> listOfTuples = rightCandidates[key];

                if (Utils.verbosityLevel(2)) { Console.Write("{0}, ", listOfTuples.Count); }
                Utils.CheckRootcauseTimeout(sw);
                foreach (Tuple<Constant, AssignCmd, Variable, Variable> tuple in listOfTuples)
                {
                    if (leftBlocks.Contains(cmdToBlock[tuple.Item2]))
                    {
                        //at this point we are only considering an equality to an assignment from leftProgram within leftBlocks
                        if (!candidates.Contains(tuple.Item1)) { candidates.Add(tuple.Item1); }
                    }
                }
            }
            if (Utils.verbosityLevel(1)) Console.WriteLine();
            return candidates;
        }

        #region Transform left/right sides with assumes
        //side effect: modifies leftAssumeConsts
        private static void injectAssumesOnLeft(Program program, Implementation implementation,
                                                    List<Block> L, List<Block> R, /*requires*/
                                                    Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> leftAssumeConsts) /*modifies*/
        {
            var injector = new LeftInjector(program, implementation);
            injector.injectAssumes(L, R, leftAssumeConsts);
        }

        /// <summary>
        /// Adds constants for each assignment to rightAssumeConsts
        /// Adds axioms (exprs) to rightAxioms
        /// Adds candidate assumes with information about left program where it came from
        /// </summary>
        /// <param name="program"></param>
        /// <param name="implementation"></param>
        /// <param name="L"></param>
        /// <param name="R"></param>
        /// <param name="leftAssumeConsts"></param>
        /// <param name="rightCandidates"></param>
        /// <param name="rightAxioms"></param>
        /// <param name="rightAssumeConsts"></param>
        /// <param name="dependencies"></param>
        private static void injectAxiomsOnRight(Program program, Implementation implementation,
                                            List<Block> L, List<Block> R,
                                            Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> leftAssumeConsts, /*requires*/
                                            Dictionary<AssignCmd, List<Tuple<Constant, AssignCmd, Variable, Variable>>> rightCandidates, /*modifies*/
                                            Dictionary<AssignCmd, Expr> rightAxioms, /*modifies*/
                                            Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> rightAssumeConsts, /*modifies*/
                                            Dictionary<Tuple<AssignCmd, Variable>, HashSet<Variable>> dependencies) /*modifies*/
        {
            var injector = new RightAxiomInjector(program, implementation);
            injector.injectAxioms(L, R, leftAssumeConsts, rightCandidates, rightAxioms, rightAssumeConsts, dependencies);
        }

        private static void injectAxiomsOnRightCEGIS(Program program, Implementation implementation,
                                    List<Block> L, List<Block> R,
                                    Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> leftAssumeConsts, /*requires*/
                                    Dictionary<AssignCmd, List<Tuple<Constant, AssignCmd, Variable, Variable>>> rightCandidates, /*modifies*/
                                    Dictionary<AssignCmd, Expr> rightAxioms, /*modifies*/
                                    Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> rightAssumeConsts, /*modifies*/
                                    Dictionary<Tuple<AssignCmd, Variable>, HashSet<Variable>> dependencies) /*modifies*/
        {
            var injector = new RightAxiomInjectorCEGIS(program, implementation);
            injector.injectAxioms(L, R, leftAssumeConsts, rightCandidates, rightAxioms, rightAssumeConsts, dependencies);
        }

        private static void injectAssignAssertsOnRight(Program program, Implementation implementation,
                                                List<Block> L, List<Block> R,
                                                Dictionary<AssignCmd, Constant> assignAssertGuards,
                                                Dictionary<AssignCmd, Constant> assignAssertConstants)
        {
            var injector = new RightAssignAssertInjector(program, implementation);
            injector.injectAssignAsserts(L, R, assignAssertGuards, assignAssertConstants);
        }

        private static void guardAssignmentsOnRight(Program program, Implementation implementation,
                                            List<Block> L, List<Block> R,
                                            Dictionary<AssignCmd, Dictionary<Variable, Constant>> predConsts) /* modifies */
        {
            var assignGuarder = new AssignmentGuarder(program, implementation);
            assignGuarder.guardAssignments(L, R, predConsts);
        }


        private static void guardAssumesOnLeftRight(Program program, Implementation implementation,
                                            List<Block> L, List<Block> R,
                                            Dictionary<AssumeCmd, Constant> guardAssumeConsts) /* modifies */
        {
            var assumeGuarder = new AssumeGuarder(program, implementation);
            assumeGuarder.guardAssumes(L, R, guardAssumeConsts);
        }

        private static void analyzeDependencies(Program program, Implementation implementation,
                                    List<Block> L, List<Block> R,
                                    Dictionary<Tuple<AssignCmd, Variable>, HashSet<Variable>> dependencies) /* modifies */
        {
            var dependencyAnalyzer = new DependencyAnalyzer(program, implementation);
            dependencyAnalyzer.computeDependencies(L, R, dependencies);
        }

        //compute inequalities
        private static List<Tuple<Constant, Constant>> FindDisequalitiesFromTest(Program program, Implementation implementation, List<Block> L, List<Block> R,
            Counterexample cex, Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> leftAssumeConsts, Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> rightAssumeConsts)
        {
            List<Tuple<Constant, Constant>> inequalities = new List<Tuple<Constant, Constant>>();
            Dictionary<Constant, Model.Element> modelForCex = Utils.ModelForCex(program, implementation, cex);

            List<Block> L_cex = blocksInCexPath(cex, L);
            List<Block> R_cex = blocksInCexPath(cex, R);

            foreach (AssignCmd left_key in leftAssumeConsts.Keys)
            {
                //only consider constants along the cex path
                if (!L_cex.Contains(cmdToBlock[left_key as Cmd])) { continue; }
                foreach (Tuple<Variable, Constant> left_tvc in leftAssumeConsts[left_key])
                {
                    foreach (AssignCmd right_key in rightAssumeConsts.Keys)
                    {
                        //only consider constants along the cex path
                        if (!R_cex.Contains(cmdToBlock[right_key as Cmd])) { continue; }
                        foreach (Tuple<Variable, Constant> right_tvc in rightAssumeConsts[right_key])
                        {
                            Constant left_c = left_tvc.Item2, right_c = right_tvc.Item2;
                            if (!modelForCex.ContainsKey(left_c) || !modelForCex.ContainsKey(right_c)) { continue; }
                            if (modelForCex[left_c].Kind != modelForCex[right_c].Kind) { continue; }
                            if (modelForCex[left_c] != modelForCex[right_c])
                            {
                                inequalities.Add(new Tuple<Constant, Constant>(left_c, right_c));
                            }
                        }
                    }
                }
            }
            if (Utils.verbosityLevel(3))
            {
                Console.WriteLine("Printing inequalities from passing runs");
                foreach (var t in inequalities)
                {
                    Console.WriteLine("{0} with {1}", t.Item1, t.Item2);
                }
                Console.WriteLine("End Printing inequalities from passing runs");
            }

            return inequalities;

        }

        //compute inequalities
        private static List<Tuple<Constant, Constant>> FindEqualitiesFromTest(Program program, Implementation implementation, List<Block> L, List<Block> R,
            Counterexample cex, Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> leftAssumeConsts, Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> rightAssumeConsts)
        {
            List<Tuple<Constant, Constant>> equalities = new List<Tuple<Constant, Constant>>();
            Dictionary<Constant, Model.Element> modelForCex = Utils.ModelForCex(program, implementation, cex);

            List<Block> L_cex = blocksInCexPath(cex, L);
            List<Block> R_cex = blocksInCexPath(cex, R);
            foreach (AssignCmd left_key in leftAssumeConsts.Keys)
            {
                //only consider constants along the cex path
                if (!L_cex.Contains(cmdToBlock[left_key as Cmd])) { continue; }
                foreach (Tuple<Variable, Constant> left_tvc in leftAssumeConsts[left_key])
                {
                    foreach (AssignCmd right_key in rightAssumeConsts.Keys)
                    {
                        if (!R_cex.Contains(cmdToBlock[right_key as Cmd])) { continue; }
                        foreach (Tuple<Variable, Constant> right_tvc in rightAssumeConsts[right_key])
                        {
                            Constant left_c = left_tvc.Item2, right_c = right_tvc.Item2;
                            if (!modelForCex.ContainsKey(left_c) || !modelForCex.ContainsKey(right_c)) { continue; }
                            if (modelForCex[left_c].Kind != modelForCex[right_c].Kind) { continue; }
                            if (modelForCex[left_c] == modelForCex[right_c])
                            {
                                equalities.Add(new Tuple<Constant, Constant>(left_c, right_c));
                            }
                        }
                    }
                }
            }
            if (Utils.verbosityLevel(3))
            {
                Console.WriteLine("Printing equalities from passing runs");
                foreach (var t in equalities)
                {
                    Console.WriteLine("{0} with {1}", t.Item1, t.Item2);
                }
                Console.WriteLine("End Printing equalities from passing runs");
            }

            return equalities;

        }

        private static void injectGuardedAssertsOnRight(Program program, Implementation implementation, List<Block> L, List<Block> R)
        {
            AssertGuarder assertGuarder = new AssertGuarder(program, implementation);
            assertGuarder.guardAssert(L, R);

            //This program contains an ensures clause
            if (phi_guard == null && neg_phi_guard == null)
            {
                Utils.Assert(implementation.Proc.Ensures.Count == 1, "Unexpected number of ensures found.");

                Ensures assurance = implementation.Proc.Ensures[0];
                //wrap assurance with guards
                phi_guard = new Constant(Token.NoToken, new TypedIdent(Token.NoToken, "rootcause_phi_guard", BType.Bool), false);
                neg_phi_guard = new Constant(Token.NoToken, new TypedIdent(Token.NoToken, "rootcause_neg_phi_guard", BType.Bool), false);
                program.AddTopLevelDeclaration(phi_guard);
                program.AddTopLevelDeclaration(neg_phi_guard);

                Expr guardedAssuranceExpr = Expr.And(Expr.Imp(IdentifierExpr.Ident(phi_guard), assurance.Condition),
                                        Expr.Imp(IdentifierExpr.Ident(neg_phi_guard), Expr.Not(assurance.Condition)));
                Ensures guardedAssurance = new Ensures(false, guardedAssuranceExpr);

                implementation.Proc.Ensures.Remove(assurance);
                implementation.Proc.Ensures.Add(guardedAssurance);
            }

            //We had theses assert false for checking that we did not make paths feasible.
            //We don't need this anymore since we don't add any assumes, but only assignments
            //AssertFalseInjector assertFalseInjector = new AssertFalseInjector(program, implementation);
            //assertFalseInjector.injectFalseAsserts(L, R, assertConsts);

        }

        class DependencyAnalyzer : StandardVisitor
        {
            //requires
            private Implementation implementation;
            private Program program;
            private List<Block> L;
            private List<Block> R;

            //modifies
            //maps the (instance lhs variable at this assign) --> {globals U inputs}
            private Dictionary<Tuple<AssignCmd, Variable>, HashSet<Variable>> dependencies;

            //internal
            private List<Variable> inputs;
            private List<Variable> outputs;
            private List<GlobalVariable> global_variables;
            private List<Constant> global_constants;
            private List<Variable> local_variables;
            private AssignCmd sourceNode;
            private AssignCmd firstNode;

            //eg. D(b2,v3) = D(b1,v1) \union D(b1,v2) becomes flowEquations[(b2,v3)] = List({ (b1,v1), (b1,v2) })
            //maps (lhs at an assign ---> immediate predecessors for this variable)
            //TODO: each assign (x := e) contains all variables {y,z,w} even if they are not in the R/W set
            //      May lead to blowup on Siemens examples

            //inflowEquations maps each rhs to its predecessor dependencies
            private Dictionary<Tuple<AssignCmd, Variable>, List<Tuple<AssignCmd, Variable>>> inflowEquations;
            //outflowEquations maps each lhs to its rhs at this assign
            private Dictionary<Tuple<AssignCmd, Variable>, List<Tuple<AssignCmd, Variable>>> outflowEquations;

            public DependencyAnalyzer(Program program, Implementation implementation)
            {
                this.implementation = implementation;
                this.program = program;
            }

            public void computeDependencies(List<Block> L, List<Block> R, Dictionary<Tuple<AssignCmd, Variable>, HashSet<Variable>> dependencies)
            {
                this.dependencies = dependencies;
                this.L = L;
                this.R = R;

                //extract program inputs, global consts, global vars
                this.inflowEquations = new Dictionary<Tuple<AssignCmd, Variable>, List<Tuple<AssignCmd, Variable>>>();
                this.outflowEquations = new Dictionary<Tuple<AssignCmd, Variable>, List<Tuple<AssignCmd, Variable>>>();

                Utils.Assert((this.implementation as DeclWithFormals) != null, "Implementation as DeclWithFormals");
                this.inputs = new List<Variable>();
                this.outputs = new List<Variable>();
                this.global_variables = new List<GlobalVariable>();
                this.global_constants = new List<Constant>();
                this.local_variables = new List<Variable>();
                this.inputs.AddRange((this.implementation as DeclWithFormals).InParams);
                this.outputs.AddRange((this.implementation as DeclWithFormals).OutParams);
                this.global_variables.AddRange(this.program.TopLevelDeclarations.Where(d => (d is GlobalVariable)).
                    ToList<Declaration>().ConvertAll<GlobalVariable>(d => (d as GlobalVariable)));
                this.global_constants.AddRange(this.program.TopLevelDeclarations.Where(d => (d is Constant)).
                    ToList<Declaration>().ConvertAll<Constant>(d => (d as Constant)));
                this.local_variables.AddRange(this.implementation.LocVars);

                sourceNode = new AssignCmd(Token.NoToken, new List<AssignLhs>(), new List<Expr>());

                //construct flow equations
                constructEquations();
                if (Utils.verbosityLevel(2))
                {
                    Console.WriteLine("Constructed Dependency Equations...");
                }
                //solve flow equations using a fixed point iteration
                solveEquations();
                if (Utils.verbosityLevel(2))
                {
                    Console.WriteLine("Solved Dependency Equations...");
                }
                /*
                if (Utils.verbosityLevel(2))
                {
                    List<Variable> trackedVariables = local_variables.Concat(global_variables).Concat(global_constants).Concat(inputs).Concat(outputs).ToList<Variable>();
                    foreach (Tuple<AssignCmd, Variable> av in dependencies.Keys)
                    {
                        AssignCmd a = av.Item1; Variable v = av.Item2;
                        HashSet<Variable> deps = this.dependencies[new Tuple<AssignCmd, Variable>(a, v)];
                        Console.Write("Assignment {0}, Variable {1}: ", a, v.Name);
                        foreach (Variable dep in deps)
                        {
                            Console.Write(dep.Name + ",");
                        }
                        Console.Write("\n");
                        Console.WriteLine("-------------------------------------------");
                    }
                }
                 * */
            }

            private void constructEquations()
            {
                foreach (AssignCmd node in cdfg.Keys)
                {
                    VisitAssignment(node);
                }
            }

            private void VisitAssignment(AssignCmd current_node)
            {
                List<Variable> trackedVariables = local_variables.Concat(global_variables).Concat(global_constants).Concat(inputs).Concat(outputs).ToList<Variable>();

                //initialize inflowequations for all variables
                if (cdfg[current_node].Item1.Count == 0) //no predecessors
                {
                    this.firstNode = current_node;
                    //set its inflowEquations to come from source block
                    foreach (Variable v in trackedVariables)
                    {
                        Tuple<AssignCmd, Variable> key = new Tuple<AssignCmd, Variable>(current_node, v);
                        this.inflowEquations[key] = new List<Tuple<AssignCmd, Variable>>();
                        this.inflowEquations[key].Add(new Tuple<AssignCmd, Variable>(sourceNode, v));
                    }
                }
                else
                {
                    //has predecessors
                    foreach (Variable v in trackedVariables)
                    {
                        Tuple<AssignCmd, Variable> key = new Tuple<AssignCmd, Variable>(current_node, v);
                        this.inflowEquations[key] = new List<Tuple<AssignCmd, Variable>>();
                        //Add inflow entry for each predecessor node
                        foreach (AssignCmd incomingNode in cdfg[current_node].Item1)
                        {
                            this.inflowEquations[key].Add(new Tuple<AssignCmd, Variable>(incomingNode, v));
                        }
                    }

                }

                //initialize outflowequations for all variables, updated and preserved
                foreach (Variable v in trackedVariables)
                {
                    Tuple<AssignCmd, Variable> key = new Tuple<AssignCmd, Variable>(current_node, v);
                    this.outflowEquations[key] = new List<Tuple<AssignCmd, Variable>>();
                    this.outflowEquations[key].Add(new Tuple<AssignCmd, Variable>(current_node, v));
                }

                //Change outflow equations for all the updated variables
                Utils.Assert(current_node.Lhss.Count() == current_node.Rhss.Count(), "#lhs == #rhs");
                for (int i = 0; i < current_node.Lhss.Count(); ++i)
                {
                    Expr rhs = current_node.Rhss[i];
                    Variable lhs = current_node.Lhss[i].DeepAssignedVariable;

                    //Dep_out
                    Tuple<AssignCmd, Variable> key = new Tuple<AssignCmd, Variable>(current_node, lhs);
                    this.outflowEquations[key] = new List<Tuple<AssignCmd, Variable>>();

                    foreach (Variable rhsDep in computeExprDeps(rhs))
                    {
                        //Dep_out for lhs
                        this.outflowEquations[key].Add(new Tuple<AssignCmd, Variable>(current_node, rhsDep));
                    }
                }

            }


            private HashSet<Variable> computeExprDeps(Expr e)
            {
                if (e is NAryExpr)
                {
                    HashSet<Variable> deps = new HashSet<Variable>();
                    foreach (Expr e_sub in (e as NAryExpr).Args)
                    {
                        deps = new HashSet<Variable>(deps.Union<Variable>(computeExprDeps(e_sub)));
                    }
                    return deps;
                }
                else if (e is IdentifierExpr)
                {
                    return new HashSet<Variable>(new Variable[] { (e as IdentifierExpr).Decl });
                }

                return new HashSet<Variable>();
            }


            void solveEquations()
            {
                //set of all vars whose dependency you track Locals U Globals U consts U Inp U Output
                List<Variable> trackedVariables = local_variables.Concat(global_variables).Concat(global_constants).Concat(inputs).Concat(outputs).ToList<Variable>();
                //range of dependencies Globals U Constants U Inputs
                List<Variable> externalVariables = global_variables.Concat<Variable>(global_constants).Concat(inputs).ToList<Variable>();

                foreach (Variable v in trackedVariables)
                {
                    //initialize sourceNode to have dependency on inputs and globals
                    Tuple<AssignCmd, Variable> key = new Tuple<AssignCmd, Variable>(this.sourceNode, v);
                    if (externalVariables.Contains(v)) { this.dependencies[key] = new HashSet<Variable>(new Variable[] { v }); }
                    else { this.dependencies[key] = new HashSet<Variable>(); }

                    //initialize depSet of other nodes to be empty
                    foreach (AssignCmd a in cdfg.Keys)
                    {
                        key = new Tuple<AssignCmd, Variable>(a, v);
                        this.dependencies[key] = new HashSet<Variable>();
                    }
                }

                List<Tuple<AssignCmd, Variable>> worklist = new List<Tuple<AssignCmd, Variable>>();
                //worklist.AddRange(inflowEquations.Keys);
                foreach (Variable v in trackedVariables)
                {
                    worklist.Add(new Tuple<AssignCmd, Variable>(this.firstNode, v));
                }
                //fixed point iteration where the Lattice is on the set of variables in program, and the order is the subset relation
                while (worklist.Count > 0)
                {
                    //remove node n from worklist
                    Tuple<AssignCmd, Variable> work_node = worklist[0];
                    worklist.Remove(work_node);

                    //compute in_n using flow equations
                    //compute out_n = f(in_n) using flow equations
                    List<Tuple<AssignCmd, Variable>> work_node_outflow = outflowEquations[work_node];
                    //this is the set of all transitive dependencies for this assignment
                    HashSet<Variable> work_node_deps = new HashSet<Variable>(); //globals U consts U inputs
                    //iterating over each (assign,variable) for every variable
                    foreach (Tuple<AssignCmd, Variable> work_node_input in work_node_outflow) //{y,z} in x := y + z
                    {
                        List<Tuple<AssignCmd, Variable>> work_node_inflow = inflowEquations[work_node_input]; //{(a1,y), (a2,y)} for y updated in a1 and a2
                        HashSet<Variable> work_node_input_deps = new HashSet<Variable>();
                        //Union over the incoming dependency edges for each variable
                        foreach (Tuple<AssignCmd, Variable> work_node_input_from_block in work_node_inflow)
                        {
                            this.dependencies[work_node_input_from_block].ToList<Variable>().ForEach(d => work_node_input_deps.Add(d));
                        }
                        //
                        work_node_input_deps.ToList<Variable>().ForEach(d => work_node_deps.Add(d));
                    }

                    //FIXME do full equality. But this also works because the dependency set grows monotonically.
                    //if out_n changed then worklist = worklist + succ(n)
                    //should we update depSet for worknode?
                    if (work_node_deps.Count > dependencies[work_node].Count)
                    {
                        //add the successorts to WL
                        dependencies[work_node] = work_node_deps;
                        //compute successor blocks
                        List<AssignCmd> work_node_succ = cdfg[work_node.Item1].Item2;
                        foreach (AssignCmd a in work_node_succ)
                        {
                            //Each successor node must update the dependency set for work_node's variable
                            worklist.Add(new Tuple<AssignCmd, Variable>(a, work_node.Item2));
                            //Update all successors that depend on work_node's variable
                            List<Variable> a_Lhss = a.Lhss.Select(v => v.DeepAssignedVariable).ToList();
                            foreach (Variable a_Lhs in a_Lhss)
                            {
                                //only consider successor nodes (x := y, z) where z is in lhs
                                if (outflowEquations[new Tuple<AssignCmd, Variable>(a, a_Lhs)].
                                    Contains(new Tuple<AssignCmd, Variable>(a, work_node.Item2)))
                                {
                                    worklist.Add(new Tuple<AssignCmd, Variable>(a, a_Lhs));
                                }
                            }
                        }
                    }

                }
            }

        }

        class AssignmentGuarder : StandardVisitor
        {
            //requires
            private Implementation implementation;
            private Program program;
            private List<Block> L;
            private List<Block> R;

            //modifies
            private Dictionary<AssignCmd, Dictionary<Variable, Constant>> predConsts;

            static int havocCount = 0;

            public AssignmentGuarder(Program program, Implementation implementation)
            {
                this.implementation = implementation;
                this.program = program;
            }

            public void guardAssignments(List<Block> L, List<Block> R, Dictionary<AssignCmd, Dictionary<Variable, Constant>> predConsts)
            {
                this.predConsts = predConsts;
                this.L = L;
                this.R = R;

                this.Visit(implementation);
            }

            private Constant CreateNewPredConst()
            {
                var a = new Constant(Token.NoToken, new TypedIdent(Token.NoToken, "_bpred_" +
                    deepCount<AssignCmd, Variable, Constant>(predConsts), BType.Bool), false);
                program.AddTopLevelDeclaration(a);
                return a;
            }

            public override Cmd VisitAssignCmd(AssignCmd node)
            {
                Block containingBlock = cmdToBlock[node];
                if (this.L.Contains(containingBlock))
                {
                    return base.VisitAssignCmd(node);
                }

                Utils.Assert(node.Lhss.Count() == node.Rhss.Count(), "#lhs == #rhs");

                List<AssignLhs> new_Lhss = new List<AssignLhs>();
                List<Expr> new_Rhss = new List<Expr>();

                for (int i = 0; i < node.Lhss.Count(); ++i)
                {
                    var predConst = CreateNewPredConst();

                    Variable lhs = node.Lhss[i].DeepAssignedVariable;
                    Expr lhsExpr = node.Lhss[i].AsExpr;
                    //node.Rhss[i] = new NAryExpr(Token.NoToken, new IfThenElse(Token.NoToken),
                    //        new ExprSeq(Expr.Not(IdentifierExpr.Ident(predConst)), CreateHavocConst(lhsId), node.Rhss[i]));
                    new_Lhss.Add(node.Lhss[i]);
                    new_Rhss.Add(new NAryExpr(Token.NoToken, new IfThenElse(Token.NoToken),
                        new List<Expr>(){Expr.Not(IdentifierExpr.Ident(predConst)), CreateHavocConst(lhsExpr), node.Rhss[i]}));

                    if (predConsts.ContainsKey(node))
                    {
                        predConsts[node][lhs] = predConst;
                    }
                    else
                    {
                        predConsts[node] = new Dictionary<Variable, Constant>();
                        predConsts[node][lhs] = predConst;
                    }
                }

                AssignCmd new_node = new AssignCmd(Token.NoToken, new_Lhss, new_Rhss);
                return base.VisitAssignCmd(new_node);
                //return base.VisitAssignCmd(node);
            }
            Expr CreateHavocConst(Expr e)
            {
                return CreateHavocConst(e.tok, e.Type);
            }
            Expr CreateHavocConst(IToken tok, BType t)
            {
                string name = "_havoc#" + checked(havocCount++);
                TypedIdent typedIdent = new TypedIdent(tok, name, t);
                Constant constant = new Constant(tok, typedIdent, false);
                IdentifierExpr hExpr = new IdentifierExpr(tok, constant);
                program.AddTopLevelDeclaration(constant);
                return hExpr;
            }
        }

        class AssumeGuarder : StandardVisitor
        {
            //requires
            private Implementation implementation;
            private Program program;
            private List<Block> L;
            private List<Block> R;

            //modifies
            private Dictionary<AssumeCmd, Constant> guardAssumeConsts;

            static int assumeCount = 0;

            public AssumeGuarder(Program program, Implementation implementation)
            {
                this.implementation = implementation;
                this.program = program;
            }

            public void guardAssumes(List<Block> L, List<Block> R, Dictionary<AssumeCmd, Constant> guardAssumeConsts)
            {
                this.guardAssumeConsts = guardAssumeConsts;
                this.L = L;
                this.R = R;

                this.Visit(implementation);
            }

            private Constant CreateNewPredConst()
            {
                var a = new Constant(Token.NoToken, new TypedIdent(Token.NoToken, "_assumeguard_" + assumeCount, BType.Bool), false);
                assumeCount = checked(assumeCount + 1);
                program.AddTopLevelDeclaration(a);
                return a;
            }

            public override Cmd VisitAssumeCmd(AssumeCmd node)
            {
                Constant predConst = CreateNewPredConst();
                Expr newExpr = Expr.Imp(new IdentifierExpr(Token.NoToken, predConst), node.Expr);

                AssumeCmd new_node = new AssumeCmd(Token.NoToken, newExpr);
                return base.VisitAssumeCmd(new_node);
            }
        }

        class LeftInjector : StandardVisitor
        {
            //requires
            private Implementation implementation;
            private Program program;
            private List<Block> L;
            private List<Block> R;

            //modifies
            private Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> leftAssumeConsts;

            //internal
            private FilterManager filterManager;

            public LeftInjector(Program program, Implementation implementation)
            {
                this.implementation = implementation;
                this.program = program;
            }

            public void injectAssumes(List<Block> L, List<Block> R,
                Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> leftAssumeConsts)
            {
                this.leftAssumeConsts = leftAssumeConsts;
                this.L = L;
                this.R = R;

                this.filterManager = new FilterManager(null, FilterManager.Side.LeftProgram);

                this.Visit(implementation);
            }

            public override List<Cmd> VisitCmdSeq(List<Cmd> cmdSeq)
            {
                List<Cmd> newCmdSeq = new List<Cmd>();
                var blockLhss = new HashSet<HashSet<Variable>>();

                List<List<Cmd>> commandsInL = L.ConvertAll<List<Cmd>>(b => b.Cmds);

                //Don't modify the right program
                if (!commandsInL.Contains(cmdSeq)) { return base.VisitCmdSeq(cmdSeq); }

                //Collect all variables updated in this block, both by parallel and non-parallel assignments
                foreach (var c in cmdSeq)
                {
                    newCmdSeq.Add(c);
                    //TODO: add call/havoc cmds (or not possibly)
                    var a = c as AssignCmd; if (a == null) continue;
                    Utils.Assert(a.Lhss.Count == a.Rhss.Count, "#lhs != #rhs");

                    //We still want to instrument the left side
                    //if (Options.applyLeftFilter && (this.filterManager.filter(null, a) == false)) { continue; } //Filter

                    Expr assumeExpr = (Expr)Expr.True;
                    for (int i = 0; i < a.Lhss.Count; i++)
                    {
                        Variable lhs = a.Lhss[i].DeepAssignedVariable;
                        Constant cn = new Constant(Token.NoToken,
                            new TypedIdent(Token.NoToken, "left_" + lhs.Name + "__line__" + lhs.Line + "_" +
                                deepCount<AssignCmd, Tuple<Variable, Constant>>(this.leftAssumeConsts), lhs.TypedIdent.Type), false);
                        this.program.AddTopLevelDeclaration(cn);
                        recordConstant(new Tuple<Variable, Constant>(lhs, cn), a);
                        assumeExpr = Expr.And(assumeExpr, Expr.Eq(new IdentifierExpr(Token.NoToken, lhs), new IdentifierExpr(Token.NoToken, cn)));
                    }
                    //add 1 assume for all variables updated by this assignment
                    if (!assumeExpr.Equals((Expr)Expr.True)) { newCmdSeq.Add(new AssumeCmd(Token.NoToken, assumeExpr)); }


                    //add assumes capturing inner expressions for mapstore updates
                    for (int i = 0; i < a.Lhss.Count; i++)
                    {
                        NAryExpr nexpr = a.Rhss[i] as NAryExpr; if (nexpr == null) continue;
                        if (!(nexpr.Fun is MapStore)) continue; //rhs is doing a mapstore
                        if (!(a.Lhss[i].Type is MapType)) continue; //lhs is a map type

                        //Utils.Assert(nexpr.Args.elems.Count() == 3, "Found GT/LT 3 expressions in a MapStore");
                        Expr e0 = nexpr.Args[0];
                        Expr e1 = nexpr.Args[1];
                        Expr e2 = nexpr.Args[2];

                        //FIXME: Make sure rootcause_inner does not appear as another var/const in the program
                        Constant cn = new Constant(Token.NoToken,
                            new TypedIdent(Token.NoToken, "rootcause_inner_" + deepCount<AssignCmd, Tuple<Variable, Constant>>(this.leftAssumeConsts), e2.Type), false);
                        Constant cn_var = new Constant(Token.NoToken,
                            new TypedIdent(Token.NoToken, "rootcause_inner_" + deepCount<AssignCmd, Tuple<Variable, Constant>>(this.leftAssumeConsts) + "_var", e2.Type));
                        this.program.AddTopLevelDeclaration(cn);
                        recordConstant(new Tuple<Variable, Constant>(cn_var, cn), a);
                        newCmdSeq.Add(new AssumeCmd(Token.NoToken, Expr.Eq(new IdentifierExpr(Token.NoToken, cn), e2)));
                    }
                }

                return base.VisitCmdSeq(newCmdSeq);
            }

            private void recordConstant(Tuple<Variable, Constant> assumeInfo, AssignCmd cmd)
            {
                if (!this.leftAssumeConsts.ContainsKey(cmd))
                {
                    this.leftAssumeConsts[cmd] = new List<Tuple<Variable, Constant>>();
                }
                this.leftAssumeConsts[cmd].Add(assumeInfo);
            }
        }

        public class FilterManager
        {
            public enum Side { LeftProgram, RightProgram };

            //requires
            private Dictionary<Tuple<AssignCmd, Variable>, HashSet<Variable>> dependencies;
            private Side side;

            private enum Filter
            {
                singleFilter, parallelFilter, trivialFilter, independantFilter,
                literalFilter, immediateFilter, arithmeticFilter, lineNumberFilter,
                conditionalFilter, calleeFilter, loadFilter, storeFilter, movFilter, procedureCallFilter
            };

            //internal
            List<Filter> OnlyFilters, DropFilters;
            BigNum prev, next;

            public delegate bool FilterDelegate(AssignCmd l, AssignCmd r);
            Dictionary<Filter, FilterDelegate> delegates;

            public FilterManager(Dictionary<Tuple<AssignCmd, Variable>, HashSet<Variable>> dependencies, Side side)
            {

                this.dependencies = dependencies;
                this.side = side;

                OnlyFilters = new List<Filter>(); DropFilters = new List<Filter>();

                //always enable trivialFilter
                DropFilters.Add(Filter.trivialFilter);

                if (Options.singleFilter == FilterAction.Drop) { DropFilters.Add(Filter.singleFilter); }
                else if (Options.singleFilter == FilterAction.Only) { OnlyFilters.Add(Filter.singleFilter); }
                if (Options.parallelFilter == FilterAction.Drop) { DropFilters.Add(Filter.parallelFilter); }
                else if (Options.parallelFilter == FilterAction.Only) { OnlyFilters.Add(Filter.parallelFilter); }
                //if (Options.trivialFilter == FilterAction.Drop) { DropFilters.Add(Filter.trivialFilter); }
                //else if (Options.trivialFilter == FilterAction.Only) { OnlyFilters.Add(Filter.trivialFilter); }
                if (Options.independantFilter == FilterAction.Drop) { DropFilters.Add(Filter.independantFilter); }
                else if (Options.independantFilter == FilterAction.Only) { OnlyFilters.Add(Filter.independantFilter); }
                if (Options.literalFilter == FilterAction.Drop) { DropFilters.Add(Filter.literalFilter); }
                else if (Options.literalFilter == FilterAction.Only) { OnlyFilters.Add(Filter.literalFilter); }
                if (Options.immediateFilter == FilterAction.Drop) { DropFilters.Add(Filter.immediateFilter); }
                else if (Options.immediateFilter == FilterAction.Only) { OnlyFilters.Add(Filter.immediateFilter); }
                if (Options.arithmeticFilter == FilterAction.Drop) { DropFilters.Add(Filter.arithmeticFilter); }
                else if (Options.arithmeticFilter == FilterAction.Only) { OnlyFilters.Add(Filter.arithmeticFilter); }
                if (Options.lineNumberFilter == FilterAction.Drop) { DropFilters.Add(Filter.lineNumberFilter); }
                else if (Options.lineNumberFilter == FilterAction.Only) { OnlyFilters.Add(Filter.lineNumberFilter); }
                if (Options.conditionalFilter == FilterAction.Drop) { DropFilters.Add(Filter.conditionalFilter); }
                else if (Options.conditionalFilter == FilterAction.Only) { OnlyFilters.Add(Filter.conditionalFilter); }
                if (Options.calleeFilter == FilterAction.Drop) { DropFilters.Add(Filter.calleeFilter); }
                else if (Options.calleeFilter == FilterAction.Only) { OnlyFilters.Add(Filter.calleeFilter); }
                if (Options.loadFilter == FilterAction.Drop) { DropFilters.Add(Filter.loadFilter); }
                else if (Options.loadFilter == FilterAction.Only) { OnlyFilters.Add(Filter.loadFilter); }
                if (Options.storeFilter == FilterAction.Drop) { DropFilters.Add(Filter.storeFilter); }
                else if (Options.storeFilter == FilterAction.Only) { OnlyFilters.Add(Filter.storeFilter); }
                if (Options.movFilter == FilterAction.Drop) { DropFilters.Add(Filter.movFilter); }
                else if (Options.movFilter == FilterAction.Only) { OnlyFilters.Add(Filter.movFilter); }
                if (Options.procedureCallFilter == FilterAction.Drop) { DropFilters.Add(Filter.procedureCallFilter); }
                else if (Options.procedureCallFilter == FilterAction.Only) { OnlyFilters.Add(Filter.procedureCallFilter); }

                //if (OnlyFilters.Count > 0 && DropFilters.Count > 0) { throw new Exception("Cannot use both Drop and Only filters"); }
                //filter specific checks
                if ((Options.lineNumberFilter != FilterAction.Allow) &&
                    (Options.lineFilterLeftLine.Count == 0 || Options.lineFilterRightLine.Count == 0))
                {
                    throw new Exception("Set lineFilterLeftLine and lineFilterRightLine when using lineNumberFilter");
                }

                //replacing this logic with just looking for (lineFilterLeftLine,lineFilterRightLine)

                //BigNum hint_num = BigNum.FromInt(Options.lineFilterLeftLine);
                //prev = BigNum.ZERO;
                //next = BigNum.FromInt(10000); //FIXME: Replace 10000 with infinity
                //foreach (BigNum num in CmdToSourceline.Values)
                //{
                //    if (num > prev && num < hint_num) { prev = num; }
                //    else if (num > hint_num && num < next) { next = num; }
                //}

                delegates = new Dictionary<Filter, FilterDelegate>();
                delegates[Filter.singleFilter] = new FilterDelegate(singleFilterFunction);
                delegates[Filter.parallelFilter] = new FilterDelegate(parallelFilterFunction);
                delegates[Filter.trivialFilter] = new FilterDelegate(trivialFilterFunction);
                delegates[Filter.independantFilter] = new FilterDelegate(independantFilterFunction);
                delegates[Filter.literalFilter] = new FilterDelegate(literalFilterFunction);
                delegates[Filter.immediateFilter] = new FilterDelegate(immediateFilterFunction);
                delegates[Filter.arithmeticFilter] = new FilterDelegate(arithmeticFilterFunction);
                delegates[Filter.lineNumberFilter] = new FilterDelegate(lineNumberFilterFunction);
                delegates[Filter.conditionalFilter] = new FilterDelegate(conditionalFilterFunction);
                delegates[Filter.calleeFilter] = new FilterDelegate(calleeFilterFunction);
                delegates[Filter.loadFilter] = new FilterDelegate(loadFilterFunction);
                delegates[Filter.storeFilter] = new FilterDelegate(storeFilterFunction);
                delegates[Filter.movFilter] = new FilterDelegate(movFilterFunction);
                delegates[Filter.procedureCallFilter] = new FilterDelegate(procedureCallFilterFunction);
            }

            public bool filter(AssignCmd rightAssignment, AssignCmd leftAssignment)
            {
                //FIXME: chaining
                if (DropFilters.Count > 0)
                {
                    if (DropFilters.Any(f => delegates[f](leftAssignment, rightAssignment)))
                    {
                        return false;
                    }
                    //if no OnlyFilters, then whatever doesnt get dropped must be added
                    if (OnlyFilters.Count == 0) { return true; }
                }

                if (OnlyFilters.Count > 0)
                {
                    return OnlyFilters.Any(f => delegates[f](leftAssignment, rightAssignment));
                }

                //add it if no filters present, or if it doesnt get dropped and no only filters present
                return true;
            }

            public bool singleFilterFunction(AssignCmd l, AssignCmd r)
            {
                AssignCmd a = side == Side.RightProgram ? r : l;
                return (a.Lhss.Count == 1);
            }
            public bool parallelFilterFunction(AssignCmd l, AssignCmd r)
            {
                AssignCmd a = side == Side.RightProgram ? r : l;
                return (a.Lhss.Count > 1);
            }
            public bool trivialFilterFunction(AssignCmd l, AssignCmd r)
            {
                //new: Adding filters for "HavocVal" instructions
                AssignCmd a = side == Side.RightProgram ? r : l;
                if (a.Rhss.All(expr => expr is IdentifierExpr)) return true;
                if (a.Rhss.All(expr => FunctionNameContains(expr, "HavocVal"))) return true;
                return false;
            }

            public bool independantFilterFunction(AssignCmd l, AssignCmd r)
            {
                if (side == Side.LeftProgram) { return false; }

                //do their dependencies intersect?
                if (l.Lhss.Count != r.Lhss.Count) { return true; } //must be independant
                for (int i = 0; i < r.Lhss.Count; i++)
                {
                    HashSet<Variable> leftAssignment_depSet = this.dependencies[new Tuple<AssignCmd, Variable>(l, l.Lhss[i].DeepAssignedVariable)];
                    HashSet<Variable> rightAssignment_depSet = this.dependencies[new Tuple<AssignCmd, Variable>(r, r.Lhss[i].DeepAssignedVariable)];
                    if (leftAssignment_depSet.Intersect(rightAssignment_depSet).Count() != 0) { return false; }
                }
                return true;
            }

            public bool conditionalFilterFunction(AssignCmd l, AssignCmd r)
            {
                AssignCmd a = side == Side.RightProgram ? r : l;
                return (a.Lhss.Count == 1 && a.Lhss[0].DeepAssignedVariable.Name == "rootcause_cond_var");
            }

            public bool calleeFilterFunction(AssignCmd l, AssignCmd r)
            {
                AssignCmd a = side == Side.RightProgram ? r : l;
                return (a.Lhss.Count == 1 && a.Lhss[0].DeepAssignedVariable.Name == "rootcause_callee_var");
            }

            public bool literalFilterFunction(AssignCmd l, AssignCmd r)
            {
                AssignCmd a = side == Side.RightProgram ? r : l;
                for (int i = 0; i < a.Rhss.Count; i++)
                {
                    if (!(a.Rhss[i] is LiteralExpr)) { return false; }
                }
                return true;
            }

            //true if assignment contains
            public bool immediateFilterFunction(AssignCmd l, AssignCmd r)
            {
                AssignCmd a = side == Side.RightProgram ? r : l;
                return a.Rhss.Any(rhs => exprContainsImmediateLiterals(rhs));
            }

            private static bool exprContainsImmediateLiterals(Expr e)
            {
                if (e is NAryExpr)
                {
                    if (FunctionNameContains(e, "imm")) { return true; }
                    else //recurse looking for imm
                    {
                        foreach (Expr e_sub in (e as NAryExpr).Args)
                        {
                            if (exprContainsImmediateLiterals(e_sub)) { return true; }
                        }
                        return false;
                    }
                }

                return false;
            }

            public bool arithmeticFilterFunction(AssignCmd l, AssignCmd r)
            {
                AssignCmd a = side == Side.RightProgram ? r : l;
                for (int i = 0; i < a.Rhss.Count; i++)
                {
                    if (!(a.Rhss[i] is NAryExpr && (a.Rhss[i] as NAryExpr).Fun is BinaryOperator)) { return false; }
                }
                return true;
            }

            //true for all lines that is not hint line. Use this as a drop Filter only
            public bool lineNumberFilterFunction(AssignCmd l, AssignCmd r)
            {
                //if (side == Side.LeftProgram)
                //{
                //    if (CmdToSourceline[l] == BigNum.FromInt(Options.lineFilterLeftLine)) { return true; }
                //}
                //if (side == Side.RightProgram)
                //{
                //    if (CmdToSourceline[r] == BigNum.FromInt(Options.lineFilterRightLine)) { return true; }
                //}
                if (side == Side.LeftProgram)
                {
                    List<BigNum> leftFilterLines = Options.lineFilterLeftLine.ConvertAll(x => BigNum.FromInt(x));
                    if (leftFilterLines.Contains(CmdToSourceline[l])) { return true; }
                }
                if (side == Side.RightProgram)
                {
                    List<BigNum> rightFilterLines = Options.lineFilterRightLine.ConvertAll(x => BigNum.FromInt(x));
                    if (rightFilterLines.Contains(CmdToSourceline[r])) { return true; }
                }
                return false;
                //if (side == Side.LeftProgram) { return false; }
                //AssignCmd a = side == Side.RightProgram ? r : l;

                //if (!CmdToSourceline.ContainsKey(a)) { return false; } //FIXME right now I am returning true if I cant find the key
                //BigNum a_line = CmdToSourceline[a];

                ////FIXME make this >= and <=
                //return !(a_line > prev && a_line < next);
            }

            public bool loadFilterFunction(AssignCmd l, AssignCmd r)
            {
                AssignCmd a = side == Side.RightProgram ? r : l;
                for (int i = 0; i < a.Rhss.Count; i++)
                {
                    if (!FunctionNameContains(a.Rhss[i], "LDR")) { return false; }
                }
                return true;
            }

            public bool storeFilterFunction(AssignCmd l, AssignCmd r)
            {
                AssignCmd a = side == Side.RightProgram ? r : l;
                for (int i = 0; i < a.Rhss.Count; i++)
                {
                    if (!FunctionNameContains(a.Rhss[i], "STR")) { return false; }
                }
                return true;
            }

            public bool movFilterFunction(AssignCmd l, AssignCmd r)
            {
                AssignCmd a = side == Side.RightProgram ? r : l;
                for (int i = 0; i < a.Rhss.Count; i++)
                {
                    if (!FunctionNameContains(a.Rhss[i], "MOV")) { return false; }
                }
                return true;
            }

            public bool procedureCallFilterFunction(AssignCmd l, AssignCmd r)
            {
                AssignCmd a = side == Side.RightProgram ? r : l;
                if (a.Rhss.Count != 2) { return false; }
                return FunctionNameContains(a.Rhss[0], "CallOut") && FunctionNameContains(a.Rhss[1], "CallMem");
            }

            public static bool FunctionNameContains(Expr e, string s)
            {
                return (
                    (e is NAryExpr) &&
                   ((e as NAryExpr).Fun is FunctionCall) &&
                  (((e as NAryExpr).Fun as FunctionCall).FunctionName.Contains(s))
                );
            }
        }

        class RightAssignAssertInjector : StandardVisitor
        {
            //requires
            private Implementation implementation;
            private Program program;
            private List<Block> L;
            private List<Block> R;
            private Dictionary<AssignCmd, Constant> assignAssertGuards;
            private Dictionary<AssignCmd, Constant> assignAssertConstants;

            public RightAssignAssertInjector(Program program, Implementation implementation)
            {
                this.implementation = implementation;
                this.program = program;
            }

            public void injectAssignAsserts(List<Block> L, List<Block> R,
                Dictionary<AssignCmd, Constant> assignAssertGuards, Dictionary<AssignCmd, Constant> assignAssertConstants)
            {
                this.L = L;
                this.R = R;

                this.assignAssertGuards = assignAssertGuards;
                this.assignAssertConstants = assignAssertConstants;

                this.Visit(implementation);
            }

            /// <summary>
            /// Adds assume of the form (rootcause_ph_guard_i ==> rootcause_ph_c != lhs))
            /// only for memory types
            /// </summary>
            /// <param name="cmdSeq"></param>
            /// <returns></returns>
            public override List<Cmd> VisitCmdSeq(List<Cmd> cmdSeq)
            {
                List<Cmd> newCmdSeq = new List<Cmd>();

                List<List<Cmd>> commandsInR = R.ConvertAll<List<Cmd>>(b => b.Cmds);
                if (!commandsInR.Contains(cmdSeq)) { return base.VisitCmdSeq(cmdSeq); } //only for right program

                foreach (Cmd cmd in cmdSeq)
                {
                    newCmdSeq.Add(cmd);
                    var rightAssignment = cmd as AssignCmd;
                    if (rightAssignment == null) continue;

                    List<Variable> mapVars = ContainsUnboundedMemUpdate(rightAssignment);
                    if (mapVars.Count == 1)
                    {
                        Constant rootcause_ph_guard = new Constant(Token.NoToken, new TypedIdent(Token.NoToken, "rootcause_ph_guard_" + (assignAssertGuards.Count + 1), BType.Bool), false);
                        this.assignAssertGuards[rightAssignment] = rootcause_ph_guard;
                        Constant otherMem = new Constant(Token.NoToken, new TypedIdent(Token.NoToken, "rootcause_ph_" + (assignAssertGuards.Count), mapVars[0].TypedIdent.Type), false);
                        this.assignAssertConstants[rightAssignment] = otherMem;

                        this.program.AddTopLevelDeclaration(rootcause_ph_guard);
                        this.program.AddTopLevelDeclaration(otherMem);

                        //Expr newAssertExpr = Expr.Imp(IdentifierExpr.Ident(bassert_k),
                        //    Expr.Eq(new IdentifierExpr(Token.NoToken, otherMem), new IdentifierExpr(Token.NoToken, mapVars[0])));
                        //AssertCmd newAssert = new AssertCmd(Token.NoToken, newAssertExpr);

                        Expr newAssumeExpr = Expr.Imp(IdentifierExpr.Ident(rootcause_ph_guard),
                            Expr.Not(Expr.Eq(new IdentifierExpr(Token.NoToken, otherMem), new IdentifierExpr(Token.NoToken, mapVars[0]))));
                        AssumeCmd newAssume = new AssumeCmd(Token.NoToken, newAssumeExpr);
                        newCmdSeq.Add(newAssume);
                    }
                }
                return base.VisitCmdSeq(newCmdSeq);
            }
        }

        //TODO: Refactor to share code with RightAxiomInjector
        class RightAxiomInjectorCEGIS : StandardVisitor
        {
            //requires
            private Implementation implementation;
            private Program program;
            private List<Block> L;
            private List<Block> R;
            private Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> leftAssumeConsts;
            private Dictionary<Tuple<AssignCmd, Variable>, HashSet<Variable>> dependencies;

            //modifies
            //Dictionary<Block(Right program), List<Tuple<Constant(Candidate, Block(Left program), Variable (right), Variable(left)>>>
            private Dictionary<AssignCmd, List<Tuple<Constant, AssignCmd, Variable, Variable>>> rightCandidates;
            private Dictionary<AssignCmd, Expr> rightAxioms;
            private Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> rightAssumeConsts;

            //internal
            private Dictionary<List<Cmd>, Block> CmdsToBlock;
            private FilterManager leftFilterManager;
            private FilterManager rightFilterManager;

            private int candidateCounter;

            public RightAxiomInjectorCEGIS(Program program, Implementation implementation)
            {
                this.implementation = implementation;
                this.program = program;
            }

            public void injectAxioms(List<Block> L, List<Block> R,
                Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> leftAssumeConsts,
                Dictionary<AssignCmd, List<Tuple<Constant, AssignCmd, Variable, Variable>>> rightCandidates,
                Dictionary<AssignCmd, Expr> rightAxioms,
                Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> rightAssumeConsts,
                Dictionary<Tuple<AssignCmd, Variable>, HashSet<Variable>> dependencies)
            {
                this.rightCandidates = rightCandidates;
                this.rightAxioms = rightAxioms;
                this.rightAssumeConsts = rightAssumeConsts;
                this.leftAssumeConsts = leftAssumeConsts;
                this.dependencies = dependencies;
                this.L = L;
                this.R = R;

                this.CmdsToBlock = computeCmdseqToBlockMapping(L.Concat(R).ToList<Block>());
                this.leftFilterManager = new FilterManager(dependencies, FilterManager.Side.LeftProgram);
                this.rightFilterManager = new FilterManager(dependencies, FilterManager.Side.RightProgram);

                this.candidateCounter = 0;

                this.Visit(implementation);
            }

            private Constant CreateNewIntCandidateConst()
            {
                var a = new Constant(Token.NoToken, new TypedIdent(Token.NoToken, "_cand_" + this.candidateCounter, BType.Int), false);
                this.candidateCounter += 1;
                return a;
            }

            private string CreateNewPredicateName()
            {
                //FIXME: Make sure rootcause_P does not appear as another var/const in the program
                //int uniqueId = deepCount<Block, Tuple<Constant, Block, Variable, Variable>>(this.rightCandidates);
                int uniqueId = this.rightAxioms.Count;
                return "rootcause_P" + "_" + uniqueId;
            }

            public override List<Cmd> VisitCmdSeq(List<Cmd> cmdSeq)
            {
                List<Cmd> newCmdSeq = new List<Cmd>();

                Utils.CheckRootcauseTimeout(sw);
                List<List<Cmd>> commandsInR = R.ConvertAll<List<Cmd>>(b => b.Cmds);
                if (!commandsInR.Contains(cmdSeq)) { return base.VisitCmdSeq(cmdSeq); }

                Block cmdSeqBlock = CmdsToBlock[cmdSeq];

                //capture variables for the general candidates
                if (Options.verbose == 2) Console.Write("\n[RightAxiomInjector] :: Size of CmdSeq = {0}", cmdSeq.Count);
                foreach (Cmd cmd in cmdSeq)
                {
                    Utils.CheckRootcauseTimeout(sw);
                    if (Options.verbose == 2) Console.Write(".");
                    newCmdSeq.Add(cmd);
                    var rightAssignment = cmd as AssignCmd;
                    if (rightAssignment == null) continue;

                    Utils.Assert(rightAssignment.Lhss.Count() == rightAssignment.Rhss.Count(), "#lhs != #rhs");

                    Expr rightAssumeExpr = (Expr)Expr.True;
                    for (int i = 0; i < rightAssignment.Lhss.Count; i++)
                    {
                        Variable lhs = rightAssignment.Lhss[i].DeepAssignedVariable;
                        Constant cn = new Constant(Token.NoToken,
                            new TypedIdent(Token.NoToken, "right_" + lhs.Name + "__line__" + lhs.Line + "_" +
                                deepCount<AssignCmd, Tuple<Variable, Constant>>(this.rightAssumeConsts), lhs.TypedIdent.Type), false);
                        this.program.AddTopLevelDeclaration(cn);
                        recordConstant(new Tuple<Variable, Constant>(lhs, cn), rightAssignment);
                        rightAssumeExpr = Expr.And(rightAssumeExpr, Expr.Eq(new IdentifierExpr(Token.NoToken, lhs), new IdentifierExpr(Token.NoToken, cn)));
                    }
                    //add 1 assume for all variables updated by this assignment
                    if (!rightAssumeExpr.Equals((Expr)Expr.True)) { newCmdSeq.Add(new AssumeCmd(Token.NoToken, rightAssumeExpr)); }

                    //don't club the assumes together as a subset can be removed
                    Expr assignCandAssumes = Expr.True;
                    Dictionary<Variable, BoundVariable> varToBoundedVar = new Dictionary<Variable, BoundVariable>();
                    var assignLhssMatched = new HashSet<Variable>();

                    Constant candidate = CreateNewIntCandidateConst();

                    //parallel Assignments
                    if (rightAssignment.Lhss.Count > 1)
                    {
                        List<Variable> lhss = rightAssignment.Lhss.Select(l => l.DeepAssignedVariable).ToList();
                        int matchCount = 0;
                        foreach (List<Constant> match in FindMatchingLeftValues(lhss, this.leftAssumeConsts, L)) //parallel matches
                        {
                            matchCount++;
                            //Console.Write("-");
                            Utils.Assert(match.Count == lhss.Count, "parallel Assignment Match gone wrong");

                            //Find the left assignment that created list_tuple
                            AssignCmd leftAssignment = LeftAssignmentByConstant(match);

                            //static filtering
                            if (Options.applyLeftFilter && (this.leftFilterManager.filter(rightAssignment, leftAssignment) == false)) { continue; } //Filter
                            if (Options.applyRightFilter && (this.rightFilterManager.filter(rightAssignment, leftAssignment) == false)) { continue; } //Filter

                            Expr parAssumeExpr = (Expr)Expr.True;
                            for (int i = 0; i < lhss.Count; i++)
                            {
                                if (!varToBoundedVar.ContainsKey(lhss[i]))
                                {
                                    varToBoundedVar[lhss[i]] = new BoundVariable(Token.NoToken, new TypedIdent(Token.NoToken, lhss[i].Name, lhss[i].TypedIdent.Type));
                                }

                                parAssumeExpr = Expr.And(parAssumeExpr,
                                    Expr.Imp(
                                        Expr.Eq(new IdentifierExpr(Token.NoToken, candidate),
                                                new LiteralExpr(Token.NoToken, BigNum.FromInt(matchCount))),
                                        Expr.Eq(new IdentifierExpr(Token.NoToken, lhss[i]),
                                                new IdentifierExpr(Token.NoToken, match[i]))));


                                assignLhssMatched.Add(lhss[i]);
                            }

                            parAssumeExpr.Typecheck(new TypecheckingContext(null, BoogieUtils.BoogieOptions));
                            assignCandAssumes = Expr.And(assignCandAssumes, parAssumeExpr);

                            recordCandidate(rightAssignment, candidate, leftAssignment, lhss, match.ConvertAll<Variable>(c => (Variable)c));
                        }


                        for (int i = 0; i < lhss.Count; i++)
                        {
                            //default option
                            Expr defaultOption =
                                Expr.Imp(
                                    Expr.Eq(new IdentifierExpr(Token.NoToken, candidate),
                                            new LiteralExpr(Token.NoToken, BigNum.FromInt(0))),
                                    Expr.Eq(new IdentifierExpr(Token.NoToken, lhss[i]), rightAssignment.Rhss[i]));

                            assignCandAssumes = Expr.And(assignCandAssumes, defaultOption);
                        }
                        Expr candRange = Expr.And(
                            Expr.Ge(new IdentifierExpr(Token.NoToken, candidate),
                                    new LiteralExpr(Token.NoToken, BigNum.FromInt(0))),
                            Expr.Le(new IdentifierExpr(Token.NoToken, candidate),
                                    new LiteralExpr(Token.NoToken, BigNum.FromInt(matchCount))));

                        program.AddTopLevelDeclaration(candidate);
                        program.AddTopLevelDeclaration(new Axiom(Token.NoToken, candRange));
                        newCmdSeq.Add(new AssumeCmd(Token.NoToken, assignCandAssumes));
                    }
                    else
                    {
                        Utils.Assert(rightAssignment.Lhss.Count == 1, "This should always be 1"); //FIXME: Remove the for loop
                        //single assignments
                        for (int i = 0; i < rightAssignment.Lhss.Count; i++)
                        {
                            Variable lhs = rightAssignment.Lhss[i].DeepAssignedVariable;
                            int matchCount = 0;
                            foreach (Constant match in FindMatchingLeftValues(lhs, this.leftAssumeConsts, L))
                            {
                                matchCount++;
                                AssignCmd leftAssignment = LeftAssignmentByConstant(match);

                                if (Options.applyLeftFilter && (this.leftFilterManager.filter(rightAssignment, leftAssignment) == false)) { continue; } //Filter
                                if (Options.applyRightFilter && (this.rightFilterManager.filter(rightAssignment, leftAssignment) == false)) { continue; } //Filter

                                //for each updated variable, for each left block, for each matching val in left block
                                //Constant candidate = CreateNewBoolCandidateConst(); //cand_n
                                if (!varToBoundedVar.ContainsKey(lhs))
                                {
                                    varToBoundedVar[lhs] = new BoundVariable(Token.NoToken, new TypedIdent(Token.NoToken, lhs.Name, lhs.TypedIdent.Type));
                                }

                                Expr lhsAxiom =
                                    Expr.Imp(
                                        Expr.Eq(new IdentifierExpr(Token.NoToken, candidate),
                                                new LiteralExpr(Token.NoToken, BigNum.FromInt(matchCount))),
                                        Expr.Eq(new IdentifierExpr(Token.NoToken, lhs),
                                                new IdentifierExpr(Token.NoToken, match)));
                                lhsAxiom.Typecheck(new TypecheckingContext(null, BoogieUtils.BoogieOptions));

                                assignCandAssumes = Expr.And(assignCandAssumes, lhsAxiom);
                                assignLhssMatched.Add(lhs);

                                recordCandidate(rightAssignment, candidate, leftAssignment, lhs, match);
                            }

                            //default option
                            Expr defaultOption =
                                Expr.Imp(
                                    Expr.Eq(new IdentifierExpr(Token.NoToken, candidate),
                                            new LiteralExpr(Token.NoToken, BigNum.FromInt(0))),
                                //Expr.Eq(new IdentifierExpr(Token.NoToken, lhs), rightAssignment.Rhss[0]));
                                    Expr.Eq(rightAssignment.Lhss[i].AsExpr, rightAssignment.Rhss[i]));
                            assignCandAssumes = Expr.And(assignCandAssumes, defaultOption);

                            Expr candRange = Expr.And(
                                Expr.Ge(new IdentifierExpr(Token.NoToken, candidate),
                                        new LiteralExpr(Token.NoToken, BigNum.FromInt(0))),
                                Expr.Le(new IdentifierExpr(Token.NoToken, candidate),
                                        new LiteralExpr(Token.NoToken, BigNum.FromInt(matchCount))));

                            program.AddTopLevelDeclaration(candidate);
                            program.AddTopLevelDeclaration(new Axiom(Token.NoToken, candRange));
                            newCmdSeq.Add(new AssumeCmd(Token.NoToken, assignCandAssumes));

                        }
                    }

                    if (assignCandAssumes.Equals((Expr)Expr.True)) { continue; }

                    //FIXME: dictionary doesnt preserve order
                    List<BoundVariable> allBoundVars = varToBoundedVar.Values.Aggregate(new List<BoundVariable>(),
                        (List<BoundVariable> a, BoundVariable b) => a.Concat(new BoundVariable[] { b }).ToList<BoundVariable>());
                    List<Variable> formalArgs = new List<Variable>();
                    foreach (Variable boundVar in allBoundVars)
                    {
                        //Console.Write("/");
                        formalArgs.Add(new Formal(Token.NoToken, new TypedIdent(Token.NoToken, boundVar.Name, boundVar.TypedIdent.Type), true));
                    }
                    Variable formalReturnVar = new Formal(Token.NoToken, new TypedIdent(Token.NoToken, "ret", BasicType.Bool), false); //ret
                    Function P = new Function(Token.NoToken, CreateNewPredicateName(), formalArgs, formalReturnVar);
                    program.AddTopLevelDeclaration(P);

                    List<Expr> actualArgs = new List<Expr>();
                    foreach (Variable lhs in assignLhssMatched)
                    {
                        //Console.Write("\\");
                        actualArgs.Add(new IdentifierExpr(Token.NoToken, lhs));
                    }


                    Expr assumeExpr = new NAryExpr(Token.NoToken, new FunctionCall(P), actualArgs);
                    assumeExpr.Typecheck(new TypecheckingContext(null, BoogieUtils.BoogieOptions));

                    List<Expr> axiomBoundVars = new List<Expr>();
                    foreach (Variable boundVar in allBoundVars)
                    {
                        //Console.Write("@");
                        axiomBoundVars.Add(new IdentifierExpr(Token.NoToken, boundVar));
                    }
                    Expr P_of_x = new NAryExpr(Token.NoToken, new FunctionCall(P), axiomBoundVars);
                    Expr P_of_x_eq_body = Expr.Eq(P_of_x, assignCandAssumes);
                    Expr forall_x_P_of_x_eq_body;
                    if (assignCandAssumes != Expr.True)
                    {
                        forall_x_P_of_x_eq_body = new ForallExpr(Token.NoToken, new List<Variable>(allBoundVars.ToArray()), P_of_x_eq_body);
                    }
                    else
                    {
                        forall_x_P_of_x_eq_body = P_of_x_eq_body;
                    }
                    forall_x_P_of_x_eq_body.Typecheck(new TypecheckingContext(null, BoogieUtils.BoogieOptions));

                    recordAxiom(rightAssignment, forall_x_P_of_x_eq_body);
                }
                return base.VisitCmdSeq(newCmdSeq);
            }

            private void recordAxiom(AssignCmd cmd, Expr axiom)
            {
                this.rightAxioms[cmd] = axiom;
            }

            private void recordConstant(Tuple<Variable, Constant> assumeInfo, AssignCmd cmd)
            {
                if (!this.rightAssumeConsts.ContainsKey(cmd))
                {
                    this.rightAssumeConsts[cmd] = new List<Tuple<Variable, Constant>>();
                }
                this.rightAssumeConsts[cmd].Add(assumeInfo);
            }

            private void recordCandidate(AssignCmd cmd, Constant cn, AssignCmd leftAssign, Variable rightVar, Variable leftVar)
            {
                recordCandidate(cmd, cn, leftAssign, new List<Variable>(new Variable[] { rightVar }), new List<Variable>(new Variable[] { leftVar }));
            }

            private void recordCandidate(AssignCmd cmd, Constant cn, AssignCmd leftAssign, List<Variable> rightVars, List<Variable> leftVars)
            {
                Utils.Assert(leftVars.Count == rightVars.Count, "recordCandidate: sanity test");
                if (!this.rightCandidates.ContainsKey(cmd))
                {
                    this.rightCandidates[cmd] = new List<Tuple<Constant, AssignCmd, Variable, Variable>>();
                }

                for (int i = 0; i < rightVars.Count; i++)
                {
                    this.rightCandidates[cmd].Add(new Tuple<Constant, AssignCmd, Variable, Variable>(cn, leftAssign, rightVars[i], leftVars[i]));
                }
            }

            private List<Constant> FindMatchingLeftValues(Variable lhs, Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> leftAssumeConsts, List<Block> leftBlocks)
            {
                var matches = new List<Constant>();

                Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> leftAssumeConstsSubset = new Dictionary<AssignCmd, List<Tuple<Variable, Constant>>>();
                foreach (AssignCmd leftAssignment in leftAssumeConsts.Keys)
                {
                    Block leftBlock = cmdToBlock[leftAssignment];
                    if (leftBlocks.Contains(leftBlock)) { leftAssumeConstsSubset[leftAssignment] = leftAssumeConsts[leftAssignment]; }
                }

                //flatten the leftAssumeConsts dictionary to a List<Constant>, a monadic join
                List<Tuple<Variable, Constant>> leftConsts =
                    leftAssumeConstsSubset.Values.Aggregate(new List<Tuple<Variable, Constant>>(),
                    (List<Tuple<Variable, Constant>> a1, List<Tuple<Variable, Constant>> a2) => a1.Concat(a2).ToList());

                //This is where all the magic will happen of which subset of variables to get from the left handside
                foreach (Tuple<Variable, Constant> leftConst in leftConsts)
                {
                    Constant kv = leftConst.Item2;
                    if (lhs.TypedIdent.Type.ToString() != kv.TypedIdent.Type.ToString()) continue;
                    //use other heuristics such as fuzzy matching of names
                    if (!FuzzyMatchOfNames(lhs.Name, kv.Name)) continue;
                    //use heuristics based on the line numbers (don't compare variables 100 lines apart on two sides)
                    matches.Add(kv);
                }
                return matches;
            }

            //for parallel assignments
            private List<List<Constant>> FindMatchingLeftValues(List<Variable> lhss, Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> leftAssumeConsts, List<Block> leftBlocks)
            {
                var matches = new List<List<Constant>>();

                foreach (AssignCmd leftAssignment in leftAssumeConsts.Keys.Where(la => leftAssumeConsts[la].Count == lhss.Count))
                {
                    Block leftBlock = cmdToBlock[leftAssignment];
                    if (!leftBlocks.Contains(leftBlock)) { continue; }

                    List<Tuple<Variable, Constant>> list_tuple = leftAssumeConsts[leftAssignment];
                    bool matchingTypes = true;
                    for (int i = 0; i < lhss.Count; i++)
                    {
                        if (lhss[i].TypedIdent.Type.ToString() != list_tuple[i].Item1.TypedIdent.Type.ToString()) { matchingTypes = false; }
                        if (!FuzzyMatchOfNames(lhss[i].Name, list_tuple[i].Item1.Name)) { matchingTypes = false; }
                    }
                    if (matchingTypes)
                    {
                        List<Constant> match = new List<Constant>();
                        list_tuple.ForEach(tuple => match.Add(tuple.Item2));
                        matches.Add(match);
                    }
                }

                return matches;
            }

            private AssignCmd LeftAssignmentByConstant(Constant c)
            {
                foreach (AssignCmd la in this.leftAssumeConsts.Keys)
                {
                    foreach (Tuple<Variable, Constant> la_vc in this.leftAssumeConsts[la])
                    {
                        if (la_vc.Item2 == c) { return la; }
                    }
                }
                return null;
            }

            private AssignCmd LeftAssignmentByConstant(List<Constant> c)
            {
                foreach (AssignCmd la in this.leftAssumeConsts.Keys)
                {
                    if (this.leftAssumeConsts[la].Count != c.Count) { continue; }

                    bool foundleftAssignment = true;
                    for (int i = 0; i < c.Count; i++)
                    {
                        if (this.leftAssumeConsts[la][i].Item2 != c[i]) { foundleftAssignment = false; }
                    }
                    if (foundleftAssignment) { return la; }
                }
                return null;
            }

            private bool FuzzyMatchOfNames(string p1, string p2)
            {
                //compare the string between ($,__line__)
                return true;
            }
        }

        class RightAxiomInjector : StandardVisitor
        {
            //requires
            private Implementation implementation;
            private Program program;
            private List<Block> L;
            private List<Block> R;
            private Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> leftAssumeConsts;
            private Dictionary<Tuple<AssignCmd, Variable>, HashSet<Variable>> dependencies;

            //modifies
            //Dictionary<Block(Right program), List<Tuple<Constant(Candidate, Block(Left program), Variable (right), Variable(left)>>>
            private Dictionary<AssignCmd, List<Tuple<Constant, AssignCmd, Variable, Variable>>> rightCandidates;
            private Dictionary<AssignCmd, Expr> rightAxioms;
            private Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> rightAssumeConsts;

            //internal
            private Dictionary<List<Cmd>, Block> CmdsToBlock;
            private FilterManager leftFilterManager;
            private FilterManager rightFilterManager;

            public RightAxiomInjector(Program program, Implementation implementation)
            {
                this.implementation = implementation;
                this.program = program;
            }

            public void injectAxioms(List<Block> L, List<Block> R,
                Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> leftAssumeConsts,
                Dictionary<AssignCmd, List<Tuple<Constant, AssignCmd, Variable, Variable>>> rightCandidates,
                Dictionary<AssignCmd, Expr> rightAxioms,
                Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> rightAssumeConsts,
                Dictionary<Tuple<AssignCmd, Variable>, HashSet<Variable>> dependencies)
            {
                this.rightCandidates = rightCandidates;
                this.rightAxioms = rightAxioms;
                this.rightAssumeConsts = rightAssumeConsts;
                this.leftAssumeConsts = leftAssumeConsts;
                this.dependencies = dependencies;
                this.L = L;
                this.R = R;

                this.CmdsToBlock = computeCmdseqToBlockMapping(L.Concat(R).ToList<Block>());
                this.leftFilterManager = new FilterManager(dependencies, FilterManager.Side.LeftProgram);
                this.rightFilterManager = new FilterManager(dependencies, FilterManager.Side.RightProgram);

                this.Visit(implementation);
            }

            private Constant CreateNewBoolCandidateConst()
            {
                var a = new Constant(Token.NoToken, new TypedIdent(Token.NoToken, "_cand_" +
                    deepCount<AssignCmd, Tuple<Constant, AssignCmd, Variable, Variable>>(this.rightCandidates), BType.Bool), false);
                program.AddTopLevelDeclaration(a);
                return a;
            }

            private string CreateNewPredicateName()
            {
                //FIXME: Make sure rootcause_P does not appear as another var/const in the program
                //int uniqueId = deepCount<Block, Tuple<Constant, Block, Variable, Variable>>(this.rightCandidates);
                int uniqueId = this.rightAxioms.Count;
                return "rootcause_P" + "_" + uniqueId;
            }

            public override List<Cmd> VisitCmdSeq(List<Cmd> cmdSeq)
            {
                List<Cmd> newCmdSeq = new List<Cmd>();

                Utils.CheckRootcauseTimeout(sw);
                List<List<Cmd>> commandsInR = R.ConvertAll<List<Cmd>>(b => b.Cmds);
                if (!commandsInR.Contains(cmdSeq)) { return base.VisitCmdSeq(cmdSeq); }

                Block cmdSeqBlock = CmdsToBlock[cmdSeq];

                //capture variables for the general candidates
                if (Options.verbose == 2) Console.Write("\n[RightAxiomInjector] :: Size of CmdSeq = {0}", cmdSeq.Count);
                foreach (Cmd cmd in cmdSeq)
                {
                    Utils.CheckRootcauseTimeout(sw);
                    if (Options.verbose == 2) Console.Write(".");
                    newCmdSeq.Add(cmd);
                    var rightAssignment = cmd as AssignCmd;
                    if (rightAssignment == null) continue;

                    Utils.Assert(rightAssignment.Lhss.Count() == rightAssignment.Rhss.Count(), "#lhs != #rhs");

                    Expr rightAssumeExpr = (Expr)Expr.True;
                    for (int i = 0; i < rightAssignment.Lhss.Count; i++)
                    {
                        Variable lhs = rightAssignment.Lhss[i].DeepAssignedVariable;
                        Constant cn = new Constant(Token.NoToken,
                            new TypedIdent(Token.NoToken, "right_" + lhs.Name + "__line__" + lhs.Line + "_" +
                                deepCount<AssignCmd, Tuple<Variable, Constant>>(this.rightAssumeConsts), lhs.TypedIdent.Type), false);
                        this.program.AddTopLevelDeclaration(cn);
                        recordConstant(new Tuple<Variable, Constant>(lhs, cn), rightAssignment);
                        rightAssumeExpr = Expr.And(rightAssumeExpr, Expr.Eq(new IdentifierExpr(Token.NoToken, lhs), new IdentifierExpr(Token.NoToken, cn)));
                    }
                    //add 1 assume for all variables updated by this assignment
                    if (!rightAssumeExpr.Equals((Expr)Expr.True)) { newCmdSeq.Add(new AssumeCmd(Token.NoToken, rightAssumeExpr)); }

                    //don't club the assumes together as a subset can be removed
                    Expr assignCandAssumes = Expr.True;
                    Dictionary<Variable, BoundVariable> varToBoundedVar = new Dictionary<Variable, BoundVariable>();
                    var assignLhssMatched = new HashSet<Variable>();

                    //parallel Assignments
                    if (rightAssignment.Lhss.Count > 1)
                    {
                        List<Variable> lhss = rightAssignment.Lhss.Select(l => l.DeepAssignedVariable).ToList();
                        foreach (List<Constant> match in FindMatchingLeftValues(lhss, this.leftAssumeConsts, L)) //parallel matches
                        {
                            //Console.Write("-");
                            Utils.Assert(match.Count == lhss.Count, "parallel Assignment Match gone wrong");

                            //Find the left assignment that created list_tuple
                            AssignCmd leftAssignment = LeftAssignmentByConstant(match);

                            //static filtering
                            if (Options.applyLeftFilter && (this.leftFilterManager.filter(rightAssignment, leftAssignment) == false)) { continue; } //Filter
                            if (Options.applyRightFilter && (this.rightFilterManager.filter(rightAssignment, leftAssignment) == false)) { continue; } //Filter

                            Constant candidate = CreateNewBoolCandidateConst();

                            Expr parAssumeExpr = (Expr)Expr.True;
                            for (int i = 0; i < lhss.Count; i++)
                            {
                                if (!varToBoundedVar.ContainsKey(lhss[i]))
                                {
                                    varToBoundedVar[lhss[i]] = new BoundVariable(Token.NoToken, new TypedIdent(Token.NoToken, lhss[i].Name, lhss[i].TypedIdent.Type));
                                }
                                BoundVariable bound_lhs = varToBoundedVar[lhss[i]];

                                parAssumeExpr = Expr.And(parAssumeExpr,
                                    Expr.Imp(new IdentifierExpr(Token.NoToken, candidate),
                                    Expr.Eq(new IdentifierExpr(Token.NoToken, bound_lhs), new IdentifierExpr(Token.NoToken, match[i]))));

                                assignLhssMatched.Add(lhss[i]);
                            }
                            parAssumeExpr.Typecheck(new TypecheckingContext(null, BoogieUtils.BoogieOptions));
                            assignCandAssumes = Expr.And(assignCandAssumes, parAssumeExpr);

                            recordCandidate(rightAssignment, candidate, leftAssignment, lhss, match.ConvertAll<Variable>(c => (Variable)c));
                        }
                    }
                    else
                    {
                        //single assignments
                        for (int i = 0; i < rightAssignment.Lhss.Count; i++)
                        {
                            Variable lhs = rightAssignment.Lhss[i].DeepAssignedVariable;
                            foreach (Constant match in FindMatchingLeftValues(lhs, this.leftAssumeConsts, L))
                            {
                                AssignCmd leftAssignment = LeftAssignmentByConstant(match);

                                if (Options.applyLeftFilter && (this.leftFilterManager.filter(rightAssignment, leftAssignment) == false)) { continue; } //Filter
                                if (Options.applyRightFilter && (this.rightFilterManager.filter(rightAssignment, leftAssignment) == false)) { continue; } //Filter

                                //for each updated variable, for each left block, for each matching val in left block
                                Constant candidate = CreateNewBoolCandidateConst(); //cand_n

                                if (!varToBoundedVar.ContainsKey(lhs))
                                {
                                    varToBoundedVar[lhs] = new BoundVariable(Token.NoToken, new TypedIdent(Token.NoToken, lhs.Name, lhs.TypedIdent.Type));
                                }
                                BoundVariable bound_lhs = varToBoundedVar[lhs];

                                Expr lhsAxiom =
                                    Expr.Imp(new IdentifierExpr(Token.NoToken, candidate),
                                    Expr.Eq(new IdentifierExpr(Token.NoToken, bound_lhs), new IdentifierExpr(Token.NoToken, match)));
                                lhsAxiom.Typecheck(new TypecheckingContext(null, BoogieUtils.BoogieOptions));

                                assignCandAssumes = Expr.And(assignCandAssumes, lhsAxiom);
                                assignLhssMatched.Add(lhs);

                                recordCandidate(rightAssignment, candidate, leftAssignment, lhs, match);
                            }
                        }
                    }

                    if (assignCandAssumes.Equals((Expr)Expr.True)) { continue; }

                    //FIXME: dictionary doesnt preserve order
                    List<BoundVariable> allBoundVars = varToBoundedVar.Values.Aggregate(new List<BoundVariable>(),
                        (List<BoundVariable> a, BoundVariable b) => a.Concat(new BoundVariable[] { b }).ToList<BoundVariable>());
                    List<Variable> formalArgs = new List<Variable>();
                    foreach (Variable boundVar in allBoundVars)
                    {
                        //Console.Write("/");
                        formalArgs.Add(new Formal(Token.NoToken, new TypedIdent(Token.NoToken, boundVar.Name, boundVar.TypedIdent.Type), true));
                    }
                    Variable formalReturnVar = new Formal(Token.NoToken, new TypedIdent(Token.NoToken, "ret", BasicType.Bool), false); //ret
                    Function P = new Function(Token.NoToken, CreateNewPredicateName(), formalArgs, formalReturnVar);
                    program.AddTopLevelDeclaration(P);

                    List<Expr> actualArgs = new List<Expr>();
                    foreach (Variable lhs in assignLhssMatched)
                    {
                        //Console.Write("\\");
                        actualArgs.Add(new IdentifierExpr(Token.NoToken, lhs));
                    }


                    Expr assumeExpr = new NAryExpr(Token.NoToken, new FunctionCall(P), actualArgs);
                    assumeExpr.Typecheck(new TypecheckingContext(null, BoogieUtils.BoogieOptions));
                    newCmdSeq.Add(new AssumeCmd(Token.NoToken, assumeExpr));

                    List<Expr> axiomBoundVars = new List<Expr>();
                    foreach (Variable boundVar in allBoundVars)
                    {
                        //Console.Write("@");
                        axiomBoundVars.Add(new IdentifierExpr(Token.NoToken, boundVar));
                    }
                    Expr P_of_x = new NAryExpr(Token.NoToken, new FunctionCall(P), axiomBoundVars);
                    Expr P_of_x_eq_body = Expr.Eq(P_of_x, assignCandAssumes);
                    Expr forall_x_P_of_x_eq_body;
                    if (assignCandAssumes != Expr.True)
                    {
                        forall_x_P_of_x_eq_body = new ForallExpr(Token.NoToken, new List<Variable>(allBoundVars.ToArray()), P_of_x_eq_body);
                    }
                    else
                    {
                        forall_x_P_of_x_eq_body = P_of_x_eq_body;
                    }
                    forall_x_P_of_x_eq_body.Typecheck(new TypecheckingContext(null, BoogieUtils.BoogieOptions));

                    recordAxiom(rightAssignment, forall_x_P_of_x_eq_body);
                }
                return base.VisitCmdSeq(newCmdSeq);
            }

            private void recordAxiom(AssignCmd cmd, Expr axiom)
            {
                this.rightAxioms[cmd] = axiom;
            }

            private void recordConstant(Tuple<Variable, Constant> assumeInfo, AssignCmd cmd)
            {
                if (!this.rightAssumeConsts.ContainsKey(cmd))
                {
                    this.rightAssumeConsts[cmd] = new List<Tuple<Variable, Constant>>();
                }
                this.rightAssumeConsts[cmd].Add(assumeInfo);
            }

            private void recordCandidate(AssignCmd cmd, Constant cn, AssignCmd leftAssign, Variable rightVar, Variable leftVar)
            {
                recordCandidate(cmd, cn, leftAssign, new List<Variable>(new Variable[] { rightVar }), new List<Variable>(new Variable[] { leftVar }));
            }

            private void recordCandidate(AssignCmd cmd, Constant cn, AssignCmd leftAssign, List<Variable> rightVars, List<Variable> leftVars)
            {
                Utils.Assert(leftVars.Count == rightVars.Count, "recordCandidate: sanity test");
                if (!this.rightCandidates.ContainsKey(cmd))
                {
                    this.rightCandidates[cmd] = new List<Tuple<Constant, AssignCmd, Variable, Variable>>();
                }

                for (int i = 0; i < rightVars.Count; i++)
                {
                    this.rightCandidates[cmd].Add(new Tuple<Constant, AssignCmd, Variable, Variable>(cn, leftAssign, rightVars[i], leftVars[i]));
                }
            }

            private List<Constant> FindMatchingLeftValues(Variable lhs, Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> leftAssumeConsts, List<Block> leftBlocks)
            {
                var matches = new List<Constant>();

                Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> leftAssumeConstsSubset = new Dictionary<AssignCmd, List<Tuple<Variable, Constant>>>();
                foreach (AssignCmd leftAssignment in leftAssumeConsts.Keys)
                {
                    Block leftBlock = cmdToBlock[leftAssignment];
                    if (leftBlocks.Contains(leftBlock)) { leftAssumeConstsSubset[leftAssignment] = leftAssumeConsts[leftAssignment]; }
                }

                //flatten the leftAssumeConsts dictionary to a List<Constant>, a monadic join
                List<Tuple<Variable, Constant>> leftConsts =
                    leftAssumeConstsSubset.Values.Aggregate(new List<Tuple<Variable, Constant>>(),
                    (List<Tuple<Variable, Constant>> a1, List<Tuple<Variable, Constant>> a2) => a1.Concat(a2).ToList());

                //This is where all the magic will happen of which subset of variables to get from the left handside
                foreach (Tuple<Variable, Constant> leftConst in leftConsts)
                {
                    Constant kv = leftConst.Item2;
                    if (lhs.TypedIdent.Type.ToString() != kv.TypedIdent.Type.ToString()) continue;
                    //use other heuristics such as fuzzy matching of names
                    if (!FuzzyMatchOfNames(lhs.Name, kv.Name)) continue;
                    //use heuristics based on the line numbers (don't compare variables 100 lines apart on two sides)
                    matches.Add(kv);
                }
                return matches;
            }

            //for parallel assignments
            private List<List<Constant>> FindMatchingLeftValues(List<Variable> lhss, Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> leftAssumeConsts, List<Block> leftBlocks)
            {
                var matches = new List<List<Constant>>();

                foreach (AssignCmd leftAssignment in leftAssumeConsts.Keys.Where(la => leftAssumeConsts[la].Count == lhss.Count))
                {
                    Block leftBlock = cmdToBlock[leftAssignment];
                    if (!leftBlocks.Contains(leftBlock)) { continue; }

                    List<Tuple<Variable, Constant>> list_tuple = leftAssumeConsts[leftAssignment];
                    bool matchingTypes = true;
                    for (int i = 0; i < lhss.Count; i++)
                    {
                        if (lhss[i].TypedIdent.Type.ToString() != list_tuple[i].Item1.TypedIdent.Type.ToString()) { matchingTypes = false; }
                        if (!FuzzyMatchOfNames(lhss[i].Name, list_tuple[i].Item1.Name)) { matchingTypes = false; }
                    }
                    if (matchingTypes)
                    {
                        List<Constant> match = new List<Constant>();
                        list_tuple.ForEach(tuple => match.Add(tuple.Item2));
                        matches.Add(match);
                    }
                }

                return matches;
            }

            private AssignCmd LeftAssignmentByConstant(Constant c)
            {
                foreach (AssignCmd la in this.leftAssumeConsts.Keys)
                {
                    foreach (Tuple<Variable, Constant> la_vc in this.leftAssumeConsts[la])
                    {
                        if (la_vc.Item2 == c) { return la; }
                    }
                }
                return null;
            }

            private AssignCmd LeftAssignmentByConstant(List<Constant> c)
            {
                foreach (AssignCmd la in this.leftAssumeConsts.Keys)
                {
                    if (this.leftAssumeConsts[la].Count != c.Count) { continue; }

                    bool foundleftAssignment = true;
                    for (int i = 0; i < c.Count; i++)
                    {
                        if (this.leftAssumeConsts[la][i].Item2 != c[i]) { foundleftAssignment = false; }
                    }
                    if (foundleftAssignment) { return la; }
                }
                return null;
            }

            private bool FuzzyMatchOfNames(string p1, string p2)
            {
                //compare the string between ($,__line__)
                return true;
            }
        }
        #region Guarding blocks
        //add assume b_c at the end of every block (ideally should have put it at the head)
        class GuardBlocks : StandardVisitor
        {
            private Implementation implementation;
            private Program program;
            private List<Block> L, R;
            Dictionary<Block, Constant> leftAssumeFalseConsts;
            Dictionary<Block, Constant> rightAssumeFalseConsts;

            public GuardBlocks(Program p, Implementation i, List<Block> LB, List<Block> RB)
            {
                program = p; implementation = i; L = LB; R = RB;
                leftAssumeFalseConsts = new Dictionary<Block, Constant>();
                rightAssumeFalseConsts = new Dictionary<Block, Constant>();
            }
            public Tuple<Dictionary<Block, Constant>, Dictionary<Block, Constant>> GetAssumeFalseConsts()
            {
                return new Tuple<Dictionary<Block, Constant>, Dictionary<Block, Constant>>(leftAssumeFalseConsts, rightAssumeFalseConsts);
            }
            public override Block VisitBlock(Block node)
            {
                //only instrument blocks in L
                //if (!L.Contains(node)) return base.VisitBlock(node);
                Constant c = null;
                if (L.Contains(node))
                {
                    c = new Constant(Token.NoToken, new TypedIdent(Token.NoToken,
                        "_lguard_cond" + leftAssumeFalseConsts.Count, BType.Bool), false);
                    leftAssumeFalseConsts[node] = c;
                }
                else if (R.Contains(node))
                {
                    c = new Constant(Token.NoToken, new TypedIdent(Token.NoToken,
                        "_rguard_cond" + rightAssumeFalseConsts.Count, BType.Bool), false);
                    rightAssumeFalseConsts[node] = c;
                }
                else
                {
                    return base.VisitBlock(node);
                }
                program.AddTopLevelDeclaration(c);
                node.Cmds.Add(new AssumeCmd(Token.NoToken, IdentifierExpr.Ident(c))); //put the assume at the end of the block
                return base.VisitBlock(node);
            }
        }
        #endregion

        class Preprocessor : StandardVisitor
        {
            //requires
            private Implementation implementation;
            private Program program;
            private List<Block> L;
            private List<Block> R;

            private Dictionary<AssignCmd, BigNum> CmdToSourceline;
            private List<AssignCmd> recentCommands;
            private Tuple<string, BigNum> previousSourceLoc = null;

            public Preprocessor(Program program, Implementation implementation)
            {
                this.implementation = implementation;
                this.program = program;
            }

            public Dictionary<AssignCmd, BigNum> preprocess(List<Block> L, List<Block> R)
            {
                this.L = L;
                this.R = R;

                CmdToSourceline = new Dictionary<AssignCmd, BigNum>();
                recentCommands = new List<AssignCmd>();

                this.Visit(implementation);
                return CmdToSourceline;
            }

            public override List<Cmd> VisitCmdSeq(List<Cmd> cmdSeq)
            {
                //List<CmdSeq> commandsInR = R.ConvertAll<CmdSeq>(b => b.Cmds);
                //if (!commandsInR.Contains(cmdSeq)) { return base.VisitCmdSeq(cmdSeq); }

                //DISCREPENCY between HAVOC generated bpl vs. X86Boogie generated bpl
                //For C, the sourceline precedes all statements in the line
                //For x86, the sourceline follows all statements in the line
                foreach (Cmd cmd in cmdSeq)
                {
                    if (cmd is AssertCmd)
                    {
                        Tuple<string, BigNum> sourceLoc = Utils.ReadSourceAssert(cmd as AssertCmd);
                        if (sourceLoc != null)
                        {
                            previousSourceLoc = sourceLoc;
                            recentCommands.ForEach(c => CmdToSourceline[c] = sourceLoc.Item2);
                            recentCommands.Clear();
                        }
                    }
                    else if (cmd is AssignCmd)
                    {
                        recentCommands.Add(cmd as AssignCmd);
                    }
                }
                //works for havoc examples only when there is one assert sourceline per cmdseq
                if (recentCommands.Count() != 0 && previousSourceLoc != null) //happens if the assert sourceline happens before the stmts
                {
                    recentCommands.ForEach(c => CmdToSourceline[c] = previousSourceLoc.Item2);
                    recentCommands.Clear();
                }

                return base.VisitCmdSeq(cmdSeq);
            }
        }

        class AssertGuarder : StandardVisitor
        {
            //requires
            private Implementation implementation;
            private Program program;
            private List<Block> L;
            private List<Block> R;

            public AssertGuarder(Program program, Implementation implementation)
            {
                this.implementation = implementation;
                this.program = program;
            }

            public void guardAssert(List<Block> L, List<Block> R)
            {
                this.L = L;
                this.R = R;
                this.Visit(implementation);
            }

            private Expr RewriteAssertCmd(Expr expr)
            {
                phi_guard = new Constant(Token.NoToken, new TypedIdent(Token.NoToken, "rootcause_phi_guard", BType.Bool), false);
                neg_phi_guard = new Constant(Token.NoToken, new TypedIdent(Token.NoToken, "rootcause_neg_phi_guard", BType.Bool), false);
                var tmp = expr;
                this.program.AddTopLevelDeclaration(phi_guard);
                this.program.AddTopLevelDeclaration(neg_phi_guard);
                // only transform the assertion A with _bassert_ => A if the assertion has not already been transformed
                var freeVars = new GSet<Object>();
                expr.ComputeFreeVariables(freeVars);
                var inter = freeVars.Intersect(new List<Constant>(new Constant[] { phi_guard, neg_phi_guard }));
                if (inter.ToList().Count == 0)
                { //avoid making guarded asserts guarded again
                    //assert(phi_guard => \phi and neg_phi_guard => \neg \phi)
                    tmp = Expr.And(Expr.Imp(IdentifierExpr.Ident(phi_guard), expr),
                                    Expr.Imp(IdentifierExpr.Ident(neg_phi_guard), Expr.Not(expr)));
                }
                return tmp;
            }
            public override Cmd VisitAssertCmd(AssertCmd node)
            {
                if (Utils.ReadSourceAssert(node) != null) { return node; }
                if (exprContains(node.Expr, "rootcause_ph_guard")) { return node; }
                if (node.Expr is LiteralExpr && (node.Expr as LiteralExpr).Val.Equals(true)) return node;
                if (phi_guard == null && neg_phi_guard == null)
                {
                    node.Expr = RewriteAssertCmd(node.Expr);
                }
                else
                {
                    Utils.Assert(false, "Found multiple assert statements. Exiting...");
                }

                return base.VisitAssertCmd(node);
            }
        }

        private class AssertFalseInjector : StandardVisitor
        {
            //requires
            private Implementation implementation;
            private Program program;
            private List<Block> L;
            private List<Block> R;

            //modifies
            private Dictionary<Block, Constant> assertConsts;

            //internal
            private Dictionary<List<Cmd>, Block> CmdsToBlock;

            public AssertFalseInjector(Program program, Implementation implementation)
            {
                this.implementation = implementation;
                this.program = program;
            }

            public void injectFalseAsserts(List<Block> L, List<Block> R, Dictionary<Block, Constant> assertConsts)
            {
                this.L = L;
                this.R = R;
                this.assertConsts = assertConsts;

                this.CmdsToBlock = computeCmdseqToBlockMapping(L.Concat(R).ToList<Block>());

                this.Visit(implementation);
            }

            public override List<Cmd> VisitCmdSeq(List<Cmd> cmdSeq)
            {
                List<Cmd> newCmdSeq = new List<Cmd>();
                var blockLhss = new HashSet<Variable>();

                List<List<Cmd>> commandsInR = R.ConvertAll<List<Cmd>>(b => b.Cmds);

                //Don't modify the left program
                if (!commandsInR.Contains(cmdSeq)) { return base.VisitCmdSeq(cmdSeq); }

                foreach (Cmd c in cmdSeq) { newCmdSeq.Add(c); }

                var bassert_k = new Constant(Token.NoToken, new TypedIdent(Token.NoToken, "_bassert_" + (assertConsts.Count + 1), BType.Bool), false);
                this.assertConsts[this.CmdsToBlock[cmdSeq]] = bassert_k;
                this.program.AddTopLevelDeclaration(bassert_k);
                Expr newAssertExpr = Expr.Imp(IdentifierExpr.Ident(bassert_k), Expr.False);
                AssertCmd newAssert = new AssertCmd(Token.NoToken, newAssertExpr);

                newCmdSeq.Add(newAssert);
                return base.VisitCmdSeq(newCmdSeq);
            }
        }

        #endregion


        private static Dictionary<List<Cmd>, Block> computeCmdseqToBlockMapping(List<Block> blocks)
        {
            Dictionary<List<Cmd>, Block> cmdseqToBlock = new Dictionary<List<Cmd>, Block>();
            foreach (Block block in blocks) { cmdseqToBlock[block.Cmds] = block; }
            return cmdseqToBlock;
        }

        private static Dictionary<Cmd, Block> computeCmdToBlockMapping(List<Block> blocks)
        {
            cmdToBlock = new Dictionary<Cmd, Block>();
            foreach (Block block in blocks)
            {
                foreach (Cmd cmd in block.Cmds)
                {
                    cmdToBlock[cmd] = block;
                }
            }
            return cmdToBlock;
        }

        private static Dictionary<Block, List<Cmd>> computeBlockToCmdSeqMapping(List<Block> blocks)
        {
            blockToCmdSeq = new Dictionary<Block, List<Cmd>>();
            foreach (Block block in blocks) { blockToCmdSeq[block] = block.Cmds; }
            return blockToCmdSeq;
        }

        private static Dictionary<Block, Tuple<List<Block>, List<Block>>> computeBlockCDFG(Implementation implementation)
        {
            //pred,succ
            Dictionary<Block, Tuple<List<Block>, List<Block>>> CDFG = new Dictionary<Block, Tuple<List<Block>, List<Block>>>();

            //create empty lists for all blocks
            foreach (Block b in implementation.Blocks)
            {
                CDFG[b] = new Tuple<List<Block>, List<Block>>(new List<Block>(), new List<Block>());
            }

            foreach (Block current in implementation.Blocks)
            {

                GotoCmd gotoCmd = (current.TransferCmd as GotoCmd); if (gotoCmd == null) continue;
                List<Block> successors = gotoCmd.LabelTargets;
                foreach (Block successor in successors)
                {
                    CDFG[current].Item2.Add(successor);
                    CDFG[successor].Item1.Add(current);
                }
            }
            return CDFG;
        }

        /// <summary>
        /// Computes a DAG over the assignments where the order is program order
        /// Used for dependency analysis
        /// Used for pruning assignments when assert is moved earlier
        /// </summary>
        /// <param name="implementation"></param>
        /// <returns></returns>
        private static Dictionary<AssignCmd, Tuple<List<AssignCmd>, List<AssignCmd>>> computeAssignmentCDFG(Implementation implementation)
        {
            //pred,succ of each assign
            Dictionary<AssignCmd, Tuple<List<AssignCmd>, List<AssignCmd>>> CDFG = new Dictionary<AssignCmd, Tuple<List<AssignCmd>, List<AssignCmd>>>();

            //Blocks without an assignment are given 1 dummy assignCmd
            Dictionary<Block, AssignCmd> dummyAssigns = new Dictionary<Block, AssignCmd>();
            Dictionary<Block, AssignCmd> firstAssign = new Dictionary<Block, AssignCmd>();
            Dictionary<Block, AssignCmd> lastAssign = new Dictionary<Block, AssignCmd>();

            //create empty lists for all blocks
            foreach (Block b in implementation.Blocks)
            {
                bool b_contains_assign = false;
                foreach (Cmd b_cmd in b.Cmds) //FIXME: Does foreach preserve order of b_Cmds
                {
                    AssignCmd b_assign_cmd = b_cmd as AssignCmd; if (b_assign_cmd == null) continue;
                    CDFG[b_assign_cmd] = new Tuple<List<AssignCmd>, List<AssignCmd>>(new List<AssignCmd>(), new List<AssignCmd>());
                    if (!b_contains_assign) { firstAssign[b] = b_assign_cmd; }
                    lastAssign[b] = b_assign_cmd;
                    b_contains_assign = true;
                }

                if (!b_contains_assign)
                {
                    SimpleAssignLhs dummyLhs = new SimpleAssignLhs(Token.NoToken,
                        new IdentifierExpr(Token.NoToken, "rootcause_dummyassign_" + dummyAssigns.Count, BasicType.Bool));
                    Expr dummyRhs = dummyLhs.AsExpr;
                    dummyAssigns[b] = new AssignCmd(Token.NoToken,
                        new List<AssignLhs>(new AssignLhs[] { dummyLhs }),
                        new List<Expr>(new Expr[] { dummyRhs }));
                    CDFG[dummyAssigns[b]] = new Tuple<List<AssignCmd>, List<AssignCmd>>(new List<AssignCmd>(), new List<AssignCmd>());
                    firstAssign[b] = dummyAssigns[b];
                    lastAssign[b] = dummyAssigns[b];
                }
            }

            //connect the nodes
            foreach (Block b in implementation.Blocks)
            {
                List<AssignCmd> b_assignCmds = new List<AssignCmd>();
                foreach (Cmd b_cmd in b.Cmds)
                {
                    if (b_cmd is AssignCmd) { b_assignCmds.Add(b_cmd as AssignCmd); }
                }

                //connect all the b_assignCmds
                for (int i = 0; i < b_assignCmds.Count - 1; i++)
                {
                    AssignCmd src = b_assignCmds[i]; AssignCmd dst = b_assignCmds[i + 1];
                    CDFG[src].Item2.Add(dst);
                    CDFG[dst].Item1.Add(src);
                }

                //connect lastNode to successors blocks
                AssignCmd lastNode = lastAssign[b];

                GotoCmd gotoCmd = (b.TransferCmd as GotoCmd); if (gotoCmd == null) continue;
                List<Block> successorBlocks = gotoCmd.LabelTargets;
                foreach (Block successorBlock in successorBlocks)
                {
                    //find firstNode of successorBlock
                    AssignCmd firstNode = firstAssign[successorBlock];

                    CDFG[lastNode].Item2.Add(firstNode);
                    CDFG[firstNode].Item1.Add(lastNode);
                }
            }
            return CDFG;
        }

        private static bool exprContains(Expr e, string name)
        {
            if (e is NAryExpr)
            {
                foreach (Expr e_sub in (e as NAryExpr).Args)
                {
                    if (exprContains(e_sub, name)) { return true; }
                }
                return false;
            }
            else if (e is IdentifierExpr)
            {
                return ((e as IdentifierExpr).Name.Contains(name));
            }
            return false;
        }

        private static List<Variable> getVariableBeingEquated(Constant cand,
            Dictionary<AssignCmd, List<Tuple<Constant, AssignCmd, Variable, Variable>>> rightCandidates)
        {
            foreach (AssignCmd key in rightCandidates.Keys)
            {
                List<Tuple<Constant, AssignCmd, Variable, Variable>> listOfTuples = rightCandidates[key];
                foreach (Tuple<Constant, AssignCmd, Variable, Variable> tuple in listOfTuples)
                {
                    if (tuple.Item1 == cand)
                    {
                        return new List<Variable>(new Variable[] { tuple.Item3 });
                    }
                }
            }
            //TODO: parallel assumes
            Utils.Assert(false, "getVariableBeingEquated: candidate not found");
            return null;
        }

        private static AssignCmd getAssignmentForCandidate(Constant cand,
            Dictionary<AssignCmd, List<Tuple<Constant, AssignCmd, Variable, Variable>>> rightCandidates)
        {
            foreach (AssignCmd key in rightCandidates.Keys)
            {
                List<Tuple<Constant, AssignCmd, Variable, Variable>> listOfTuples = rightCandidates[key];
                foreach (Tuple<Constant, AssignCmd, Variable, Variable> tuple in listOfTuples)
                {
                    if (tuple.Item1 == cand)
                    {
                        return key;
                    }
                }
            }
            //TODO: parallel assumes
            Utils.Assert(false, "getAssignmentForCandidate: candidate not found");
            return null;
        }

        private static bool earlierAssignmentByLineNumber(AssignCmd a1, AssignCmd a2)
        {
            return CmdToSourceline[a1] <= CmdToSourceline[a2];
        }

        //FIXME what if sourceline is not present?
        //does a1 appear before a2?
        private static bool earlierAssignment(AssignCmd a1, AssignCmd a2)
        {
            //return CmdToSourceline[a1] <= CmdToSourceline[a2];
            AssignCmd sourceNode = null;

            Dictionary<AssignCmd, bool> visitedFlag = new Dictionary<AssignCmd, bool>();
            Dictionary<AssignCmd, int> visitedLevel = new Dictionary<AssignCmd, int>();

            foreach (AssignCmd node in cdfg.Keys)
            {
                visitedFlag[node] = false;
                if (cdfg[node].Item1.Count == 0) { sourceNode = node; }
            }
            //which gets visited first in a BFS?

            List<AssignCmd> workQueue = new List<AssignCmd>();
            workQueue.Add(sourceNode);
            visitedFlag[sourceNode] = true; visitedLevel[sourceNode] = 0;

            while (workQueue.Count > 0)
            {
                AssignCmd work_node = workQueue[0];
                workQueue.Remove(work_node);
                foreach (AssignCmd succ in cdfg[work_node].Item2)
                {
                    if (visitedFlag[succ] == false)
                    {
                        visitedFlag[succ] = true; visitedLevel[succ] = visitedLevel[work_node] + 1;
                        workQueue.Add(succ);
                    }
                }
            }
            return visitedLevel[a1] <= visitedLevel[a2];
        }

        private static int deepCount<T_key, T_elem>(Dictionary<T_key, List<T_elem>> map)
        {
            return map.Values.Aggregate(0, (int a, List<T_elem> b) => a + b.Count);
        }
        private static int deepCount<T_key1, T_key2, T_elem>(Dictionary<T_key1, Dictionary<T_key2, T_elem>> map)
        {
            return map.Values.Aggregate(0, (int a, Dictionary<T_key2, T_elem> b) => a + b.Count);
        }

        #region Output of the rootcause
        private static void printErrorReport(Dictionary<AssignCmd, List<Tuple<Constant, AssignCmd, Variable, Variable>>> rightCandidates, Constant cause)
        {
            foreach (AssignCmd key in rightCandidates.Keys)
            {
                List<Tuple<Constant, AssignCmd, Variable, Variable>> listOfTuples = rightCandidates[key];
                foreach (Tuple<Constant, AssignCmd, Variable, Variable> tuple in listOfTuples)
                {
                    if (tuple.Item1 == cause)
                    {
                        Console.Write("Cause ==> \nleftAssignment: {0}rightAssignment: {1}", tuple.Item2, key);
                        if (CmdToSourceline.ContainsKey(tuple.Item2) && CmdToSourceline.ContainsKey(key))
                        {
                            Console.WriteLine("leftAssignment sourceLine: {0}", CmdToSourceline[tuple.Item2]);
                            Console.WriteLine("rightAssignment sourceLine: {0}", CmdToSourceline[key]);
                            RegisterForHtmlOutput(CmdToSourceline[tuple.Item2], " left Rootcause ", CmdToSourceline[key], " right Rootcause ");
                        }
                        return;
                    }
                }
            }
        }
        private static void RegisterForHtmlOutput(BigNum leftLine, string leftMsg, BigNum rightLine, string rightMsg)
        {
            htmlOutputs.Add(Tuple.Create(leftLine, leftMsg, rightLine, rightMsg));
        }
        #endregion


        #region Finding first place of maptype mismatch
        private static bool FindFirstMemMismatchFromPassFail(Counterexample failing_cex, List<Counterexample> passing_cexs,
            List<Block> L_cex, List<Block> R_cex,
            Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> leftAssumeConsts,
            Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> rightAssumeConsts,
            out Constant lconst,
            out Constant rconst,
            out AssignCmd lAssign,
            out AssignCmd rAssign)
        {
            HashSet<Tuple<Constant, Constant>> disequalities = new HashSet<Tuple<Constant, Constant>>();
            HashSet<Tuple<Constant, Constant>> equalities = new HashSet<Tuple<Constant, Constant>>();

            if (Utils.verbosityLevel(2)) { Console.WriteLine("Point 1 in {0}", sw.Elapsed.TotalSeconds); }

            if (passing_cexs != null)
            {
                foreach (Counterexample passing_cex in passing_cexs)
                {
                    foreach (Tuple<Constant, Constant> disequality in FindDisequalitiesFromTest(program, implementation, L_cex, R_cex, passing_cex, leftAssumeConsts, rightAssumeConsts))
                    {
                        disequalities.Add(disequality);
                    }
                    foreach (Tuple<Constant, Constant> equality in FindEqualitiesFromTest(program, implementation, L_cex, R_cex, passing_cex, leftAssumeConsts, rightAssumeConsts))
                    {
                        equalities.Add(equality);
                    }
                }
            }
            if (Utils.verbosityLevel(2)) { Console.WriteLine("Point 2 in {0}", sw.Elapsed.TotalSeconds); }

            List<Tuple<Constant, Constant>> passDEQ = disequalities.Where(d => !equalities.Contains(d)).ToList();
            List<Tuple<Constant, Constant>> passEQ = equalities.Where(e => !disequalities.Contains(e)).ToList();
            if (Utils.verbosityLevel(2)) { Console.WriteLine("Point 3 in {0}", sw.Elapsed.TotalSeconds); }

            if (Utils.verbosityLevel(2))
            {
                Console.WriteLine("Found {0} equalities, {1} disequalities", passEQ.Count, passDEQ.Count);
            }

            List<Tuple<Constant, Constant>> failDEQ = FindDisequalitiesFromTest(program, implementation, L_cex, R_cex, failing_cex, leftAssumeConsts, rightAssumeConsts);
            List<Tuple<Constant, Constant>> failIntersectPass = new List<Tuple<Constant, Constant>>();
            if (Utils.verbosityLevel(2)) { Console.WriteLine("Point 4 in {0}", sw.Elapsed.TotalSeconds); }
            failIntersectPass = passEQ.Intersect(failDEQ).ToList();
            if (Utils.verbosityLevel(2)) { Console.WriteLine("Point 5 in {0}", sw.Elapsed.TotalSeconds); }

            if (Utils.verbosityLevel(2)) { Console.WriteLine("failIntersectPass: {0}", failIntersectPass.Count); }

            //don't need thse 2, but i need to pass something for out assignments
            List<AssignCmd> ignore1 = null, ignore2 = null;

            bool result = FindFirstMemMismatchFromDisequalities(passing_cexs != null ? failIntersectPass : failIntersectPass, //failDEQ, //TODO
                L_cex, R_cex, leftAssumeConsts, rightAssumeConsts, out lconst, out rconst, out lAssign, out rAssign, out ignore1, out ignore2);
            return result;
        }

        private static Counterexample FindCexWithFirstMemMismatch(
            VCExpr failing_or_passing_vc,
            Counterexample failing_cex,
            List<Block> L_cex, List<Block> R_cex,
            Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> leftAssumeConsts,
            Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> rightAssumeConsts
            )
        {
            List<Tuple<Constant, Constant>> disequalities =
                FindDisequalitiesFromTest(program, implementation, L_cex, R_cex, failing_cex, leftAssumeConsts, rightAssumeConsts);
            int i = 0, j = 0;
            AssignCmd lAssign = null; AssignCmd rAssign = null;
            List<BigNum> leftEqMemAssignsLines = new List<BigNum>();
            List<BigNum> rightEqMemAssignsLines = new List<BigNum>();

            var lCmds = new List<AssignCmd>();
            var rCmds = new List<AssignCmd>();
            foreach (var bl in L_cex)
            {
                foreach (var c in blockToCmdSeq[bl])
                {
                    if (c is AssignCmd)
                    {
                        lCmds.Add(c as AssignCmd);
                    }
                }
            }
            foreach (var bl in R_cex)
            {
                foreach (var c in blockToCmdSeq[bl])
                {
                    if (c is AssignCmd)
                    {
                        rCmds.Add(c as AssignCmd);
                    }
                }
            }

            while (true)
            {
                lAssign = rAssign = null;
                List<Variable> left = null, right = null;
                while (i < lCmds.Count)
                    if ((left = ContainsUnboundedMemUpdate(lCmds[i++])).Count > 0)
                        break;
                while (j < rCmds.Count)
                    if ((right = ContainsUnboundedMemUpdate(rCmds[j++])).Count > 0)
                        break;
                if (i >= lCmds.Count || j >= rCmds.Count)
                {
                    return failing_cex; //either/both sides ran out
                }
                //We currently match, if the vector of assignment has same size, and there is a 1-1 mapping
                if (left.Count != right.Count)
                {
                    Console.WriteLine("FindFirstMemMismatch: Mismatch got confused due to different sets of updates on two sides");
                    return failing_cex;
                }
                var pairs = left.Zip(right, (v1, v2) => (v1, v2)).ToList();
                //var pairs = tmp.Where(x => (x.Item1.TypedIdent.Type == x.Item2.TypedIdent.Type));
                if (pairs.Count() != left.Count)
                {
                    Console.WriteLine("FindFirstMemMismatch: Mismatch got confused due to different sets of updates on two sides");
                    return failing_cex;
                }
                foreach (var p in pairs)
                {
                    lAssign = lCmds[i - 1];
                    rAssign = rCmds[j - 1];
                    //find the constant for p.Item1
                    Constant lc = FindConstantForVariableInCmd(leftAssumeConsts, lAssign, p.Item1);
                    Constant rc = FindConstantForVariableInCmd(rightAssumeConsts, rAssign, p.Item2);
                    if (lc == null || rc == null) continue;
                    if (disequalities.Contains(Tuple.Create(lc, rc)))
                    {
                        //if we got here, then we can't find a disequality in the earlier map equalities from failing_cex
                        return failing_cex;
                    }
                    else
                    {
                        //try our luck
                        if (Utils.verbosityLevel(1))
                        {
                            Console.WriteLine("Trying synchronization point ({0},{1})",
                                CmdToSourceline[lAssign], CmdToSourceline[rAssign]);
                        }
                        VCExpr memConstraint = VC.exprGen.Not(VC.exprGen.Eq(VC.translator.LookupVariable(lc), VC.translator.LookupVariable(rc)));
                        VCExpr synch_vc = VC.exprGen.Implies(memConstraint, failing_or_passing_vc);
                        Counterexample cex = getCounterExample(synch_vc);
                        if (cex != null) { return cex; }
                    }
                }

            }
        }

        private static bool FindFirstMemMismatchFromFail(Counterexample failing_cex,
            List<Block> L_cex, List<Block> R_cex,
            Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> leftAssumeConsts,
            Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> rightAssumeConsts,
            out Constant lconst,
            out Constant rconst,
            out AssignCmd lAssign,
            out AssignCmd rAssign,
            out List<AssignCmd> leftEqMemAssigns,
            out List<AssignCmd> rightEqMemAssigns
            )
        {
            List<Tuple<Constant, Constant>> failDEQ = FindDisequalitiesFromTest(program, implementation, L_cex, R_cex, failing_cex, leftAssumeConsts, rightAssumeConsts);
            bool result = FindFirstMemMismatchFromDisequalities(failDEQ, L_cex, R_cex, leftAssumeConsts, rightAssumeConsts,
                out lconst, out rconst, out lAssign, out rAssign, out leftEqMemAssigns, out rightEqMemAssigns);
            return result;
        }

        private static bool FindFirstMemMismatchFromDisequalities(List<Tuple<Constant, Constant>> disequalities,
            List<Block> L_cex, List<Block> R_cex,
            Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> leftAssumeConsts,
            Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> rightAssumeConsts,
            out Constant lconst,
            out Constant rconst,
            out AssignCmd lAssign,
            out AssignCmd rAssign,
            out List<AssignCmd> leftEqMemAssigns,
            out List<AssignCmd> rightEqMemAssigns
            )
        {
            //Console.Write("FindFirstMemMismatch: Start...");
            int i = 0, j = 0;
            lAssign = rAssign = null;
            lconst = rconst = null;
            leftEqMemAssigns = new List<AssignCmd>();
            rightEqMemAssigns = new List<AssignCmd>();
            List<BigNum> leftEqMemAssignsLines = new List<BigNum>();
            List<BigNum> rightEqMemAssignsLines = new List<BigNum>();
            AssignCmd lastLeftAssign = null;
            AssignCmd lastRightAssign = null;

            var lCmds = new List<AssignCmd>();
            var rCmds = new List<AssignCmd>();
            foreach (var bl in L_cex)
            {
                foreach (var c in blockToCmdSeq[bl])
                {
                    if (c is AssignCmd)
                    {
                        lCmds.Add(c as AssignCmd);
                        lastLeftAssign = c as AssignCmd;
                    }
                }
            }
            foreach (var bl in R_cex)
            {
                foreach (var c in blockToCmdSeq[bl])
                {
                    if (c is AssignCmd)
                    {
                        rCmds.Add(c as AssignCmd);
                        lastRightAssign = c as AssignCmd;
                    }
                }
            }

            if (Utils.verbosityLevel(2))
            {
                Console.WriteLine("Last Left Line: {0} at line {1}", lastLeftAssign, CmdToSourceline[lastLeftAssign]);
                Console.WriteLine("Last Right Line: {0} at line {1}", lastRightAssign, CmdToSourceline[lastRightAssign]);
            }
            //we also store the last pair with mem-update that was not disequal
            AssignCmd leftLastEqMemAssign = null;
            AssignCmd rightLastEqMemAssign = null;

            while (true)
            {
                lAssign = rAssign = null;
                List<Variable> left = null, right = null;
                while (i < lCmds.Count)
                    if ((left = ContainsUnboundedMemUpdate(lCmds[i++])).Count > 0)
                        break;
                while (j < rCmds.Count)
                    if ((right = ContainsUnboundedMemUpdate(rCmds[j++])).Count > 0)
                        break;
                if (i >= lCmds.Count || j >= rCmds.Count)
                {
                    lAssign = lastLeftAssign; rAssign = lastRightAssign;
                    return false; //either/both sides ran out
                }
                //We currently match, if the vector of assignment has same size, and there is a 1-1 mapping
                if (left.Count != right.Count)
                {
                    Console.WriteLine("FindFirstMemMismatch: Mismatch got confused due to different sets of updates on two sides");
                    lAssign = lastLeftAssign; rAssign = lastRightAssign;
                    return false; //couldn't match
                }
                var pairs = left.Zip(right, (v1, v2) => (v1, v2)).ToList();
                //var pairs = tmp.Where(x => (x.Item1.TypedIdent.Type == x.Item2.TypedIdent.Type));
                if (pairs.Count() != left.Count)
                {
                    Console.WriteLine("FindFirstMemMismatch: Mismatch got confused due to different sets of updates on two sides");
                    lAssign = lastLeftAssign; rAssign = lastRightAssign;
                    return false; //couldn't match
                }
                foreach (var p in pairs)
                {
                    lAssign = lCmds[i - 1];
                    rAssign = rCmds[j - 1];
                    //find the constant for p.Item1
                    Constant lc = FindConstantForVariableInCmd(leftAssumeConsts, lAssign, p.Item1);
                    Constant rc = FindConstantForVariableInCmd(rightAssumeConsts, rAssign, p.Item2);
                    if (lc == null || rc == null) continue;
                    if (disequalities.Contains(Tuple.Create(lc, rc)))
                    {
                        lconst = lc; rconst = rc;
                        return true;
                    }
                }
                leftLastEqMemAssign = lAssign;
                //POSTFIXME: this is a HACK to deal with duplicate procedure calls
                if (!leftEqMemAssignsLines.Contains(CmdToSourceline[lAssign]))
                {
                    leftEqMemAssigns.Add(lAssign); leftEqMemAssignsLines.Add(CmdToSourceline[lAssign]);
                }
                rightLastEqMemAssign = rAssign;
                if (!rightEqMemAssignsLines.Contains(CmdToSourceline[rAssign]))
                {
                    rightEqMemAssigns.Add(rAssign); rightEqMemAssignsLines.Add(CmdToSourceline[rAssign]);
                }
            }
        }

        private static bool FindMemEqualityAtLine(
            int leftLine, int rightLine,
            List<Block> L_cex, List<Block> R_cex,
            Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> leftAssumeConsts,
            Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> rightAssumeConsts,
            out Constant lconst,
            out Constant rconst,
            out AssignCmd lAssign,
            out AssignCmd rAssign)
        {
            //Console.Write("FindFirstMemMismatch: Start...");
            int i = 0, j = 0;
            lAssign = rAssign = null;
            lconst = rconst = null;
            var lCmds = new List<AssignCmd>();
            var rCmds = new List<AssignCmd>();
            foreach (var bl in L_cex)
                foreach (var c in blockToCmdSeq[bl])
                    if (c is AssignCmd) lCmds.Add(c as AssignCmd);
            foreach (var bl in R_cex)
                foreach (var c in blockToCmdSeq[bl])
                    if (c is AssignCmd) rCmds.Add(c as AssignCmd);

            lAssign = rAssign = null;
            List<Variable> left = null, right = null;

            //determine the last mem update on left prior to input leftLine
            AssignCmd lastLeftCmd = null; int lastLeftCmdLine = 0;
            while (i < lCmds.Count)
            {
                if ((left = ContainsAnyMemUpdate(lCmds[i])).Count > 0)
                {
                    int currentLine = CmdToSourceline[lCmds[i]].ToInt;
                    if (currentLine > lastLeftCmdLine && currentLine <= leftLine)
                    {
                        lastLeftCmdLine = currentLine; lastLeftCmd = lCmds[i];
                    }
                }
                i++;
            }
            left = ContainsAnyMemUpdate(lastLeftCmd);

            //determine the last mem update on right prior to input rightLine that matches lastLeftCmd's type
            AssignCmd lastRightCmd = null; int lastRightCmdLine = 0;
            while (j < rCmds.Count)
            {
                if ((right = ContainsAnyMemUpdate(rCmds[j])).Count > 0)
                {
                    int currentLine = CmdToSourceline[rCmds[j]].ToInt;
                    //POSTFIXME: DO THIS NOW...look at types
                    if (currentLine > lastRightCmdLine && currentLine <= rightLine && left.Count == right.Count)
                    {
                        lastRightCmdLine = currentLine; lastRightCmd = rCmds[j];
                    }
                }
                j++;
            }
            right = ContainsAnyMemUpdate(lastRightCmd);

            if (Utils.verbosityLevel(1) && Options.findEarliestAssertionByLine)
            {
                Console.WriteLine("findEarliestAssertionByLine: using left line {0}, found {1} mem updates there...",
                    lastLeftCmdLine, left.Count);
                Console.WriteLine("findEarliestAssertionByLine: using right line {0}, found {1} mem updates there...",
                    lastRightCmdLine, right.Count);
                if (left.Count == 1)
                {
                    Console.WriteLine("findEarliestAssertionByLine: using {0} on left and {1} on right", left[0], right[0]);
                }
            }

            //Console.WriteLine("lastRightCmd: {0}, lastRightCmdLine: {1}", lastRightCmd, lastRightCmdLine);
            //Console.WriteLine("lastLeftCmd: {0}, lastLeftCmdLine: {1}", lastLeftCmd, lastLeftCmdLine);

            if (lastLeftCmd == null || lastRightCmd == null) return false; //either/both sides ran out
            //We currently match, if the vector of assignment has same size, and there is a 1-1 mapping
            if (left.Count != right.Count)
            {
                Console.WriteLine("FindMemEqualityAtLine: Mismatch got confused due to different sets of updates on two sides");
                return false; //couldn't match
            }
            var pairs = left.Zip(right, (v1, v2) => (v1, v2)).ToList();
            //var pairs = tmp.Where(x => (x.Item1.TypedIdent.Type == x.Item2.TypedIdent.Type));
            if (pairs.Count() != left.Count)
            {
                Console.WriteLine("FindMemEqualityAtLine: Mismatch got confused due to different sets of updates on two sides");
                return false; //couldn't match
            }
            foreach (var p in pairs)
            {
                lAssign = lastLeftCmd;
                rAssign = lastRightCmd;
                //find the constant for p.Item1
                Constant lc = FindConstantForVariableInCmd(leftAssumeConsts, lAssign, p.Item1);
                Constant rc = FindConstantForVariableInCmd(rightAssumeConsts, rAssign, p.Item2);
                if (lc == null || rc == null) { continue; }
                else { lconst = lc; rconst = rc; return true; }
            }
            return false;
        }

        private static Constant FindConstantForVariableInCmd(Dictionary<AssignCmd, List<Tuple<Variable, Constant>>> leftAssumeConsts,
            AssignCmd assignCmd, Variable variable)
        {
            if (!leftAssumeConsts.ContainsKey(assignCmd)) return null;
            var ret = leftAssumeConsts[assignCmd].Find(x => (x.Item1 == variable));
            return (ret != null ? ret.Item2 : null);
        }
        private static List<Variable> ContainsUnboundedMemUpdate(AssignCmd assignCmd)
        {
            //Write custom filters with appropriate command line options
            Func<Expr, bool> RhssOpMatches = delegate(Expr x)
            {
                if (x is NAryExpr &&
                    ((NAryExpr)x).Fun.FunctionName.Contains("CallMem")) return true;
                return false;
            };
            var lr = assignCmd.Lhss.Zip(assignCmd.Rhss, (v1, v2) => (v1, v2)); //make decision on lhs + rhs
            return lr.Where(x => (x.Item1.Type.IsMap && RhssOpMatches(x.Item2))).ToList().ConvertAll(x => x.Item1.DeepAssignedVariable);
        }

        private static List<Variable> ContainsAnyMemUpdate(AssignCmd assignCmd)
        {
            //Write custom filters with appropriate command line options
            Func<Expr, bool> RhssOpMatches = delegate(Expr x)
            {
                if (x is NAryExpr &&
                    ((NAryExpr)x).Fun.FunctionName.Contains("Mem")) return true;
                return false;
            };
            var lr = assignCmd.Lhss.Zip(assignCmd.Rhss, (v1, v2) => (v1, v2)); //make decision on lhs + rhs
            return lr.Where(x => (x.Item1.Type.IsMap && RhssOpMatches(x.Item2))).ToList().ConvertAll(x => x.Item1.DeepAssignedVariable);
        }

        #endregion

    }
}
