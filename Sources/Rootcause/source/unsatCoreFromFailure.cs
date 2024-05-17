using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.IO;
using System.Diagnostics;
using Microsoft.Boogie;
using Microsoft.Boogie.VCExprAST;
using VC;
using Microsoft.BaseTypes;
using BType = Microsoft.Boogie.Type;

namespace Rootcause
{
    class UnsatCoreFromFailure
    {
        static Program prog;
        static Implementation impl;


        static private List<Constant> assertConsts;
        static private Dictionary<BType, Dictionary<string, Constant>> modelConsts;
        static private List<Constant> predConsts;
        static private Dictionary<string, PredStmt> preds2Stmt;


        internal static void PerformRootcauseTrial(Program program, Implementation implementation)
        {
            prog = program;
            impl = implementation;

            MakeStmtPredicated mkPred = MakePredicatedProgram(impl); //updates predConsts

            /*  guard the assertion */
            GuardAndAddTrueAssertions(impl); //updates assertConsts (has to come after AddDummyAssertsAtReturn to see the new asserts)
            Utils.PrintProg(prog);

            prog.Resolve();
            prog.Typecheck();

            VC.InitializeVCGen(prog);

            /* Generate the program VC once and for all */
            VCExpr progVC = VC.GenerateVC(prog, impl);

            List<Counterexample> cex;
            VCExpr modelExpr;

            modelExpr = GetModelExprForVC(impl, progVC, true, mkPred, out cex);
            if (modelExpr == null) return;
            Console.WriteLine("Cex: {0}", modelExpr);

            //I HAVE THE FAILING TEST CASE NOW
            Console.WriteLine("\nPhase 1 COMPLETE\n");

            //setting up the maxsat
            var flipAssertConstraint = FlipAssertion(cex);
            //make all predicates true (replicated inside GetModelExpr)
            var constr1 = predConsts.ConvertAll<VCExpr>(x => VC.translator.LookupVariable(x)).Aggregate<VCExpr, VCExpr>(
                VCExpressionGenerator.True, (VCExpr a, VCExpr b) => VC.exprGen.And(a, b));
            var trueAssertions = assertConsts.ConvertAll<VCExpr>(x => VC.translator.LookupVariable(x)).Aggregate<VCExpr, VCExpr>(
                VCExpressionGenerator.True, (VCExpr a, VCExpr b) => VC.exprGen.And(a, b));
            var outcome = VC.VerifyVC(impl.Name, VC.exprGen.Implies(VC.exprGen.And(VC.exprGen.And(constr1, modelExpr), flipAssertConstraint), progVC), out cex);
            //This is doing (b1 & ... & bn & (VC) & cex & Not(assert)), which is Valid.
            if (outcome != ProverInterface.Outcome.Valid)
            {
                Console.WriteLine("Unable to prove that the model makes the assertion UNSAT (possible reasons non-det goto, or theorem prover incompleteness), no rootcause found");
                return;
            }

            Console.WriteLine("\nPhase 2 COMPLETE\n");

            var hard = new List<VCExpr>();
            hard.Add(VC.exprGen.And(VC.exprGen.And(VC.exprGen.Not(progVC), flipAssertConstraint), modelExpr));
            //hard.Add(VC.exprGen.And(VC.exprGen.And(progVC, trueAssertions), modelExpr)); //ROHIT's version
            //ROHIT: Want (b1 & ... & bn & VC & cex & assert), which is UNSAT.
            //Instead This is doing (b1 & ... & bn & Not(VC) & cex & Not(assert)), which is also UNSAT.
            //Question: Are the 2 things above equivalent?
            //Let's check
            //VCExpr vc1 = VC.exprGen.And(constr1, VC.exprGen.And(VC.exprGen.And(VC.exprGen.Not(progVC), flipAssertConstraint), modelExpr));
            //VCExpr vc2 = VC.exprGen.And(constr1, VC.exprGen.And(VC.exprGen.And(progVC, trueAssertions), modelExpr));
            //outcome = VC.VerifyVC("boom", VC.exprGen.And(VC.exprGen.Implies(vc1, vc2), VC.exprGen.Implies(vc2, vc1)), out cex);
            //outcome = VC.VerifyVC("boom", constr1,  out cex);


            var soft = predConsts.ConvertAll<VCExpr>(x => VC.translator.LookupVariable(x));
            hard.AddRange(soft);

            var unsat = new List<int>();
            //continue until the hard constraints are unsat as a result of moving enough soft --> hard

            cex.Clear();

            ProverInterface.Outcome t = ProverInterface.Outcome.Undetermined;
            t = VC.proverInterface.CheckAssumptions(hard, out unsat, VC.handler);
            if (t == ProverInterface.Outcome.Valid)
            {
                foreach (int x in unsat)
                {
                    if (x != 0)
                        Console.WriteLine("\t Stmt => {0}", preds2Stmt[soft[x - 1].ToString()].ToString());
                }
            }
            else
            {
                Console.WriteLine("Something weird, no rootcauses found (possible reason, use of if (!a) assert false  instead of assert (a), outcome = {0}", t);
            }
        }

        internal static void PerformRootcauseWorks(Program program, Implementation implementation)
        {
            prog = program;
            impl = implementation;

            MakeStmtPredicated mkPred = MakePredicatedProgram(impl); //updates predConsts

            /*  guard the assertion */
            GuardAndAddTrueAssertions(impl); //updates assertConsts (has to come after AddDummyAssertsAtReturn to see the new asserts)
            Utils.PrintProg(prog);

            prog.Resolve();
            prog.Typecheck();

            VC.InitializeVCGen(prog);

            /* Generate the program VC once and for all */
            VCExpr progVC = VC.GenerateVC(prog, impl);

            List<Counterexample> cex;
            VCExpr modelExpr;

            modelExpr = GetModelExprForVC(impl, progVC, true, mkPred, out cex);
            if (modelExpr == null) return;

            //setting up the maxsat
            var flipAssertConstraint = FlipAssertion(cex);
            //make all predicates true (replicated inside GetModelExpr)
            var constr1 = predConsts.ConvertAll<VCExpr>(x => VC.translator.LookupVariable(x)).Aggregate<VCExpr, VCExpr>(
                VCExpressionGenerator.True, (VCExpr a, VCExpr b) => VC.exprGen.And(a, b));
            var outcome = VC.VerifyVC(impl.Name, VC.exprGen.Implies(VC.exprGen.And(VC.exprGen.And(constr1, modelExpr), flipAssertConstraint), progVC), out cex);
            if (outcome != ProverInterface.Outcome.Valid)
            {
                Console.WriteLine("Unable to prove that the model makes the assertion UNSAT (possible reasons non-det goto, or theorem prover incompleteness), no rootcause found");
                return;
            }
            var hard = new List<VCExpr>();
            hard.Add(VC.exprGen.And(VC.exprGen.And(VC.exprGen.Not(progVC), flipAssertConstraint), modelExpr));
            var soft = predConsts.ConvertAll<VCExpr>(x => VC.translator.LookupVariable(x));
            hard.AddRange(soft);

            var unsat = new List<int>();
            //continue until the hard constraints are unsat as a result of moving enough soft --> hard

            if (Options.verbose > 0) cex.Clear();
            Utils.PrintQueryToMAXSAT(prog, hard, soft, impl);
            ProverInterface.Outcome t = ProverInterface.Outcome.Undetermined;
            t = VC.proverInterface.CheckAssumptions(hard, out unsat, VC.handler);
            if (t == ProverInterface.Outcome.Valid)
            {
                foreach (int x in unsat)
                {
                    if (x != 0)
                        Console.WriteLine("\t Stmt => {0}", preds2Stmt[soft[x - 1].ToString()].ToString());
                }
            }
            else
            {
                Console.WriteLine("Something weird, no rootcauses found (possible reason, use of if (!a) assert false  instead of assert (a), outcome = {0}", t);
            }
        }

