using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Boogie;
using Microsoft.Boogie.GraphUtil;
using System.Collections;
using System.Diagnostics;
using Microsoft.Boogie.VCExprAST;
using VC;
using Microsoft.Basetypes;
using BType = Microsoft.Boogie.Type;

namespace Dependency
{

    public static class RefineConsts
    {
        public const string inputGuardName = "bi";
        public const string inputGuradAttribute = "guardOutputs";

        public const string outputGuardName = "bo";
        public const string outputGuradAttribute = "guardInputs";

        public const string refinedProcNamePrefix = "CheckDependency_";
        public const string equivCheckVarName = "eq";
        public const string checkDepAttribute = "checkDependency";

        public const string inlineAttribute = "inline";

        public const string inputsNamePrefix = "r";
        public const string outputsNamePrefix = "m";
        public const string refinedProcBodyName = "body";
        public const string refineProgramNamePostfix = ".CD.bpl";
    }

    public class RefineProgram
    {
        Program prog;
        string filename;

        public RefineProgram(string filename) { this.filename = filename; }


        #region Description of created program structure
        /*
                Given P, I, O
                CheckDependecy_P() return (EQ) Ensures BO => EQ {
                  Havoc I
                  I1 := I
                  O1 = call P(I)
                  Havoc I
                  I2 := I
                  O2 = call P(I)
                  Assume BI => I1 == I2
                  EQ := O1 == O2
                  Return
                }
                // TODO: globals
             */
        #endregion
        public string Create()
        {
            if (!Utils.ParseProgram(filename, out prog)) return null;

            var visitor = new Analysis.DependencyTaintVisitor(prog);
            visitor.Visit(prog);
            var procDependencies = visitor.procDependencies;

            List<Declaration> newDecls = new List<Declaration>();
            foreach (var impl in prog.Implementations())
            {
                var proc = impl.Proc;
                procDependencies[proc].Prune(proc);
                var readSet = procDependencies[proc].ReadSet();
                var modSet = procDependencies[proc].ModSet();
                readSet.Remove(Analysis.nonDetVar);

                //make any asserts/requires/ensures free
                proc.Requires = proc.Requires.Select(x => new Requires(true, x.Condition)).ToList();
                proc.Ensures  = proc.Ensures.Select(x => new Ensures(true, x.Condition)).ToList();
                (new Utils.RemoveAsserts()).Visit(impl);

                // add inline attribute to the original proc and impl
                if (QKeyValue.FindExprAttribute(proc.Attributes, RefineConsts.inlineAttribute) == null)
                    proc.AddAttribute(RefineConsts.inlineAttribute, Expr.Literal(1));
                if (QKeyValue.FindExprAttribute(impl.Attributes, RefineConsts.inlineAttribute) == null)
                    impl.AddAttribute(RefineConsts.inlineAttribute, Expr.Literal(1));
                //Debug.Assert(QKeyValue.FindBoolAttribute(proc.Attributes, RefineConsts.inlineAttribute));
                var procName = proc.Name;

                // create input guards
                var inputGuards = CreateInputGuards(readSet, procName);
                newDecls.AddRange(inputGuards);    

                // create output guards
                var outputGuards = CreateOutputGuards(modSet, procName);
                newDecls.AddRange(outputGuards);

                // create prototype
                List<Variable> equivOutParams;
                List<Ensures> equivEnsures;
                var refineProc = CreateProtoype(modSet, procName, outputGuards, out equivOutParams, out equivEnsures);

                // create implementation
                var refineImpl = CreateImplementation(proc, readSet, modSet, procName, inputGuards, equivOutParams);
                refineImpl.Proc = refineProc;

                newDecls.Add(refineProc);
                newDecls.Add(refineImpl);
            }
            prog.TopLevelDeclarations.AddRange(newDecls);

            ModSetCollector c = new ModSetCollector();
            c.DoModSetAnalysis(prog);

            prog.Resolve();
            prog.Typecheck();

            var newFilename = (filename.EndsWith(".bpl") ? filename.Substring(0,filename.Length - ".bpl".Length) : filename) + RefineConsts.refineProgramNamePostfix;
            var tuo = new TokenTextWriter(newFilename, true);
            prog.Emit(tuo);
            tuo.Close();

            return newFilename;
        }

