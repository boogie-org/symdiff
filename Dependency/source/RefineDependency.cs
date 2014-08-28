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
        public const string readSetGuardName = "br";
        public const string readSetGuradAttribute = "guardReadSet";

        public const string modSetGuardName = "bm";
        public const string modSetGuradAttribute = "guardModSet";

        public const string refinedProcNamePrefix = "CheckDependency_";
        public const string equivCheckVarName = "eq";
        public const string checkDepAttribute = "checkDependency";

        public const string inlineAttribute = "inline";
        public const int recursionDepth = 1; //we are using inline:spec now, so no unsoundness due to inlining

        public const string readSetNamePrefix = "r";
        public const string modSetNamePrefix = "m";
        public const string refinedProcBodyName = "body";
        public const string refineProgramNamePostfix = ".CD.bpl";
        
    }

    public static class RefineDependencyProgramCreator
    {
        ///// <summary>
        ///// This creates an entire program with CheckDependency for each procedure
        ///// It also creates the data and data+control dependencies
        ///// </summary>
        ///// <returns></returns>
        //public static Program CreateCheckDependencyProgram(string filename, Program prog)
        //{
        //    throw new NotImplementedException("This API is deprecated");

        //    #region deprecated 
        //    //prog = Utils.CrossProgramUtils.ReplicateProgram(prog, filename);

        //    //// TODO: once Utils.CrossProgramUtils.ResolveDependenciesAcrossPrograms works, depVisitor & dataDepVisitor become a parameter!
        //    //var depVisitor = new DependencyVisitor(filename,prog);
        //    //depVisitor.Visit(prog);
        //    //depVisitor.Results(true,true); // add results to logs for printing

        //    //var procDependencies = depVisitor.ProcDependencies;

        //    //// do data only analysis as well, for reference
        //    //var dataDepVisitor = new DependencyVisitor(filename, prog, true);
        //    //Analysis.DataOnly = true;
        //    //dataDepVisitor.Visit(prog);
        //    //dataDepVisitor.Results(true, true);

        //    ////make any asserts/requires/ensures free on the entire program (as procedures get inlined)
        //    //prog.TopLevelDeclarations.OfType<Procedure>().Iter
        //    //    (proc =>
        //    //    {
        //    //        proc.Requires = proc.Requires.Select(x => new Requires(true, x.Condition)).ToList();
        //    //        proc.Ensures = proc.Ensures.Select(x => new Ensures(true, x.Condition)).ToList();
        //    //    });
        //    //(new Utils.RemoveAsserts()).Visit(prog);

        //    //Declaration[] decls = new Declaration[prog.TopLevelDeclarations.Count];
        //    //prog.TopLevelDeclarations.CopyTo(decls);
        //    //decls.Where(i => i is Implementation).Iter(i => CreateCheckDependencyImpl(procDependencies, null, i as Implementation, prog));

        //    //ModSetCollector c = new ModSetCollector();
        //    //c.DoModSetAnalysis(prog);

        //    //prog.Resolve();
        //    //prog.Typecheck();

        //    //var tuo = new TokenTextWriter("tmp.bpl", true);
        //    //prog.Emit(tuo);
        //    //tuo.Close();

        //    //return prog;
        //    #endregion
        //}

        /// <summary>
        /// Creates the CheckDependency implementation for "impl" only and adds to the program
        /// </summary>
        /// <param name="upperBoundDependencies"></param>
        /// <param name="newDecls"></param>
        /// <param name="impl"></param>
        public static Implementation CreateCheckDependencyImpl(Dictionary<Procedure, Dependencies> upperBoundDependencies, 
            Dictionary<Procedure, Dependencies>  lowerBoundDependencies,
            Implementation impl, Program program)
        {
            #region Description of created program structure
            /*
                Given P, R (=ReadSet), M (=ModSet)
                R = R \ {*}
                M = M \ {m | lowerBnd(m) has * || upperBnd[m] == lowerBnd[m]}
             
                CheckDependecy_P() return (EQ) Ensures BM => EQ {
                  Havoc R
                  R1 := R
                  M1 = call P(R)
                  Havoc R
                  R2 := R
                  M2 = call P(R)
                  Assume BR => R1 == R2
                  EQ := M1 == M2
                  Return
                }
             */
            #endregion

            var proc = impl.Proc;

            var lowerBoundDepImpl = lowerBoundDependencies[proc];
            var upperBoundDepImpl = upperBoundDependencies[proc];

            //lowerBoundDepImpl.Prune(impl);
            //we will take the read/write set from upper bound, as lower bound may not have all the read vars
            var readSet = upperBoundDepImpl.ReadSet();
            var modSet = upperBoundDepImpl.ModSet();
            readSet.RemoveAll(x => x.Name == Utils.VariableUtils.NonDetVar.Name);

            //remove all entries from modSet for which upper/lower bounds are same or lower already has a *
            modSet.RemoveAll(x =>
                {
                    //lowerbound may have a * only for stubs, since it does not understand baked in stubs such as malloc
                    if (lowerBoundDepImpl[x].Contains(Utils.VariableUtils.NonDetVar)) return true; //already has *
                    if (lowerBoundDepImpl[x].Count() != upperBoundDepImpl[x].Count()) return false;
                    return //true only if both sets are identical
                        lowerBoundDepImpl[x].All(y => upperBoundDepImpl[x].Contains(y)) &&
                        upperBoundDepImpl[x].All(y => lowerBoundDepImpl[x].Contains(y));
                }
                );

            var procName = proc.Name;

            var newDecls = new List<Declaration>();
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

            program.TopLevelDeclarations.AddRange(newDecls);

            return refineImpl;
        }

        private static Implementation CreateImplementation(Procedure proc, List<Variable> readSet, List<Variable> modSet, string procName, List<Constant> inputGuards, List<Variable> equivOutParams)
        {
            var locals = new List<Variable>();

            // create input variables
            List<Variable> actualInputs = new List<Variable>();
            for (int i = 1; i <= proc.InParams.Count; ++i)
                actualInputs.Add(new LocalVariable(Token.NoToken, new TypedIdent(Token.NoToken, RefineConsts.readSetNamePrefix + i, proc.InParams[i - 1].TypedIdent.Type)));
            locals.AddRange(actualInputs);

            // create read set recording variables
            List<Variable> recordedReadSet1, recordedReadSet2;
            CreateRecordedReadSetVars(readSet, locals, out recordedReadSet1, out recordedReadSet2);

            // create output variables
            List<Variable> actualOutputs = new List<Variable>();
            for (int i = 1; i <= proc.OutParams.Count; ++i)
                actualOutputs.Add(new LocalVariable(Token.NoToken, new TypedIdent(Token.NoToken, RefineConsts.modSetNamePrefix + i, proc.OutParams[i - 1].TypedIdent.Type)));
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
            string[] vals = {procName};
            refineImpl.AddAttribute(RefineConsts.checkDepAttribute,vals);
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
            if (equivOutputExprs.Count > 0)
                bodyBlock.Cmds.Add(new AssignCmd(new Token(), equivOutsLhss, equivOutputExprs));
        }

        private static void CreateRecordedModeSetVars(List<Variable> modSet, List<Variable> locals, out List<Variable> rms1, out List<Variable> rms2)
        {
            rms1 = new List<Variable>();
            rms2 = new List<Variable>();
            for (int i = 1; i <= modSet.Count; i++)
            {
                var type = modSet[i - 1].TypedIdent.Type;
                rms1.Add(new LocalVariable(Token.NoToken, new TypedIdent(Token.NoToken, RefineConsts.modSetNamePrefix + i + "_" + "1", type)));
                rms2.Add(new LocalVariable(Token.NoToken, new TypedIdent(Token.NoToken, RefineConsts.modSetNamePrefix + i + "_" + "2", type)));
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
                rrs1.Add(new LocalVariable(Token.NoToken, new TypedIdent(Token.NoToken, RefineConsts.readSetNamePrefix + i + "_" + "1", type)));
                rrs2.Add(new LocalVariable(Token.NoToken, new TypedIdent(Token.NoToken, RefineConsts.readSetNamePrefix + i + "_" + "2", type)));
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
            string[] vals = {procName};
            refineProc.AddAttribute(RefineConsts.checkDepAttribute,vals);
            return refineProc;
        }

        private static List<Constant> CreateOutputGuards(IEnumerable<Variable> modSet, string procName)
        {
            var outputGuards = new List<Constant>();
            foreach (var m in modSet)
            {
                var og = new Constant(Token.NoToken, new TypedIdent(new Token(), procName + "_" + RefineConsts.modSetGuardName + "_" + m, Microsoft.Boogie.Type.Bool), false);
                object[] vals = { procName , Expr.Ident(m) }; /* string, expr */
                og.AddAttribute(RefineConsts.modSetGuradAttribute, vals);
                outputGuards.Add(og);
            }
            return outputGuards;
        }

        private static List<Constant> CreateInputGuards(IEnumerable<Variable> readSet, string procName)
        {
            List<Constant> inputGuards = new List<Constant>();
            foreach (var r in readSet)
            {
                var ig = new Constant(Token.NoToken, new TypedIdent(new Token(), procName + "_" + RefineConsts.readSetGuardName + "_" + r, Microsoft.Boogie.Type.Bool), false);
                object[] vals = { procName, Expr.Ident(r)}; /* string, expr */
                ig.AddAttribute(RefineConsts.readSetGuradAttribute, vals);
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

    /// <summary>
    /// All logic related to calling prover for dependency should be in this class
    /// Should be as stateless as possible
    /// </summary>
    public class RefineDependencyChecker
    {

        /// <summary>
        /// Expect the inline attributes to be setup before this call
        /// </summary>
        public static Dictionary<Procedure, Dependencies> Run(Program prog)
        {
            throw new NotImplementedException("This API is deprecated");

            //inline all the implementtions
            Utils.BoogieInlineUtils.Inline(prog);

            Dictionary<Procedure, Dependencies> result = new Dictionary<Procedure, Dependencies>();
            //create a VC
            prog.TopLevelDeclarations.OfType<Implementation>()
                .Where(x => QKeyValue.FindStringAttribute(x.Attributes, RefineConsts.checkDepAttribute) != null)
                .Iter(x => result[x.Proc] = Analyze(prog, null, x));

            return result;
        }
        public static Dependencies Analyze(Program prog, Dependencies deps, Implementation impl)
        {
            string origProcName = impl.FindStringAttribute(RefineConsts.checkDepAttribute);
            //get the procedure's guard constants
            var inputGuardConsts = prog.TopLevelDeclarations.OfType<Constant>()
                .Where(x => Utils.AttributeUtils.GetAttributeVals(x.Attributes, RefineConsts.readSetGuradAttribute).Exists(p => (p as string) == origProcName))
                .ToList();
            var outputGuardConsts = prog.TopLevelDeclarations.OfType<Constant>()
                .Where(x => Utils.AttributeUtils.GetAttributeVals(x.Attributes, RefineConsts.modSetGuradAttribute).Exists(p => (p as string) == origProcName))
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
            //Dependencies deps = new Dependencies();
            Console.WriteLine("RefinedDependency[{0}] = [", origProcName);
            outputGuardConsts.Iter(x => AnalyzeDependencyWithUnsatCore(programVC, x, deps, origProcName, inputGuardConsts, outputGuardConsts));
            Console.WriteLine("]");
            VC.FinalizeVCGen(prog);

            return deps;
        }


        private static void AnalyzeDependencyWithUnsatCore(VCExpr programVC, Constant outConstant, Dependencies result, string procName, List<Constant> inputGuardConsts, List<Constant> outputGuardConsts)
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

            //TODO: Really really ugly way to get to the Variable in the guardOutput
            var vexpr = (Expr)Utils.AttributeUtils.GetAttributeVals(outConstant.Attributes, RefineConsts.modSetGuradAttribute)[1];
            var vident = vexpr as IdentifierExpr;
            if (vident == null)
                throw new Exception(string.Format("Illegal variable expression {0} in {1} attribute", vexpr, RefineConsts.modSetGuardName));
            var v = vident.Decl;

            //check for validity (presence of all input eq implies output is equal)
            var outcome = VC.VerifyVC("RefineDependency", VC.exprGen.Implies(preInp, newVC), out cexs);
            Console.Write("-");
            if (outcome == ProverInterface.Outcome.Invalid)
            {
                Console.WriteLine("\t VC not valid, returning");
                result[v].Add(Utils.VariableUtils.NonDetVar);
                Console.WriteLine("\t Dependency of {0} =  <{1}>", v, string.Join(",", result[v]));
                return;
            }
            if (outcome == ProverInterface.Outcome.OutOfMemory || 
                outcome == ProverInterface.Outcome.TimeOut ||
                outcome == ProverInterface.Outcome.Undetermined)
            {
                Console.WriteLine("\t VC inconclusive, returning");
                result[v].Add(Utils.VariableUtils.NonDetVar);
                Console.WriteLine("\t Dependency of {0} =  <{1}>", v, string.Join(",", result[v]));
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
            Console.Write("+");
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
            if (!Analysis.noMinUnsatCore)
            {
                core0
                    .Iter(b =>
                    {
                        core.Remove(b);
                        preInp = core.Aggregate(VCExpressionGenerator.True, (x, y) => VC.exprGen.And(x, y));
                        outcome = VC.VerifyVC("RefineDependency", VC.exprGen.Implies(preInp, newVC), out cexs);
                        Console.Write(".");
                        if (outcome != ProverInterface.Outcome.Valid)
                        {
                            core.Add(b);
                            return;
                        }
                    });
            }
            //We are about to refine the dependency of v, so we start with the empty set
            result[v] = new HashSet<Variable>();
            //TODO: THIS HAS TO GO AWAY with proper variables!!!
            foreach (var ig in inputGuardConsts)
            {
                if (core.Contains(VC.translator.LookupVariable(ig)))
                {
                    IdentifierExpr iexpr = (IdentifierExpr)Utils.AttributeUtils.GetAttributeVals(ig.Attributes, RefineConsts.readSetGuradAttribute)[1];
                    result[v].Add(iexpr.Decl);
                }
            }
            Console.WriteLine("\t Dependency of {0} = <{1}>",
                v,
                string.Join(",", result[v]));

            
        }
    }

    public class RefineDependencyPerImplementation
    {

        Program prog;
        Implementation impl;
        Dictionary<Procedure, Dependencies> upperBoundDependencies;
        Dictionary<Procedure, Dependencies> lowerBoundDependencies;
        int stackBound;
        Graph<Procedure> callGraph;

        public RefineDependencyPerImplementation(Program prog, Implementation impl,
            Dictionary<Procedure, Dependencies> upperBoundDeps, // Dependencies inherits from Dictionary<Variable, HashSet<Variable>>
            Dictionary<Procedure, Dependencies> lowerBoundDeps,
            int stackBound,
            Graph<Procedure> callGraph)
        {
            this.prog = prog;
            this.impl = impl;
            this.upperBoundDependencies = upperBoundDeps;
            this.lowerBoundDependencies = lowerBoundDeps;
            this.stackBound = stackBound;
            this.callGraph = callGraph;

            // complete the missing variables in the dependencies
            //var bd = Utils.DependenciesUtils.BaseDependencies(prog);
            //Utils.DependenciesUtils.JoinProcDependencies(currDependencies, bd);
            //Utils.DependenciesUtils.JoinProcDependencies(dataDependencies, bd);

        }

        // returns the refined dependencies for the implementation
        public Dictionary<Procedure, Dependencies> Run()
        {
            //check if ANY of the output has scope for refinement
            // TODO: move this to before the program even gets replicated!
            var dependUpperBnd = upperBoundDependencies[impl.Proc];

            Console.WriteLine("\n-------Procedure {0}--------\n", impl.Proc.Name);
            Console.WriteLine("Lower bound dependency = {0}", lowerBoundDependencies[impl.Proc]);
            Console.WriteLine("Upper bound dependency = {0}", upperBoundDependencies[impl.Proc]);

            var dependLowerBnd = lowerBoundDependencies[impl.Proc];
            //at least one output variable without * has a non-empty upper\lower bound
            var potential = dependUpperBnd.Keys.Where(x =>
                !dependLowerBnd[x].Contains(Utils.VariableUtils.NonDetVar) &&
                 dependUpperBnd[x].Count() > dependLowerBnd[x].Count())
                 .Count();
            if (potential == 0) return lowerBoundDependencies;

            var refineImpl = RefineDependencyProgramCreator.CreateCheckDependencyImpl(upperBoundDependencies, lowerBoundDependencies, impl, prog);
            ModSetCollector c = new ModSetCollector();
            c.DoModSetAnalysis(prog);

            //add callee ensures to procedure
            Declaration[] decls = new Declaration[prog.TopLevelDeclarations.Count];
            prog.TopLevelDeclarations.CopyTo(decls); // a copy is needed since AddCalleeDependencySpecs changes prog.TopLevelDeclarations
            decls.OfType<Procedure>().Iter(p =>
                { 
                    if (lowerBoundDependencies.ContainsKey(p)) //the CheckDependency does not have currDependencies
                        AddCalleeDependencySpecs(p, lowerBoundDependencies[p]); 
                });
            //setup inline attributes for inline upto depth k
            callGraph.AddEdge(refineImpl.Proc, impl.Proc);
            Utils.BoogieInlineUtils.InlineUptoDepth(prog, refineImpl, stackBound, RefineConsts.recursionDepth, callGraph);

            //inline all the implementations before calling Analyze
            CommandLineOptions.Clo.ProcedureInlining = CommandLineOptions.Inlining.Spec; //inline and then use spec, no unsoundness
            Utils.BoogieInlineUtils.Inline(prog);

            Utils.PrintProgram(prog, impl.Name + "_checkdep.bpl");

            var newDepImpl = RefineDependencyChecker.Analyze(prog, lowerBoundDependencies[impl.Proc], refineImpl);

            lowerBoundDependencies[impl.Proc] = newDepImpl; //update the dependecy for impl only
            return lowerBoundDependencies;
        }
        
        private void AddCalleeDependencySpecs(Procedure p, Dependencies dep)
        {
            //return;
            foreach(Variable o in dep.Keys)
            {
                if (o is LocalVariable) continue; //the dependency contains locals
                //var oDeps = dep[o].Select(x => (Variable) new Formal(Token.NoToken, x.TypedIdent, false)).ToList();
                if (dep[o].Where(x => x.Name == Utils.VariableUtils.NonDetVar.Name).Count() != 0) continue;
                var fnName = "FunctionOf__" + p.Name + "_" + o.Name;
                Function oFunc = Utils.DeclUtils.MkOrGetFunc(prog, fnName, o.TypedIdent.Type, dep[o].Select(x => x.TypedIdent.Type).ToList());
                var fExpr = Utils.DeclUtils.MkFuncApp(oFunc, dep[o].Select(x => (Expr) Expr.Ident(x)).ToList());
                var ens = Expr.Eq(Expr.Ident(o), 
                    new OldExpr(Token.NoToken, fExpr));
                p.Ensures.Add(new Ensures(true, ens));
            }
        }


    }

    
  


}