        internal static void PerformRootcauseDoesNotWork(Program program, Implementation implementation)
        {
            prog = program;
            impl = implementation;

            MakeStmtPredicated mkPred = MakePredicatedProgram(impl); //updates predConsts
            GuardAndAddTrueAssertions(impl);

            Utils.PrintProg(prog);

            //Resolve and typecheck before performing any VC gen
            prog.Resolve();
            prog.Typecheck();

            VC.InitializeVCGen(prog);

            //eg. VC is s1 & s2 & ... & (b_assert_0 <=> (z1 = z2))
            var progVC = VC.GenerateVC(prog, impl);

            //make asserts true
            //adds clause for eg. (b_assert_0)
            VCExpr trueAssertions = assertConsts.ConvertAll<VCExpr>(x => VC.translator.LookupVariable(x)).Aggregate<VCExpr, VCExpr>(
                VCExpressionGenerator.True, (VCExpr a, VCExpr b) => VC.exprGen.And(a, b));

            VCExpr forcedConditionals = predConsts.ConvertAll<VCExpr>(x => VC.translator.LookupVariable(x)).Aggregate<VCExpr, VCExpr>(
                VCExpressionGenerator.True, (VCExpr a, VCExpr b) => VC.exprGen.And(a, b));

            //Proof query 
            VCExpr proofQuery = VC.exprGen.Implies(VC.exprGen.And(trueAssertions,forcedConditionals), progVC);

            List<Counterexample> cexs;
            //Try proving
            var outcome = VC.VerifyVC(impl.Name, proofQuery, out cexs);
            if (outcome == ProverInterface.Outcome.Valid)
            {
                Console.WriteLine("Program verified, no work for Rootcause");
                return;
            }

            Console.WriteLine("Finished phase 0");


            //Got a counterexample, parse it.
            VCExpr modelExpr = ModelToConstraint(impl, cexs); //a constraint on the params U consts\predConsts\assertConsts
            if (modelExpr == null) return;

            //print it
            Console.WriteLine("Cex: {0}", modelExpr.ToString());

            //(modelExpr & progVC & Assert) is UNSAT.
            proofQuery = VC.exprGen.And(modelExpr, VC.exprGen.And(forcedConditionals, VC.exprGen.And(trueAssertions, progVC)));
            cexs.Clear();
            outcome = VC.VerifyVC(impl.Name, proofQuery, out cexs);
            if (outcome != ProverInterface.Outcome.Valid)
            {
                Console.WriteLine("Warning, this should be unsat. Exiting...");
                return;
            }

            Console.WriteLine("Finished phase 1");


            //Compute its UNSAT cores.

            var hardConstraints = new List<VCExpr>();
            hardConstraints.Add(VC.exprGen.And(modelExpr, VC.exprGen.And(trueAssertions, progVC)));
            hardConstraints.AddRange(predConsts.ConvertAll<VCExpr>(x => VC.translator.LookupVariable(x)));
            var unsat = new List<int>();
            ProverInterface.Outcome t = ProverInterface.Outcome.Undetermined;
            if ((t = VC.proverInterface.CheckAssumptions(hardConstraints, out unsat, VC.handler)) == ProverInterface.Outcome.Valid)
            {

                Console.WriteLine("Finished phase 2a");
                foreach (var u in unsat) { Console.WriteLine(u); }
            }
            else
            {
                Console.WriteLine("Finished phase 2b");
            }

            Console.WriteLine(outcome);
        }

        class DummyVisitor : StandardVisitor
        {
            public override List<Cmd> VisitCmdSeq(List<Cmd> cmdSeq)
            {
                return base.VisitCmdSeq(cmdSeq);
            }
        }

        # region Determine the partition between two sides
        /// <summary>
        /// Determines if the impl consists of a left and right and if the final check is for equivalence
        /// </summary>
        /// <param name="impl"></param>
        /// <returns></returns>
        private static bool DetermineTwoProcedures(Implementation impl, out int partition)
        {
            //HACK: leverage that symdiff adds the line "    goto AA_INSTR_EQ_BODY$1;"
            //TODO: Add it as a user specified parameter, or take the two BPL files that led to the EQ_x_y_out.bpl
            var f = new FindParitionVisitor();
            f.Visit(impl);
            partition = f.partition;
            return partition != -1;
        }
        private class FindParitionVisitor : StandardVisitor
        {
            public int partition = -1;
            public override GotoCmd VisitGotoCmd(GotoCmd node)
            {
                var label = node.labelNames;
                if (label != null && label.Count == 1 && label[0].Contains("AA_INSTR_EQ_BODY$1"))
                    partition = node.Line;
                return base.VisitGotoCmd(node);
            }
        }
        #endregion

        private static VCExpr FlipAssertion(List<Counterexample> cex)
        {
            //HACK for single assertion --- generalize
            //Utils.Assert(assertConsts.Count == 1, "Expecting only 1 assertion in the program");
            //return VC.exprGen.Not(VC.translator.LookupVariable(assertConsts[0]));
            return assertConsts.Aggregate(VCExpressionGenerator.True, (x, y) => VC.exprGen.And(x, VC.exprGen.Not(VC.translator.LookupVariable(y))));
        }