        private static Implementation CreateImplementation(Procedure proc, List<Variable> readSet, List<Variable> modSet, string procName, List<Constant> inputGuards, List<Variable> equivOutParams)
        {
            var locals = new List<Variable>();

            // create input variables
            List<Variable> actualInputs = new List<Variable>();
            for (int i = 1; i <= proc.InParams.Count; ++i)
                actualInputs.Add(new LocalVariable(Token.NoToken, new TypedIdent(Token.NoToken, RefineConsts.inputsNamePrefix + i, proc.InParams[i - 1].TypedIdent.Type)));
            locals.AddRange(actualInputs);

            // create read set recording variables
            List<Variable> recordedReadSet1, recordedReadSet2;
            CreateRecordedReadSetVars(readSet, locals, out recordedReadSet1, out recordedReadSet2);

            // create output variables
            List<Variable> actualOutputs = new List<Variable>();
            for (int i = 1; i <= proc.OutParams.Count; ++i)
                actualOutputs.Add(new LocalVariable(Token.NoToken, new TypedIdent(Token.NoToken, RefineConsts.outputsNamePrefix + i, proc.OutParams[i - 1].TypedIdent.Type)));
            locals.AddRange(actualOutputs);

            // create mod set recording variables
            List<Variable> recordedModSet1, recordedModSet2;
            CreateRecordedModeSetVars(modSet, locals, out recordedModSet1, out recordedModSet2);

            // create body
            List<Block> body = new List<Block>();
            Block bodyBlock = new Block();
            body.Add(bodyBlock);
            bodyBlock.Label = RefineConsts.refinedProcBodyName;

            // first side
            CreateSide(proc, readSet, modSet, actualInputs, recordedReadSet1, actualOutputs, recordedModSet1, bodyBlock);
            // second side
            CreateSide(proc, readSet, modSet, actualInputs, recordedReadSet2, actualOutputs, recordedModSet2, bodyBlock);

            // create assumptions
            for (int i = 0; i < readSet.Count; i++)
                bodyBlock.Cmds.Add(new AssumeCmd(new Token(), Expr.Imp(Expr.Ident(inputGuards[i]), Expr.Eq(Expr.Ident(recordedReadSet1[i]), Expr.Ident(recordedReadSet2[i]))))); // ensures bi_k => i_k_1 == i_k_2

            // create checks     
            CreateChecks(modSet, equivOutParams, recordedModSet1, recordedModSet2, bodyBlock);

            // create return
            bodyBlock.TransferCmd = new ReturnCmd(new Token());

            // create implementation
            var refineImpl = new Implementation(new Token(), RefineConsts.refinedProcNamePrefix + procName, new List<TypeVariable>(),
                new List<Variable>(),
                equivOutParams,
                locals,
                body);
            refineImpl.AddAttribute(RefineConsts.checkDepAttribute);
            return refineImpl;
        }

        private static void CreateSide(Procedure proc, List<Variable> readSet, List<Variable> modSet, List<Variable> actualInputs, List<Variable> recordedReadSet, List<Variable> actualOutputs, List<Variable> recordedModSet, Block body)
        {
            // havoc actual inputs
            if (actualInputs.Count > 0)
                body.Cmds.Add(CreateHavocCmd(actualInputs));
            // havoc globals in read set
            var globals = readSet.Where(r => r is GlobalVariable);
            if (globals.Count() > 0)
                body.Cmds.Add(CreateHavocCmd(globals));

            // record read set
            List<Variable> rhs = new List<Variable>();
            foreach (var r in readSet)
            {
                if (r is GlobalVariable)
                    rhs.Add(r);
                else if (proc.InParams.Contains(r))
                    rhs.Add(actualInputs[proc.InParams.IndexOf(r)]);
            }
            if (rhs.Count > 0)
                body.Cmds.Add(CreateAssignCmd(recordedReadSet, rhs));

            // call 
            body.Cmds.Add(CreateCallCmd(proc, actualInputs, actualOutputs));

            // record mod set
            rhs = new List<Variable>();
            foreach (var m in modSet)
            {
                if (m is GlobalVariable)
                    rhs.Add(m);
                else if (proc.OutParams.Contains(m))
                    rhs.Add(actualOutputs[proc.OutParams.IndexOf(m)]);
            }
            if (rhs.Count > 0)
                body.Cmds.Add(CreateAssignCmd(recordedModSet, rhs));
        }

