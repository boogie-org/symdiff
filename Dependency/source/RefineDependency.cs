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

    public class RefineConsts
    {
        public const string inputGuardName = "bi";
        public const string inputGuradAttribute = "guardOutputs";

        public const string outputGuardName = "bo";
        public const string outputGuradAttribute = "guardInputs";

        public const string refinedProcNamePrefix = "CheckDependency_";
        public const string equivCheckVarName = "eq";
        public const string checkDepAttribute = "checkDependency";

        public const string inputsNamePrefix = "i";
        public const string outputsNamePrefix = "o";
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
                - Havoc I
                - I1 := I
                - O1 = call P(I)
                - Havoc I
                - I2 := I
                - O2 = call P(I)
                - Assume BI => I1 == I2
                - EQ := O1 == O2
                - Return
                }
                // TODO: globals
             */
        #endregion
        public string Create()
        {
            if (!Utils.ParseProgram(filename, out prog)) return null;
            List<Declaration> newDecls = new List<Declaration>();
            foreach (var impl in prog.Implementations())
            {
                // TODO: add inline attribute to the original proc(?)
                var procName = impl.Proc.Name;
                // create input guards
                var inputGuards = new List<Constant>();
                for (int i = 1; i <= impl.Proc.InParams.Count; i++)
                {
                    var inputGuard = new Constant(Token.NoToken, new TypedIdent(Token.NoToken, procName + "_" + RefineConsts.inputGuardName + i, Microsoft.Boogie.Type.Bool), false);
                    inputGuard.AddAttribute(RefineConsts.inputGuradAttribute);
                    inputGuards.Add(inputGuard);
                }
                newDecls.AddRange(inputGuards);    

                // create output guards
                var outputGuards = new List<Constant>();
                for (int i = 1; i <= impl.Proc.OutParams.Count; i++)
                {
                    var outputGuard = new Constant(Token.NoToken, new TypedIdent(Token.NoToken, procName + "_" + RefineConsts.outputGuardName + i, Microsoft.Boogie.Type.Bool), false);
                    outputGuard.AddAttribute(RefineConsts.outputGuradAttribute);
                    outputGuards.Add(outputGuard);
                }
                newDecls.AddRange(outputGuards);

                var equivOutParams = new List<Variable>();
                var equivEnsures = new List<Ensures>();
                for (int i = 1; i <= impl.Proc.OutParams.Count; i++)
                {
                    equivOutParams.Add(new Formal(Token.NoToken, new TypedIdent(Token.NoToken, RefineConsts.equivCheckVarName + i, Microsoft.Boogie.Type.Bool), false));
                    equivEnsures.Add(new Ensures(false,Expr.Imp(Expr.Ident(outputGuards[i-1]),Expr.Ident(equivOutParams[i-1])))); // ensures bo_k => eq_k
                }

                // create prototype
                var refineProc = new Procedure(new Token(), RefineConsts.refinedProcNamePrefix + procName, new List<TypeVariable>(), 
                    new List<Variable>(),
                    equivOutParams,
                    new List<Requires>(),
                    new List<IdentifierExpr>(),
                    equivEnsures);
                refineProc.AddAttribute(RefineConsts.checkDepAttribute);

                var locals = new List<Variable>();

                // create input variables
                var inputs = new List<LocalVariable>();
                var inputs1 = new List<LocalVariable>();
                var inputs2 = new List<LocalVariable>();
                for (int i = 1; i <= impl.Proc.InParams.Count; i++)
                {
                    inputs.Add(new LocalVariable(Token.NoToken, new TypedIdent(Token.NoToken, RefineConsts.inputsNamePrefix + i, impl.Proc.InParams[i - 1].TypedIdent.Type)));
                    inputs1.Add(new LocalVariable(Token.NoToken, new TypedIdent(Token.NoToken, RefineConsts.inputsNamePrefix + i + "1", impl.Proc.InParams[i - 1].TypedIdent.Type)));
                    inputs2.Add(new LocalVariable(Token.NoToken, new TypedIdent(Token.NoToken, RefineConsts.inputsNamePrefix + i + "2", impl.Proc.InParams[i - 1].TypedIdent.Type)));
                }
                locals.AddRange(inputs);
                locals.AddRange(inputs1);
                locals.AddRange(inputs2);

                // create output variables
                var outputs1 = new List<LocalVariable>();
                var outputs2 = new List<LocalVariable>();
                for (int i = 1; i <= impl.Proc.OutParams.Count; i++)
                {
                    outputs1.Add(new LocalVariable(Token.NoToken, new TypedIdent(Token.NoToken, RefineConsts.outputsNamePrefix + i + "1", impl.Proc.OutParams[i - 1].TypedIdent.Type)));
                    outputs2.Add(new LocalVariable(Token.NoToken, new TypedIdent(Token.NoToken, RefineConsts.outputsNamePrefix + i + "2", impl.Proc.OutParams[i - 1].TypedIdent.Type)));
                }
                locals.AddRange(outputs1);
                locals.AddRange(outputs2);
                
                // create body
                List<Block> body = new List<Block>();
                Block bodyBlock = new Block();
                body.Add(bodyBlock);
                bodyBlock.Label = "body";

                // first side
                CreateHavocAndCall(procName, inputs, inputs1, outputs1, bodyBlock);
                // second side
                CreateHavocAndCall(procName, inputs, inputs2, outputs2, bodyBlock);

                // create assumptions
                for (int i = 0; i < impl.Proc.InParams.Count; i++)
                    bodyBlock.Cmds.Add(new AssumeCmd(new Token(),Expr.Imp(Expr.Ident(inputGuards[i]),Expr.Eq(Expr.Ident(inputs1[i]),Expr.Ident(inputs2[i]))))); // ensures bi_k => i_k_1 == i_k_2

                // create checks     
                List<AssignLhs> equivOutsLhss = new List<AssignLhs>();
                equivOutParams.Iter(o => equivOutsLhss.Add(new SimpleAssignLhs(Token.NoToken, Expr.Ident(o))));
                List<Expr> equivOutputExprs = new List<Expr>();
                for (int i = 0; i < impl.Proc.OutParams.Count; i++)
                    equivOutputExprs.Add(Expr.Eq(Expr.Ident(outputs1[i]), Expr.Ident(outputs2[i])));
                bodyBlock.Cmds.Add(new AssignCmd(new Token(), equivOutsLhss, equivOutputExprs));

                // create return
                bodyBlock.TransferCmd = new ReturnCmd(new Token());

                // create implementation
                var refineImpl = new Implementation(new Token(), RefineConsts.refinedProcNamePrefix + procName, new List<TypeVariable>(),
                    new List<Variable>(),
                    equivOutParams,
                    locals,
                    body);
                refineImpl.AddAttribute(RefineConsts.checkDepAttribute);
                refineImpl.Proc = refineProc;

                newDecls.Add(refineProc);
                newDecls.Add(refineImpl);
            }
            prog.TopLevelDeclarations.AddRange(newDecls);

            var newFilename = (filename.EndsWith(".bpl") ? filename.Substring(0,filename.Length - ".bpl".Length) : filename) + "CD.bpl";
            var tuo = new TokenTextWriter(newFilename, true);
            prog.Emit(tuo);
            tuo.Close();

            return newFilename;
        }

        private static void CreateHavocAndCall(string procName, List<LocalVariable> actualInputs, List<LocalVariable> savedInputs, List<LocalVariable> savedOutputs, Block body)
        {
            List<IdentifierExpr> hInputExprs = new List<IdentifierExpr>();
            actualInputs.Iter(i => hInputExprs.Add(Expr.Ident(i)));
            HavocCmd hc = new HavocCmd(new Token(), hInputExprs);
            body.Cmds.Add(hc);

            List<AssignLhs> aInputsLhss = new List<AssignLhs>();
            savedInputs.Iter(i => aInputsLhss.Add(new SimpleAssignLhs(Token.NoToken, Expr.Ident(i))));
            List<Expr> aInputsExprs = new List<Expr>();
            actualInputs.Iter(i => aInputsExprs.Add(Expr.Ident(i)));
            AssignCmd ac = new AssignCmd(new Token(), aInputsLhss, aInputsExprs);
            body.Cmds.Add(ac);

            List<Expr> cInputExprs = new List<Expr>();
            actualInputs.Iter(i => cInputExprs.Add(Expr.Ident(i)));
            List<IdentifierExpr> cOutputExprs = new List<IdentifierExpr>();
            savedOutputs.Iter(i => cOutputExprs.Add(Expr.Ident(i)));
            CallCmd cc = new CallCmd(new Token(), procName, cInputExprs, cOutputExprs);
            body.Cmds.Add(cc);
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
                .Where(x => QKeyValue.FindBoolAttribute(x.Attributes, "checkDependency"))
                .Iter(x => Analyze(x));

        }
        private void Analyze(Implementation impl)
        {
            var origProcName = impl.Proc.Name.Replace(RefineConsts.refinedProcNamePrefix, "");
            //get the procedure's guard constants
            inputGuardConsts = prog.TopLevelDeclarations.OfType<Constant>()
                .Where(x => x.Name.StartsWith(origProcName) && QKeyValue.FindBoolAttribute(x.Attributes, RefineConsts.inputGuradAttribute))
                .ToList();
            outputGuardConsts = prog.TopLevelDeclarations.OfType<Constant>()
                .Where(x => x.Name.StartsWith(origProcName) && QKeyValue.FindBoolAttribute(x.Attributes, RefineConsts.outputGuradAttribute))
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

            Console.WriteLine("The list of inputs in the Dependency of {0} = <{1}>",
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