        #region Making program predicated
        private static MakeStmtPredicated MakePredicatedProgram(Implementation impl)
        {
            predConsts = new List<Constant>();
            preds2Stmt = new Dictionary<string, PredStmt>();
            //TODO: make the program predicated
            //HACK: assume deterministic program
            //HACK: assume call-free program
            //assume e --> assume b ==> e
            //assert e --> assert b ==> e
            //x := e   --> x := ite(b, x, e)
            var rewriter = new MakeStmtPredicated();
            rewriter.Visit(impl);
            return rewriter;
        }
        class PredStmt
        {
            public string nodeString;
            public Tuple<string, BigNum> sourceLoc;
            public PredStmt(Cmd node)
            {
                if (node != null)
                {
                    nodeString = "boogiefile(\"" + node.tok.filename + "\", " + node.tok.line + ") " + node;
                }
            }
            public override string ToString()
            {
                string sourceString = (sourceLoc == null) ? ((nodeString == null) ? "end" : "") :
                    "sourcefile(\"" + sourceLoc.Item1 + "\", " + sourceLoc.Item2 + ") ";
                return sourceString + nodeString;
            }
        }
        class MakeStmtPredicated : StandardVisitor
        {
            static int havocCount = 0;
            List<PredStmt> recentPredStmts = new List<PredStmt>();
            bool predOn = Options.predFuns.Count == 0;
            internal List<Variable> assumePenalizers = new List<Variable>();
            Constant recentConstant = null;

            public static Constant CreateNewPredConst()
            {
                var a = new Constant(Token.NoToken, new TypedIdent(Token.NoToken, "_bpred_" + predConsts.Count.ToString(), BType.Bool), false);
                prog.AddTopLevelDeclaration(a);
                predConsts.Add(a);
                return a;
            }
            public Constant CreatePred(Cmd cmd)
            {
                if (!Options.groupStatementsTogether || recentConstant == null)
                {
                    recentConstant = CreateNewPredConst();
                    PredStmt predStmt = new PredStmt(Options.groupStatementsTogether ? null : cmd);
                    preds2Stmt[recentConstant.ToString()] = predStmt;
                    recentPredStmts.Add(predStmt);
                }
                return recentConstant;
            }
            public override Cmd VisitAssertCmd(AssertCmd node)
            {
                //var a = CreateNewPredConst();
                //node.Expr = Expr.Imp(IdentifierExpr.Ident(a), node.Expr);
                Tuple<string, BigNum> sourceLoc = ReadSourceAssert(node);
                if (sourceLoc != null)
                {
                    if (sourceLoc.Item1 == ":pred_on") predOn = Options.predFuns.Count == 0;
                    else if (sourceLoc.Item1 == ":pred_off") predOn = false;
                    else recentPredStmts.ForEach(p => p.sourceLoc = sourceLoc);
                    recentPredStmts.Clear();
                    if (Options.groupStatementsTogether)
                    {
                        recentConstant = null;
                    }
                    return node;
                }
                return base.VisitAssertCmd(node);
            }
            public override Cmd VisitAssumeCmd(AssumeCmd node)
            {
                if (predOn && Options.penalizeAssumes)
                {
                    var a = CreatePred(node);
                    IdentifierExpr c = (IdentifierExpr)CreateHavocConst(node.tok, "assume", BType.Bool);
                    assumePenalizers.Add(c.Decl);
                    node.Expr = Expr.Imp(IdentifierExpr.Ident(a), Expr.And(node.Expr, c));
                }
                else if (predOn && Options.predicateAssumes)
                {
                    var a = CreatePred(node);
                    node.Expr = Expr.Imp(IdentifierExpr.Ident(a), node.Expr);
                }
                return base.VisitAssumeCmd(node);
            }
            public override Cmd VisitAssignCmd(AssignCmd node)
            {
                if (predOn || node.Rhss.Where(ContainsPredFun).Count() > 0)
                {
                    var a = CreatePred(node);
                    Utils.Assert(node.Lhss.Count() == node.Rhss.Count(), "#lhs == #rhs");
                    for (int i = 0; i < node.Lhss.Count(); ++i)
                    {
                        var t = node.Rhss[i];
                        Expr lhs = node.Lhss[i].AsExpr;
                        IdentifierExpr lhsId = lhs as IdentifierExpr;
                        node.Rhss[i] = (lhsId != null && lhsId.Name.EndsWith("#NO_PRED")) ? node.Rhss[i] :
                            new NAryExpr(Token.NoToken, new IfThenElse(Token.NoToken),
                                new List<Expr>(){Expr.Not(IdentifierExpr.Ident(a)), Options.blurStatments ? CreateHavocConst(lhs) : lhs, node.Rhss[i]});
                    }
                }
                return base.VisitAssignCmd(node);
            }
            public override Cmd VisitHavocCmd(HavocCmd node)
            {
                if (predOn)
                {
                    // havoc x;
                    //   ==>
                    // const @havoc@...@x:...;
                    // ...
                    // x := if !a then x else @havoc@...@x; // if blurStatements = false
                    //      @havoc@...@x;                   //otherwise

                    var a = CreatePred(node);
                    IToken tok = node.tok;
                    List<AssignLhs> lhss = new List<AssignLhs>();
                    List<Expr> rhss = new List<Expr>();
                    foreach (IdentifierExpr iExpr in node.Vars)
                    {
                        lhss.Add(new SimpleAssignLhs(tok, iExpr));
                        if (Options.blurStatments)
                        {
                            rhss.Add(CreateHavocConst(iExpr));
                        }
                        else
                            rhss.Add(new NAryExpr(tok, new IfThenElse(tok),
                                     new List<Expr>(){Expr.Not(IdentifierExpr.Ident(a)), iExpr, CreateHavocConst(iExpr)}));
                    }
                    return new AssignCmd(tok, lhss, rhss);
                }
                return base.VisitHavocCmd(node);
            }
            public override List<Cmd> VisitCmdSeq(List<Cmd> cmdSeq)
            {
                var newCmdSeq = new List<Cmd>();
                foreach (var cmd in cmdSeq)
                {
                    newCmdSeq.Add(cmd);
                    var callcmd = cmd as CallCmd;
                    if (callcmd == null) continue;
                    //add an assign command
                    var lhss = new List<AssignLhs>();
                    var rhss = new List<Expr>();
                    foreach (var v in callcmd.Outs)
                    {
                        lhss.Add(new SimpleAssignLhs(Token.NoToken, v));
                        rhss.Add(CreateHavocConst(v as Expr));
                    }
                    var token = new Token(callcmd.Line, callcmd.Col);
                    token.filename = callcmd.tok.filename;
                    var assignCmd = new AssignCmd(token, lhss, rhss);
                    //Add more context to the stmt (line #, etc.)
                    newCmdSeq.Add(assignCmd);
                }

                return base.VisitCmdSeq(newCmdSeq);
            }
            class PredFunVisitor : StandardVisitor
            {
                internal bool containsPredFun = false;
                public override Expr VisitNAryExpr(NAryExpr node)
                {
                    FunctionCall f = node.Fun as FunctionCall;
                    containsPredFun = containsPredFun || (f != null && Options.predFuns.Contains(f.FunctionName));
                    return base.VisitNAryExpr(node);
                }
            }
            bool ContainsPredFun(Expr e)
            {
                PredFunVisitor visitor = new PredFunVisitor();
                visitor.Visit(e);
                return visitor.containsPredFun;
            }
            Expr CreateHavocConst(Expr e)
            {
                IdentifierExpr iExpr = e as IdentifierExpr;
                return CreateHavocConst(e.tok, (iExpr == null) ? "" : iExpr.Name, e.Type);
            }
            Expr CreateHavocConst(IToken tok, string name, BType t)
            {
                if (Options.matchPairs && t == Datatypes.dtSetType)
                    return MakeUninterpreted.Single(MakeUninterpreted.Call(tok, Datatypes.havocConstructor, new Expr[0]));
                name = "_havoc#" + checked(havocCount++) + "#" + name;
                TypedIdent typedIdent = new TypedIdent(tok, name, t);
                Constant constant = new Constant(tok, typedIdent, false);
                IdentifierExpr hExpr = new IdentifierExpr(tok, constant);
                prog.AddTopLevelDeclaration(constant);
                return hExpr;
            }
        }
        #endregion 