        private static void CreateChecks(List<Variable> modSet, List<Variable> equivOutParams, List<Variable> recordedModSet1, List<Variable> recordedModSet2, Block bodyBlock)
        {
            List<AssignLhs> equivOutsLhss = new List<AssignLhs>();
            equivOutParams.Iter(o => equivOutsLhss.Add(new SimpleAssignLhs(Token.NoToken, Expr.Ident(o))));
            List<Expr> equivOutputExprs = new List<Expr>();
            for (int i = 0; i < modSet.Count; i++)
                equivOutputExprs.Add(Expr.Eq(Expr.Ident(recordedModSet1[i]), Expr.Ident(recordedModSet2[i])));
            bodyBlock.Cmds.Add(new AssignCmd(new Token(), equivOutsLhss, equivOutputExprs));
        }

        private static void CreateRecordedModeSetVars(List<Variable> modSet, List<Variable> locals, out List<Variable> rms1, out List<Variable> rms2)
        {
            rms1 = new List<Variable>();
            rms2 = new List<Variable>();
            for (int i = 1; i <= modSet.Count; i++)
            {
                var type = modSet[i - 1].TypedIdent.Type;
                rms1.Add(new LocalVariable(Token.NoToken, new TypedIdent(Token.NoToken, RefineConsts.outputsNamePrefix + i + "_" + "1", type)));
                rms2.Add(new LocalVariable(Token.NoToken, new TypedIdent(Token.NoToken, RefineConsts.outputsNamePrefix + i + "_" + "2", type)));
            }
            locals.AddRange(rms1);
            locals.AddRange(rms2);
        }

        private static void CreateRecordedReadSetVars(List<Variable> readSet, List<Variable> locals, out List<Variable> rrs1, out List<Variable> rrs2)
        {
            rrs1 = new List<Variable>();
            rrs2 = new List<Variable>();
            for (int i = 1; i <= readSet.Count; i++)
            {
                var type = readSet[i - 1].TypedIdent.Type;
                rrs1.Add(new LocalVariable(Token.NoToken, new TypedIdent(Token.NoToken, RefineConsts.inputsNamePrefix + i + "_" + "1", type)));
                rrs2.Add(new LocalVariable(Token.NoToken, new TypedIdent(Token.NoToken, RefineConsts.inputsNamePrefix + i + "_" + "2", type)));
            }
            locals.AddRange(rrs1);
            locals.AddRange(rrs2);
        }

        private static Procedure CreateProtoype(List<Variable> modSet, string procName, List<Constant> outputGuards, out List<Variable> equivOutParams, out List<Ensures> equivEnsures)
        {
            equivOutParams = new List<Variable>();
            equivEnsures = new List<Ensures>();
            for (int i = 1; i <= modSet.Count; i++)
            {
                equivOutParams.Add(new Formal(Token.NoToken, new TypedIdent(Token.NoToken, RefineConsts.equivCheckVarName + i, Microsoft.Boogie.Type.Bool), false));
                equivEnsures.Add(new Ensures(false, Expr.Imp(Expr.Ident(outputGuards[i - 1]), Expr.Ident(equivOutParams[i - 1])))); // ensures bo_k => eq_k
            }

            var refineProc = new Procedure(new Token(), RefineConsts.refinedProcNamePrefix + procName, new List<TypeVariable>(),
                new List<Variable>(),
                equivOutParams,
                new List<Requires>(),
                new List<IdentifierExpr>(),
                equivEnsures);
            refineProc.AddAttribute(RefineConsts.checkDepAttribute);
            return refineProc;
        }

        private static List<Constant> CreateOutputGuards(IEnumerable<Variable> modSet, string procName)
        {
            var outputGuards = new List<Constant>();
            foreach (var m in modSet)
            {
                var og = new Constant(Token.NoToken, new TypedIdent(new Token(), procName + "_" + RefineConsts.outputGuardName + "_" + m, Microsoft.Boogie.Type.Bool), false);
                string[] vals = { procName };
                og.AddAttribute(RefineConsts.outputGuradAttribute, vals);
                outputGuards.Add(og);
            }
            return outputGuards;
        }

