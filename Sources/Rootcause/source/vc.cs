using System;
using System.Collections.Generic;
using System.Collections;
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
    //state related to VC generation that will be shared by different options
    static class VC
    {
        /* VerificationConditionGenerator related state */
        static public VerificationConditionGenerator VerificationConditionGenerator;
        static public ProverInterface proverInterface;
        static public ProverInterface.ErrorHandler handler;
        static public VerificationResultCollector collector;
        static public Boogie2VCExprTranslator translator;
        static public VCExpressionGenerator exprGen;

        #region Utilities for calling the verifier
        public static void InitializeVCGen(Program prog)
        { 
            //create VC.VerificationConditionGenerator/VC.proverInterface
            var checkerPool = new CheckerPool(BoogieUtils.BoogieOptions);
            VC.VerificationConditionGenerator = new VerificationConditionGenerator(prog, checkerPool);
            VC.proverInterface = ProverInterface.CreateProver(
                BoogieUtils.BoogieOptions, prog, BoogieUtils.BoogieOptions.ProverLogFilePath,
                BoogieUtils.BoogieOptions.ProverLogFileAppend, BoogieUtils.BoogieOptions.TimeLimit);
            VC.translator = VC.proverInterface.Context.BoogieExprTranslator;
            VC.exprGen = VC.proverInterface.Context.ExprGen;
            VC.collector = new VerificationResultCollector(BoogieUtils.BoogieOptions);
        }
        public static SolverOutcome VerifyVC(string descriptiveName, VCExpr vc, out List<Counterexample> cex)
        {
            VC.collector.examples.Clear(); //reset the cexs
            //Use MyBeginCheck instead of BeginCheck as it is inconsistent with CheckAssumptions's Push/Pop of declarations
            SolverOutcome proverOutcome;
            //proverOutcome = MyBeginCheck(descriptiveName, vc, VC.handler); //Crashes now
            proverOutcome = proverInterface.Check(descriptiveName, vc, handler,
                BoogieUtils.BoogieOptions.ErrorLimit, CancellationToken.None).Result;
            cex = collector.examples.ToList();
            return proverOutcome;
        }

        public static void FinalizeVCGen(Program prog)
        {
            VC.collector = null;
        }

        // public static SolverOutcome MyBeginCheck(string descriptiveName, VCExpr vc, ProverInterface.ErrorHandler handler)
        // {
        //     VC.proverInterface.Push();
        //     VC.proverInterface.Assert(vc, true);
        //     VC.proverInterface.Check();
        //     var outcome = VC.proverInterface.CheckOutcomeCore(VC.handler, CancellationToken.None).Result;
        //     VC.proverInterface.Pop();
        //     return outcome;
        // }
        public static VCExpr GenerateVC(Program prog, Implementation impl)
        {
            VC.VerificationConditionGenerator.ConvertCFG2DAG(new ImplementationRun(impl, Console.Out));
            ModelViewInfo mvInfo;
            Dictionary<TransferCmd, ReturnCmd> gotoCmdOrigins =
                VC.VerificationConditionGenerator.PassifyImpl(new ImplementationRun(impl, Console.Out), out mvInfo);
            //Hashtable/*TransferCmd->ReturnCmd*/ gotoCmdOrigins = VC.VerificationConditionGenerator.PassifyImpl(impl, out mvInfo);

            var exprGen = VC.proverInterface.Context.ExprGen;
            //VCExpr controlFlowVariableExpr = null; 
            VCExpr controlFlowVariableExpr = /*BoogieUtils.BoogieOptions.UseLabels ? null :*/ VC.exprGen.Integer(BigNum.ZERO);


            //Hashtable/*<int, Absy!>*/ label2absy;
            var absyIds = new ControlFlowIdMap<Absy>();
            var vc = VC.VerificationConditionGenerator.GenerateVC(impl, controlFlowVariableExpr, absyIds, VC.proverInterface.Context);
            VCExpr controlFlowFunctionAppl = VC.exprGen.ControlFlowFunctionApplication(VC.exprGen.Integer(BigNum.ZERO), VC.exprGen.Integer(BigNum.ZERO));
            VCExpr eqExpr = VC.exprGen.Eq(controlFlowFunctionAppl, VC.exprGen.Integer(BigNum.FromInt(impl.Blocks[0].UniqueId)));
            vc = VC.exprGen.Implies(eqExpr, vc);

            var split = new ManualSplit(BoogieUtils.BoogieOptions, impl.Blocks, gotoCmdOrigins,
                VC.VerificationConditionGenerator, new ImplementationRun(impl, Console.Out), Token.NoToken);
            VC.handler = new VerificationConditionGenerator.ErrorReporter(
                BoogieUtils.BoogieOptions, gotoCmdOrigins, absyIds, impl.Blocks, new Dictionary<Cmd, List<object>>(),
                VC.collector, mvInfo, VC.proverInterface.Context, prog, split);
            return vc;
        }
        #endregion 

    }
}