        #region Make Asserts Guarded
        private static Tuple<string, BigNum> ReadSourceAssert(AssertCmd node)
        {
            LiteralExpr literal = node.Expr as LiteralExpr;
            if (literal != null && literal.Val.Equals(true))
            {
                string sourceFile = null;
                BigNum? sourceLine = null;
                for (QKeyValue kv = node.Attributes; kv != null; kv = kv.Next)
                {
                    if (kv.Params.Count == 0)
                    {
                        if (kv.Key == "pred_off" || kv.Key == "pred_on")
                        {
                            return Tuple.Create(":" + kv.Key, BigNum.ZERO);
                        }
                    }
                    if (kv.Params.Count == 1)
                    {
                        string pString = kv.Params[0] as string;
                        LiteralExpr pLiteral = kv.Params[0] as LiteralExpr;
                        if (kv.Key == "sourcefile" && pString != null)
                        {
                            sourceFile = pString;
                        }
                        else if (kv.Key == "sourceline" && pLiteral != null && pLiteral.isBigNum)
                        {
                            sourceLine = pLiteral.asBigNum;
                        }
                    }
                }
                if (sourceFile != null && sourceLine != null)
                {
                    return Tuple.Create(sourceFile, (BigNum)sourceLine);
                }
            }
            return null;
        }
        private static void GuardAndAddTrueAssertions(Implementation impl)
        {
            assertConsts = new List<Constant>();
            var assertGuarded = new MakeAssertsGuarded();
            assertGuarded.Visit(impl);
        }
        private class MakeAssertsGuarded : StandardVisitor
        { //change any assert(a) --> assert(assertConst <==> a)
            private static Expr RewriteAssertCmd(Expr expr)
            {
                var tmp = expr;
                var a = new Constant(Token.NoToken, new TypedIdent(Token.NoToken, "_bassert_" + assertConsts.Count.ToString(), BType.Bool), false);
                prog.AddTopLevelDeclaration(a);
                assertConsts.Add(a);
                ////detect more than 1 assertion
                //if (assertConsts.Count > 1)
                //    throw new Exception("Expecting only 1 assertion in a procedure for now");
                // only transform the assertion A with _bassert_ => A if the assertion has not already been transformed
                var freeVars = new GSet<Object>();
                expr.ComputeFreeVariables(freeVars);
                var inter = freeVars.Intersect(assertConsts);
                if (inter.ToList().Count == 0) //avoid making guarded asserts guarded again
                    tmp = Expr.Iff(IdentifierExpr.Ident(a), expr);
                return tmp;
            }
            public override Cmd VisitAssertCmd(AssertCmd node)
            {
                if (ReadSourceAssert(node) != null)
                {
                    return node;
                }
                node.Expr = RewriteAssertCmd(node.Expr);
                return base.VisitAssertCmd(node);
            }
            public override Ensures VisitEnsures(Ensures ensures)
            {
                ensures.Condition = RewriteAssertCmd(ensures.Condition);
                return base.VisitEnsures(ensures);
            }
        }
        #endregion