        private static List<Constant> CreateInputGuards(IEnumerable<Variable> readSet, string procName)
        {
            List<Constant> inputGuards = new List<Constant>();
            foreach (var r in readSet)
            {
                var ig = new Constant(Token.NoToken, new TypedIdent(new Token(), procName + "_" + RefineConsts.inputGuardName + "_" + r, Microsoft.Boogie.Type.Bool), false);
                string[] vals = { procName };
                ig.AddAttribute(RefineConsts.inputGuradAttribute, vals);
                inputGuards.Add(ig);
            }
            return inputGuards;
        }

        private static HavocCmd CreateHavocCmd(IEnumerable<Variable> vars)
        {
            List<IdentifierExpr> exprs = new List<IdentifierExpr>();
            vars.Iter(i => exprs.Add(Expr.Ident(i)));
            return new HavocCmd(new Token(), exprs);
        }

        private static AssignCmd CreateAssignCmd(IEnumerable<Variable> lhs, IEnumerable<Variable> rhs)
        {
            List<AssignLhs> assignLhss = new List<AssignLhs>();
            lhs.Iter(i => assignLhss.Add(new SimpleAssignLhs(Token.NoToken, Expr.Ident(i))));
            List<Expr> rhsExprs = new List<Expr>();
            rhs.Iter(i => rhsExprs.Add(Expr.Ident(i)));
            return new AssignCmd(new Token(), assignLhss, rhsExprs);
        }

        private static CallCmd CreateCallCmd(Procedure proc, IEnumerable<Variable> inputs, IEnumerable<Variable> outputs)
        {
            // call with actual inputs and record actual outputs
            List<Expr> inputExprs = new List<Expr>();
            inputs.Iter(i => inputExprs.Add(Expr.Ident(i)));
            List<IdentifierExpr> outputExprs = new List<IdentifierExpr>();
            outputs.Iter(i => outputExprs.Add(Expr.Ident(i)));
            
            var result = new CallCmd(new Token(), proc.Name, inputExprs, outputExprs);
            result.Proc = proc;
            return result;
        }
    }

    // TODO: use RefineConsts instead of magic strings
    public class RefineDependency
    {
        Program prog;
        string filename;
        List<Constant> inputGuardConsts, outputGuardConsts;

