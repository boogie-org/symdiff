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
                .Where(x => QKeyValue.FindBoolAttribute(x.Attributes, "checkDependency"))
                .Iter(x => Analyze(x));

        }
        private void Analyze(Implementation impl)
        {
            //get the guard constants  (refine per procedure)
            inputGuardConsts = prog.TopLevelDeclarations.OfType<Constant>()
                .Where(x => QKeyValue.FindBoolAttribute(x.Attributes, "guardInputs"))
                .ToList();
            outputGuardConsts = prog.TopLevelDeclarations.OfType<Constant>()
                .Where(x => QKeyValue.FindBoolAttribute(x.Attributes, "guardOutputs"))
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
            outputGuardConsts.Iter(x => AnalyzeDependencyWithUnsatCore(programVC,x));

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
                Console.WriteLine("VC not valid, returning");
                Console.WriteLine("The list of inputs in the Dependency of {0} = <*>", outConstant);
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
            Console.WriteLine("The list of inputs in the Dependency of {0} = <{1}>",
                outConstant,
                string.Join(",", unsatClauseIdentifiers.Select(i => assumptions[i])));
                
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
            return procedure != null && QKeyValue.FindIntAttribute(procedure.Attributes, "inline", -1) != -1;
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