        #region Utilities for models
        private static VCExpr ModelToConstraint(Implementation impl, List<Counterexample> cexs, List<Variable> assumePenalizers)
        {
            VCExpr ret = VCExpressionGenerator.True;
            Utils.Assert(cexs.Count > 0, "Expecting a non-empty list of counterexamples");
            var cex = cexs[0];
            var model = cex.Model;
            modelConsts = new Dictionary<BType, Dictionary<string, Constant>>();
            assumePenalizers = new List<Variable>(assumePenalizers);

            var inputs = new List<Variable>();
            //gather inputs, constants and globals
            foreach (Variable v in impl.InParams) inputs.Add(v);
            inputs.AddRange(prog.TopLevelDeclarations.Where(x => x is Constant).Cast<Variable>()
                .Where(x => !assertConsts.Contains(x) && !predConsts.Contains(x))); //constants
            inputs.AddRange(prog.GlobalVariables); //globals
            //it is not true that all the values are present as assignment of inputs/consts/globals/localvars,
            //some output of functions such as select don't appear in locvars
            //foreach (Variable v in impl.LocVars) inputs.Add(v); //incarnation variables h@1, h@3, ..
            var vars = inputs.Concat(impl.LocVars.Cast<Variable>()).ToList();

            //list of map types in the program
            List<BType> mapTypes = vars.FindAll(x => x.TypedIdent.Type.IsMap).ConvertAll(x => x.TypedIdent.Type);
            if (Options.verbose == 2) Console.WriteLine("List of map types = {0}", String.Join(",", mapTypes));

            if (Options.verbose == 2) Console.WriteLine("Inputs = {0}", String.Join(", ", inputs.ConvertAll<string>(x => x.Name)));
            foreach (var func in model.Functions)
            {
                if (Options.verbose == 2) Console.WriteLine("Function = {0}", func.Name);
                //look for inputs
                //var s = inputs.FindAll(x => x.Name == func.Name);
                var s = inputs.FindAll(x => x.Name == func.Name);
                if (s.Count > 0)
                {
                    var v = s[0];
                    foreach (var a in func.Apps) //should only go once
                    {
                        Utils.Assert(a.Args.Count() == 0, "#of args to input function is 0");
                        if (Options.verbose == 2) Console.WriteLine("\t Result = {0}, {1}", a.Result, a.Result.Kind);
                        assumePenalizers.RemoveAll(x => x.Name == v.Name);
                        ret = VC.exprGen.And(ret,
                            VC.exprGen.Eq(VC.translator.LookupVariable(v),
                            ModelElementToVCExpr(v.TypedIdent.Type, a.Result)));
                    }
                    continue;
                }
                //look for functions
                var fns = prog.TopLevelDeclarations.Where(x => x is Function).Cast<Function>().Where(x => x.Name == func.Name);
                if (fns.Count() > 0)
                {
                    var v = fns.First();
                    ret = VC.exprGen.And(ret, FuncModelToVCExpr(func, v));
                    continue;
                }
                if (func.Name.Contains("Select_"))
                {
                    if (Options.verbose == 2) Console.WriteLine("Processing select function {0}", func.Name);
                    ret = VC.exprGen.And(ret, FuncModelToVCExpr(func, MkSelectFunc(func, mapTypes)));
                }
                if (func.Name.Contains("Store_"))
                {
                    if (Options.verbose == 2) Console.WriteLine("Processing store function {0}", func.Name);
                    ret = VC.exprGen.And(ret, FuncModelToVCExpr(func, MkStoreFunc(func, mapTypes)));
                }
            }
            //set remaining assumePenalizers to false, to penalize paths that weren't previously taken
            foreach (Variable v in assumePenalizers)
            {
                ret = VC.exprGen.And(ret,
                    VC.exprGen.Eq(VC.translator.LookupVariable(v),
                    ModelElementToVCExpr(BType.Bool, model.False)));
            }
            ret = VC.exprGen.And(ret, GenerateDistinctAssumptions(modelConsts));
            if (Options.verbose == 2) Console.WriteLine("ModelExpr = {0}", ret);
            return ret;
        }
        private static VCExpr ModelToConstraint(Implementation impl, List<Counterexample> cexs)
        {
            VCExpr ret = VCExpressionGenerator.True;
            Utils.Assert(cexs.Count > 0, "Expecting a non-empty list of counterexamples");
            var cex = cexs[0];
            var model = cex.Model;
            modelConsts = new Dictionary<BType, Dictionary<string, Constant>>();
            //assumePenalizers = new List<Variable>(assumePenalizers); ROHIT

            var inputs = new List<Variable>();
            //gather inputs, constants and globals
            foreach (Variable v in impl.InParams) inputs.Add(v);
            inputs.AddRange(prog.TopLevelDeclarations.Where(x => x is Constant).Cast<Variable>()
                .Where(x => !assertConsts.Contains(x) && !predConsts.Contains(x))); //constants
            inputs.AddRange(prog.GlobalVariables); //globals
            //it is not true that all the values are present as assignment of inputs/consts/globals/localvars,
            //some output of functions such as select don't appear in locvars
            //foreach (Variable v in impl.LocVars) inputs.Add(v); //incarnation variables h@1, h@3, ..
            var vars = inputs.Concat(impl.LocVars.Cast<Variable>()).ToList();

            //list of map types in the program
            List<BType> mapTypes = vars.FindAll(x => x.TypedIdent.Type.IsMap).ConvertAll(x => x.TypedIdent.Type);
            if (Options.verbose == 2) Console.WriteLine("List of map types = {0}", String.Join(",", mapTypes));

            if (Options.verbose == 2) Console.WriteLine("Inputs = {0}", String.Join(", ", inputs.ConvertAll<string>(x => x.Name)));
            foreach (var func in model.Functions)
            {
                if (Options.verbose == 2) Console.WriteLine("Function = {0}", func.Name);
                //look for inputs
                //var s = inputs.FindAll(x => x.Name == func.Name);
                var s = inputs.FindAll(x => x.Name == func.Name);
                if (s.Count > 0)
                {
                    var v = s[0];
                    foreach (var a in func.Apps) //should only go once
                    {
                        Utils.Assert(a.Args.Count() == 0, "#of args to input function is 0");
                        if (Options.verbose == 2) Console.WriteLine("\t Result = {0}, {1}", a.Result, a.Result.Kind);
                        //assumePenalizers.RemoveAll(x => x.Name == v.Name); ROHIT
                        ret = VC.exprGen.And(ret,
                            VC.exprGen.Eq(VC.translator.LookupVariable(v),
                            ModelElementToVCExpr(v.TypedIdent.Type, a.Result)));
                    }
                    continue;
                }
                //look for functions
                var fns = prog.TopLevelDeclarations.Where(x => x is Function).Cast<Function>().Where(x => x.Name == func.Name);
                if (fns.Count() > 0)
                {
                    var v = fns.First();
                    ret = VC.exprGen.And(ret, FuncModelToVCExpr(func, v));
                    continue;
                }
                if (func.Name.Contains("Select_"))
                {
                    if (Options.verbose == 2) Console.WriteLine("Processing select function {0}", func.Name);
                    ret = VC.exprGen.And(ret, FuncModelToVCExpr(func, MkSelectFunc(func, mapTypes)));
                }
                if (func.Name.Contains("Store_"))
                {
                    if (Options.verbose == 2) Console.WriteLine("Processing store function {0}", func.Name);
                    ret = VC.exprGen.And(ret, FuncModelToVCExpr(func, MkStoreFunc(func, mapTypes)));
                }
            }
            //set remaining assumePenalizers to false, to penalize paths that weren't previously taken
            /* ROHIT
            foreach (Variable v in assumePenalizers)
            {
                ret = VC.exprGen.And(ret,
                    VC.exprGen.Eq(VC.translator.LookupVariable(v),
                    ModelElementToVCExpr(BType.Bool, model.False)));
            }
             * */
            ret = VC.exprGen.And(ret, GenerateDistinctAssumptions(modelConsts));
            if (Options.verbose == 2) Console.WriteLine("ModelExpr = {0}", ret);
            return ret;
        }
        private static Function MkStoreFunc(Model.Func func, List<BType> mapTypes)
        {
            var funcTypeStr = func.Name.Substring("Store_".Length).Replace("$", "");
            var tpL = mapTypes.FindAll(x => x.ToString() == funcTypeStr);
            if (tpL.Count == 0)
                throw new Exception("Store does not correspond to any type in the program" + func.ToString());
            var tp = tpL[0];
            //store(mapType, arg1, .. argk, result):mapType function and a store
            var vs = new List<Variable>();
            vs.Add(new Formal(Token.NoToken, new TypedIdent(Token.NoToken, "m_", tp), true));
            int i = 0;
            foreach (BType a in tp.AsMap.Arguments)
            {
                vs.Add(new Formal(Token.NoToken, new TypedIdent(Token.NoToken, "s_" + (i++).ToString(), a), true));
            }
            vs.Add(
                new Formal(Token.NoToken, new TypedIdent(Token.NoToken, "val", tp.AsMap.Result), true));
            var r = new Formal(Token.NoToken, new TypedIdent(Token.NoToken, "res", tp), false);
            var store = new Function(Token.NoToken, func.Name, vs, r);
            if (Options.verbose == 2) Console.WriteLine("\tCreated Store funct with {0} Types = ({1}) --> ({2})", store, String.Join(",", tp.AsMap.Arguments.ToList().ConvertAll(x => x.ToString())), tp.AsMap.Result);
            return store;
        }
        //TODO: add the Select/Store functions to the list
        //foreach variable of type map:[t1,...,tk]t, create a 
        //select([t1,...tk]t, t1, ...tk):t function and a store
        //store([t1,..tk]t, t1, ...tk, t):[t1,...,tk]t
        //Is there a way to avoid the string surgery?
        private static Function MkSelectFunc(Model.Func func, List<BType> mapTypes)
        {
            var funcTypeStr = func.Name.Substring("Select_".Length).Replace("$", "");
            var tpL = mapTypes.FindAll(x => x.ToString() == funcTypeStr);
            if (tpL.Count == 0)
                throw new Exception("Select does not correspond to any type in the program" + func.ToString());
            var tp = tpL[0];
            //select(mapType, arg1, .. argk):result function and a store
            var vs = new List<Variable>();
            vs.Add(new Formal(Token.NoToken, new TypedIdent(Token.NoToken, "m_", tp), true));
            int i = 0;
            foreach (BType a in tp.AsMap.Arguments)
            {
                vs.Add(new Formal(Token.NoToken, new TypedIdent(Token.NoToken, "s_" + (i++).ToString(), a), true));
            }
            var r = new Formal(Token.NoToken, new TypedIdent(Token.NoToken, "res", tp.AsMap.Result), false);
            var select = new Function(Token.NoToken, func.Name, vs, r);
            if (Options.verbose == 2) Console.WriteLine("\tCreated Select funct with {0} Types = ({1}) --> ({2})", select, String.Join(",", tp.AsMap.Arguments.ToList().ConvertAll(x => x.ToString())), tp.AsMap.Result);
            return select;
        }
        private static VCExpr FuncModelToVCExpr(Model.Func func, Function v)
        {
            //Case of non-functions
            var ret = VCExpressionGenerator.True;
            foreach (var a in func.Apps)
            {
                List<VCExpr> vcArgs = new List<VCExpr>();
                int i = 0;
                foreach (var g in a.Args)
                {
                    if (Options.verbose == 2) Console.Write("\t App = {0}, {1}\t", g.ToString(), g.Kind);
                    vcArgs.Add(ModelElementToVCExpr(v.InParams[i].TypedIdent.Type, g));
                    i++;
                }
                if (Options.verbose == 2) Console.Write("\t Result = {0}, {1}", a.Result, a.Result.Kind);
                var res = ModelElementToVCExpr(v.OutParams[0].TypedIdent.Type, a.Result);
                var funcExpr = VC.exprGen.Function(v, vcArgs);
                //special case for select/update
                if (v.Name.Contains("Select_"))
                    funcExpr = VC.exprGen.Select(vcArgs.ToArray());
                else if (v.Name.Contains("Store_"))
                    funcExpr = VC.exprGen.Store(vcArgs.ToArray());
                ret = VC.exprGen.And(ret,
                    VC.exprGen.Eq(funcExpr, res));
            }
            return ret;
        }
        private static VCExpr ModelElementToVCExpr(BType tp, Model.Element g)
        {
            VCExpr n = null;
            if (tp.IsBool)
                n = VC.translator.Translate(new LiteralExpr(Token.NoToken,
                    ((Model.Boolean)g).Value));
            else if (tp.IsInt)
                n = VC.translator.Translate(new LiteralExpr(Token.NoToken,
                    Microsoft.BaseTypes.BigNum.FromInt((((Model.Integer)g).AsInt()))));
            else if (tp.IsBv)
                throw new Exception("Handling of bit-vector models not supported yet");
            else if (tp.IsReal)
                throw new Exception("Handling of real valued models not supported yet");
            else if (tp.IsMap || tp.IsCtor) // map or user defined 
            {
                var h = g as Model.DatatypeValue;
                if (h != null)
                {
                    //TODO: we should not be creating a constant with a string (__DT_int 8), rather want to create a function application
                    if (h.Arguments.Length > 0)
                        throw new Exception("Handling of datatype ctors of non-zero size is not supported yet " + tp.ToString() + " " + g.ToString());
                }
                if (!modelConsts.ContainsKey(tp)) modelConsts[tp] = new Dictionary<string, Constant>();
                Constant c;
                if (!modelConsts[tp].ContainsKey(g.ToString()))
                {
                    c = new Constant(Token.NoToken, new TypedIdent(Token.NoToken, g.ToString(), tp), true); //can't make it unique in the VC as it has already been generated
                    modelConsts[tp].Add(g.ToString(), c);
                    prog.AddTopLevelDeclaration(c);
                }
                else
                    c = modelConsts[tp][g.ToString()];
                n = VC.translator.LookupVariable(c);
            }
            else //other cases
            {
                throw new Exception("Handling of type basic/ctors/closed/variable models not supported yet " + tp.ToString() + " " + g.ToString());
            }
            if (Options.verbose == 2) Console.WriteLine("\t VCExpr = {0}", n);
            return n;
        }