        public RefineDependency(string filename) { this.filename = filename; }
        public void Run()
        {
            //Parsing stuff
            if (!Utils.ParseProgram(filename, out prog)) return;
            ModSetCollector c = new ModSetCollector();
            c.DoModSetAnalysis(prog);

            //inline all the procedures
            BoogieUtils.Inline(prog);

            //create a VC
            prog.TopLevelDeclarations.OfType<Implementation>()
                .Where(x => QKeyValue.FindBoolAttribute(x.Attributes, RefineConsts.checkDepAttribute))
                .Iter(x => Analyze(x));

        }
        private void Analyze(Implementation impl)
        {
            var origProcName = impl.Proc.Name.Replace(RefineConsts.refinedProcNamePrefix, "");
            //get the procedure's guard constants
            inputGuardConsts = prog.TopLevelDeclarations.OfType<Constant>()
                .Where(x => QKeyValue.FindStringAttribute(x.Attributes, RefineConsts.inputGuradAttribute) == origProcName)
                .ToList();
            outputGuardConsts = prog.TopLevelDeclarations.OfType<Constant>()
                .Where(x => QKeyValue.FindStringAttribute(x.Attributes, RefineConsts.outputGuradAttribute) == origProcName)
                .ToList();

            //---- generate VC starts ---------
            //following unsatcoreFromFailures.cs/PerformRootcauseWorks or EqualityFixes.cs/PerformRootCause in Rootcause project
            //typecheck the instrumented program
            prog.Resolve();
            prog.Typecheck();

            //Generate VC
            VC.InitializeVCGen(prog);
            VCExpr programVC = VC.GenerateVC(prog, impl);
            //---- generate VC ends ---------

            //Analyze using UNSAT cores for each output
            Console.WriteLine("RefinedDependency[{0}] = [", impl.Name);
            outputGuardConsts.Iter(x => AnalyzeDependencyWithUnsatCore(programVC,x));
            Console.WriteLine("]");
            VC.FinalizeVCGen(prog);

        }
        private void AnalyzeDependencyWithUnsatCore(VCExpr programVC, Constant outConstant)
        {
            #region Description of UNSAT core logic implemented below 
            /*
                Given VC, I, O, o
                - preInp = (\wedge_{i \in I} i) 
                - preOut = (\wedge_{o' \in O} !o') \wedge o
                - VC' = (preOut => VC)
                - checkValid preInp => VC'
                - if invalid return
                - A += !VC' 
                - A += I
                - if (CheckAssumption(A, out core) != valid) ABORT
             */
            #endregion

            //Should call VerifyVC before invoking CheckAssumptions
            List<Counterexample> cexs;
            var preInp = inputGuardConsts
                .Aggregate(VCExpressionGenerator.True, (x, y) => VC.exprGen.And(x, VC.translator.LookupVariable(y)));
            var preOut = outputGuardConsts
                .Where(x => x != outConstant)
                .Aggregate(VCExpressionGenerator.True, (x, y) => VC.exprGen.And(x, VC.exprGen.Not(VC.translator.LookupVariable(y))));
            preOut = VC.exprGen.And(preOut, VC.translator.LookupVariable(outConstant));
            var newVC = VC.exprGen.Implies(preOut, programVC);

            //check for validity (presence of all input eq implies output is equal)
            var outcome = VC.VerifyVC("RefineDependency", VC.exprGen.Implies(preInp, newVC), out cexs);
            if (outcome != ProverInterface.Outcome.Valid)
            {
                Console.WriteLine("\t VC not valid, returning");
                Console.WriteLine("\t Dependency of {0} =  <*>", outConstant);
                return;
            }

            List<int> unsatClauseIdentifiers = new List<int>();
            var assumptions = new List<VCExpr>();
            assumptions.Add(VC.exprGen.Not(newVC));

            //Add the list of all input constants
            inputGuardConsts.ForEach(x => assumptions.Add(VC.translator.LookupVariable(x)));

            //VERY IMPORTANT: TO USE UNSAT CORE, SET ContractInfer to true in CommandLineOptions.Clo.
            outcome = ProverInterface.Outcome.Undetermined;
            outcome = VC.proverInterface.CheckAssumptions(assumptions, out unsatClauseIdentifiers, VC.handler);
            if (outcome == ProverInterface.Outcome.Invalid && unsatClauseIdentifiers.Count() == 0)
            {
                Console.WriteLine("Something went wrong! Unsat core with 0 elements for {0}", outConstant);
                return;
            }
            if (!unsatClauseIdentifiers.Remove(0)) //newVC should be always at 0, since it has to participate in inconsistency
            {
                Console.WriteLine("Something went wrong! The VC itself is not part of UNSAT core");
                return;
            }

            //Core may not be minimal (e.g. testdependencyDummy.bpl), need to iterate
            var core0 = unsatClauseIdentifiers.Select(i => assumptions[i]);
            var core = new List<VCExpr>(core0);
            core0
                .Iter(b =>
                {
                    core.Remove(b);
                    preInp = core.Aggregate(VCExpressionGenerator.True, (x, y) => VC.exprGen.And(x, y));
                    outcome = VC.VerifyVC("RefineDependency", VC.exprGen.Implies(preInp, newVC), out cexs);
                    if (outcome != ProverInterface.Outcome.Valid)
                    {
                        core.Add(b);
                        return;
                    }
                });

            Console.WriteLine("\t Dependency of {0} = <{1}>",
                outConstant,
                string.Join(",", core));                
        }
    }

    /// <summary>
    /// TODO: Copied from Rootcause, refactor 
    /// </summary>
    class BoogieUtils
    {
        public static void Inline(Program program)
        {
            //perform inlining on the procedures
            List<Declaration> impls = program.TopLevelDeclarations.FindAll(x => x is Implementation);
            foreach (Implementation impl in impls)
            {
                impl.OriginalBlocks = impl.Blocks;
                impl.OriginalLocVars = impl.LocVars;
            }

            foreach (Implementation impl in impls)
                Inliner.ProcessImplementation(program, impl);

        }
        public static bool IsInlinedProc(Procedure procedure)
        {
            return procedure != null && QKeyValue.FindIntAttribute(procedure.Attributes, RefineConsts.inlineAttribute, -1) != -1;
        }
    }