        private static VCExpr GenerateDistinctAssumptions(Dictionary<BType, Dictionary<string, Constant>> modelConsts)
        {
            VCExpr ret = VCExpressionGenerator.True;
            foreach (var kv in modelConsts)
                ret = VC.exprGen.And(ret, VC.exprGen.Distinct(kv.Value.Values.ToList().ConvertAll<VCExpr>(x => VC.translator.LookupVariable(x))));
            return ret;
        }
        private static string FindSortStringFromConst(Model.Element mc)
        {
            throw new NotImplementedException();
        }
        private static VCExpr GetModelExprForVC(Implementation impl, VCExpr progVC, bool flipAssert, MakeStmtPredicated mkPred, out List<Counterexample> cex)
        {
            /* get a counterexample */
            //make all predicates true
            var constr1 = predConsts.ConvertAll<VCExpr>(x => VC.translator.LookupVariable(x)).Aggregate<VCExpr, VCExpr>(
                VCExpressionGenerator.True, (VCExpr a, VCExpr b) => VC.exprGen.And(a, b));
            //make all assertions true
            VCExpr constr2;
            if (flipAssert) //make all asserts true
                constr2 = assertConsts.ConvertAll<VCExpr>(x => VC.translator.LookupVariable(x)).Aggregate<VCExpr, VCExpr>(
                VCExpressionGenerator.True, (VCExpr a, VCExpr b) => VC.exprGen.And(a, b));
            else //make all asserts false
                constr2 = assertConsts.ConvertAll<VCExpr>(x => VC.translator.LookupVariable(x)).Aggregate<VCExpr, VCExpr>(
                VCExpressionGenerator.True, (VCExpr a, VCExpr b) => VC.exprGen.And(a, VC.exprGen.Not(b)));

            //List<Counterexample> cex;
            var outcome = VC.VerifyVC(impl.Name, VC.exprGen.Implies(VC.exprGen.And(constr1, constr2), progVC), out cex);
            if (outcome == ProverInterface.Outcome.Valid)
            {
                Console.WriteLine("Program verified, no work for Rootcause");
                return null;
            }
            /* set up the MAXSAT formulation */
            VCExpr modelExpr = ModelToConstraint(impl, cex, mkPred.assumePenalizers); //a constraint on the params U consts\predConsts\assertConsts
            return modelExpr;
        }
        #endregion