    //state related to VC generation that will be shared by different options
    /// <summary>
    /// TODO: Copied from Rootcause, refactor
    /// </summary>
    static class VC
    {
        /* vcgen related state */
        static public VCGen vcgen;
        static public ProverInterface proverInterface;
        static public ProverInterface.ErrorHandler handler;
        static public ConditionGeneration.CounterexampleCollector collector;
        static public Boogie2VCExprTranslator translator;
        static public VCExpressionGenerator exprGen;

        #region Utilities for calling the verifier
        public static void InitializeVCGen(Program prog)
        {
            //create VC.vcgen/VC.proverInterface
            VC.vcgen = new VCGen(prog, CommandLineOptions.Clo.SimplifyLogFilePath, CommandLineOptions.Clo.SimplifyLogFileAppend, null);
            VC.proverInterface = ProverInterface.CreateProver(prog, CommandLineOptions.Clo.SimplifyLogFilePath, CommandLineOptions.Clo.SimplifyLogFileAppend, CommandLineOptions.Clo.ProverKillTime);
            VC.translator = VC.proverInterface.Context.BoogieExprTranslator;
            VC.exprGen = VC.proverInterface.Context.ExprGen;
            VC.collector = new ConditionGeneration.CounterexampleCollector();
        }
        public static ProverInterface.Outcome VerifyVC(string descriptiveName, VCExpr vc, out List<Counterexample> cex)
        {
            VC.collector.examples.Clear(); //reset the cexs
            //Use MyBeginCheck instead of BeginCheck as it is inconsistent with CheckAssumptions's Push/Pop of declarations
            ProverInterface.Outcome proverOutcome;
            //proverOutcome = MyBeginCheck(descriptiveName, vc, VC.handler); //Crashes now
            VC.proverInterface.BeginCheck(descriptiveName, vc, VC.handler);
            proverOutcome = VC.proverInterface.CheckOutcome(VC.handler);
            cex = VC.collector.examples;
            return proverOutcome;
        }

        public static void FinalizeVCGen(Program prog)
        {
            VC.collector = null;
        }

        public static ProverInterface.Outcome MyBeginCheck(string descriptiveName, VCExpr vc, ProverInterface.ErrorHandler handler)
        {
            VC.proverInterface.Push();
            VC.proverInterface.Assert(vc, true);
            VC.proverInterface.Check();
            var outcome = VC.proverInterface.CheckOutcomeCore(VC.handler);
            VC.proverInterface.Pop();
            return outcome;
        }
        public static VCExpr GenerateVC(Program prog, Implementation impl)
        {
            VC.vcgen.ConvertCFG2DAG(impl);
            ModelViewInfo mvInfo;
            var /*TransferCmd->ReturnCmd*/ gotoCmdOrigins = VC.vcgen.PassifyImpl(impl, out mvInfo);

            var exprGen = VC.proverInterface.Context.ExprGen;
            //VCExpr controlFlowVariableExpr = null; 
            VCExpr controlFlowVariableExpr = CommandLineOptions.Clo.UseLabels ? null : VC.exprGen.Integer(BigNum.ZERO);


            Dictionary<int, Absy> label2absy;
            var vc = VC.vcgen.GenerateVC(impl, controlFlowVariableExpr, out label2absy, VC.proverInterface.Context);
            if (!CommandLineOptions.Clo.UseLabels)
            {
                VCExpr controlFlowFunctionAppl = VC.exprGen.ControlFlowFunctionApplication(VC.exprGen.Integer(BigNum.ZERO), VC.exprGen.Integer(BigNum.ZERO));
                VCExpr eqExpr = VC.exprGen.Eq(controlFlowFunctionAppl, VC.exprGen.Integer(BigNum.FromInt(impl.Blocks[0].UniqueId)));
                vc = VC.exprGen.Implies(eqExpr, vc);
            }

            if (CommandLineOptions.Clo.vcVariety == CommandLineOptions.VCVariety.Local)
            {
                VC.handler = new VCGen.ErrorReporterLocal(gotoCmdOrigins, label2absy, impl.Blocks, VC.vcgen.incarnationOriginMap, VC.collector, mvInfo, VC.proverInterface.Context, prog);
            }
            else
            {
                VC.handler = new VCGen.ErrorReporter(gotoCmdOrigins, label2absy, impl.Blocks, VC.vcgen.incarnationOriginMap, VC.collector, mvInfo, VC.proverInterface.Context, prog);
            }
            return vc;
        }
        #endregion

    }



}