        class MakeUninterpreted : StandardVisitor
        {
            private Implementation impl;
            static Dictionary<Variable, Variable> uninterpretedVars = new Dictionary<Variable, Variable>(new VarComparer());
            static Dictionary<Variable, Variable> uninterpretedBoolVars = new Dictionary<Variable, Variable>(new VarComparer());
            internal MakeUninterpreted(Implementation impl)
            {
                this.impl = impl;
                Procedure proc = impl.Proc;
                Action<List<Variable>> a = seq => seq.Cast<Variable>().Select(MakeVars).SelectMany(x => x).ToList().ForEach(seq.Add);
                Action<List<IdentifierExpr>> m = seq => seq.Cast<IdentifierExpr>().Select(i => i.Decl).Select(MakeVars)
                    .SelectMany(x => x).Select(x => new IdentifierExpr(Token.NoToken, x)).ToList().ForEach(seq.Add);
                a(proc.InParams);
                a(impl.InParams);
                a(proc.OutParams);
                a(impl.OutParams);
                a(impl.LocVars);
                m(proc.Modifies);
            }
            class VarComparer : IEqualityComparer<Variable>
            {
                public int GetHashCode(Variable v) { return v.Name.GetHashCode(); }
                public bool Equals(Variable v1, Variable v2) { return v1 == v2; }
            }
            internal static List<Variable> MakeVars(Variable v)
            {
                return new List<Variable>(v.TypedIdent.Type.IsBool
                    ? new Variable[] { MakeVar(v, false), MakeVar(v, true) }
                    : new Variable[] { MakeVar(v, false) });
            }
            internal static Variable MakeVar(Variable v, bool boolVar)
            {
                Dictionary<Variable, Variable> table = boolVar ? uninterpretedBoolVars : uninterpretedVars;
                if (table.ContainsKey(v)) return table[v];
                Variable u = null;
                TypedIdent t = boolVar
                    ? new TypedIdent(v.tok, "__DT_pos__" + v.Name, BType.Bool)
                    : new TypedIdent(v.tok, "__DT__" + v.Name, Datatypes.dtSetType);
                Constant c = v as Constant;
                GlobalVariable g = v as GlobalVariable;
                Formal f = v as Formal;
                LocalVariable l = v as LocalVariable;
                BoundVariable b = v as BoundVariable;
                if (c != null) u = new Constant(c.tok, t, c.Unique);
                if (g != null) u = new GlobalVariable(g.tok, t);
                if (f != null) u = new Formal(f.tok, t, f.InComing);
                if (l != null) u = new LocalVariable(l.tok, t);
                if (b != null) u = new BoundVariable(b.tok, t);
                if (u == null) throw new Exception("unexpected variable: " + v);
                table.Add(v, u);
                return u;
            }
            internal static Expr MakeExpr(NAryExpr e)
            {
                IToken tok = e.tok;
                FunctionCall f = e.Fun as FunctionCall;
                IfThenElse i = e.Fun as IfThenElse;
                if (f != null && Datatypes.functionToConstructor.ContainsKey(f.FunctionName))
                {
                    var tArgs = e.Args.Cast<Expr>();
                    var dtArgs = tArgs.Select(a => Set(MakeExpr(a)));
                    // BOOGIE WORKAROUND:
                    tArgs = tArgs.Select(a => (a.Type.IsInt) ? Call(a.tok, Datatypes.intConstructor, new Expr[] { a }) :
                        (a.Type.IsBool) ? Call(a.tok, Datatypes.boolConstructor, new Expr[] { a }) : a);
                    // __DT_Single(__DT__f(...,__DT_Set(a),...))
                    return Single(Call(tok, Datatypes.functionToConstructor[f.FunctionName],
                      Options.fatDatatypes ? tArgs.Concat(dtArgs) : dtArgs));
                }
                // TODO: Args[0]?
                if (i != null) return new NAryExpr(e.tok, e.Fun, new List<Expr>(new Expr[] {
                    e.Args[0], MakeExpr(e.Args[1]), MakeExpr(e.Args[2]) }));
                if (Options.verbose == 2) Console.WriteLine("interpreted function: " + e.Fun.FunctionName);
                return MakeUnions(e.tok, e.Args.ToList(), 0);
            }
            internal static Expr MakeUnions(IToken tok, List<Expr> es, int offset)
            {
                return
                    (es.Count == 0) ? new IdentifierExpr(tok, Datatypes.emptyConstant)
                  : (offset == es.Count - 1) ? MakeExpr(es[offset])
                  : Union(MakeExpr(es[offset]), MakeUnions(tok, es, offset + 1));
            }
            internal static Expr MakeExpr(QuantifierExpr e)
            {
                return new IdentifierExpr(e.tok, Datatypes.emptyConstant);
            }
            internal static Expr MakeExpr(Expr e)
            {
                LiteralExpr l = e as LiteralExpr;
                IdentifierExpr i = e as IdentifierExpr;
                OldExpr o = e as OldExpr;
                NAryExpr n = e as NAryExpr;
                QuantifierExpr q = e as QuantifierExpr;
                if (l != null)
                {
                    // TODO: is ignoring constants the right approach?
                    //if (l.isBigNum) return Single(Call(e.tok, intConstructor, new Expr[] { l }));
                    //if (l.isBool) return Single(Call(e.tok, boolConstructor, new Expr[] { l }));
                    return new IdentifierExpr(e.tok, Datatypes.emptyConstant);
                }
                if (i != null) return new IdentifierExpr(e.tok, MakeVar(i.Decl, false));
                if (o != null) return new OldExpr(e.tok, MakeExpr(o.Expr));
                if (n != null) return MakeExpr(n);
                if (q != null) return MakeExpr(q);
                throw new Exception("unexpected expression: " + e);
            }
            internal static Expr MakeRhs(Expr e)
            {
                if (e.Type.IsBool)
                {
                    return MakeBool(e, true); // TODO: also record negative polarity?
                }
                return MakeExpr(e);
            }
            internal static Expr Set(Expr e)
            {
                return Call(e.tok, Datatypes.setFunction, new Expr[] { e });
            }
            internal static Expr Single(Expr e)
            {
                return Call(e.tok, Datatypes.singleFunction, new Expr[] { e });
            }
            internal static Expr Union(Expr e1, Expr e2)
            {
                return Call(e1.tok, Datatypes.unionFunction, new Expr[] { e1, e2 });
            }
            internal static Expr Call(IToken tok, Function f, IEnumerable<Expr> args)
            {
                return new NAryExpr(tok, new FunctionCall(f), new List<Expr>(args.ToArray()));
            }
            internal static Expr Unary(UnaryOperator.Opcode op, Expr e)
            {
                return new NAryExpr(e.tok, new UnaryOperator(e.tok, op), new List<Expr>(new Expr[] { e }));
            }
            internal static Expr Binary(BinaryOperator.Opcode op, Expr e1, Expr e2)
            {
                return new NAryExpr(e1.tok, new BinaryOperator(e1.tok, op),
                    new List<Expr>(new Expr[] { e1, e2 }));
            }
            internal static Expr MakeBool(Expr e, bool polarity = true)
            {
                IdentifierExpr i = e as IdentifierExpr;
                NAryExpr n = e as NAryExpr;
                Expr e2 = null;
                if (i != null && polarity)
                {
                    e2 = new IdentifierExpr(e.tok, MakeVar(i.Decl, true));
                }
                if (n != null)
                {
                    UnaryOperator u = n.Fun as UnaryOperator;
                    BinaryOperator b = n.Fun as BinaryOperator;
                    if (u != null && u.Op == UnaryOperator.Opcode.Not)
                    {
                        e2 = Unary(u.Op, MakeBool(n.Args[0], !polarity));
                    }
                    if (b != null)
                    {
                        switch (b.Op)
                        {
                            case BinaryOperator.Opcode.And:
                            case BinaryOperator.Opcode.Or:
                                e2 = Binary(b.Op, MakeBool(n.Args[0], polarity), MakeBool(n.Args[1], polarity));
                                break;
                            case BinaryOperator.Opcode.Imp:
                                e2 = Binary(b.Op, MakeBool(n.Args[0], !polarity), MakeBool(n.Args[1], polarity));
                                break;
                            case BinaryOperator.Opcode.Eq:
                                if (polarity) e2 = Binary(b.Op, Set(MakeExpr(n.Args[0])), Set(MakeExpr(n.Args[1])));
                                break;
                            case BinaryOperator.Opcode.Neq:
                                if (!polarity) e2 = Binary(b.Op, Set(MakeExpr(n.Args[0])), Set(MakeExpr(n.Args[1])));
                                break;
                        }
                    }
                }
                if (e2 != null) return Binary(BinaryOperator.Opcode.And, e, e2);
                return e;
            }
            public override Cmd VisitAssumeCmd(AssumeCmd node)
            {
                // node.Expr = MakeBool(node.Expr); // this has a tendency to introduce "false"
                return base.VisitAssumeCmd(node);
            }
            public override Cmd VisitAssertCmd(AssertCmd node)
            {
                node.Expr = MakeBool(node.Expr);
                return base.VisitAssertCmd(node);
            }
            public override Requires VisitRequires(Requires node)
            {
                node.Condition = MakeBool(node.Condition);
                return base.VisitRequires(node);
            }
            public override Ensures VisitEnsures(Ensures node)
            {
                node.Condition = MakeBool(node.Condition);
                return base.VisitEnsures(node);
            }
            public override Cmd VisitAssignCmd(AssignCmd node)
            {
                foreach (var lrhs in node.Lhss.Cast<AssignLhs>().Zip(node.Rhss.Cast<Expr>(), (v1, v2) => (v1, v2)).ToList())
                {
                    AssignLhs lhs = lrhs.Item1;
                    Expr rhs = lrhs.Item2;
                    node.Lhss.Add(new SimpleAssignLhs(lhs.tok, (IdentifierExpr)MakeExpr(lhs.DeepAssignedIdentifier)));
                    node.Rhss.Add(MakeExpr(rhs));
                    if (rhs.Type.IsBool)
                    {
                        node.Lhss.Add(new SimpleAssignLhs(lhs.tok, new IdentifierExpr(lhs.tok, MakeVar(lhs.DeepAssignedVariable, true))));
                        node.Rhss.Add(MakeBool(rhs));
                    }
                }
                return base.VisitAssignCmd(node);
            }
            public override Cmd VisitHavocCmd(HavocCmd node)
            {
                foreach (IdentifierExpr iExpr in node.Vars)
                {
                    Expr ret = MakeExpr(iExpr);
                    IdentifierExpr iret = ret as IdentifierExpr;
                    Utils.Assert(iret != null, "Expected an IdentifierExpr");
                    node.Vars.Add(iExpr);
                }
                return base.VisitHavocCmd(node);
            }
        }

    }
}
