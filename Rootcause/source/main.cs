using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.IO;
using System.Diagnostics;
using Microsoft.Boogie;
using Microsoft.Boogie.VCExprAST;
using VC;
using Microsoft.Basetypes;
using BType = Microsoft.Boogie.Type;


namespace Rootcause
{
    class Foo
    {
        #region Statics
        private static Stopwatch sw;
        static private Program prog;
        /* list of constants introduced */
        static private List<Constant> assertConsts;
        static private int assertCount; //number of asserts/impl
        static private int ensuresCount; //number of ensures/impl
        static private List<Constant> predConsts;
        static private Dictionary<string, PredStmt> preds2Stmt;
        static private Dictionary<BType, Dictionary<string, Constant>> modelConsts;


        static private string versionString = "__vv__";
        #endregion 

        /*
         * Performing MAXSAT to get the rootcause
         * * A = Read in a BPL  [DONE]
         * * A' = Predicated BPL with B [DONE]
         * * A' = Make all asserts controllabe assert(b <=> P) [DONE]
         * * Model = VerifyImplementation(B == true; Asserts == true; A') [DONE]
         * * Input = Parameters U Constants\AssertConsts\PredicateConsts
         * * x = GenerateVC(Input == Model; a == false; A') [DONE]
         * * y = {b == true | b \in B} 
         * * While(CheckAssumptionsMAXSAT(x \wedge y, true)
         * *    CheckAssumptionsMAXSAT(x, y, out z, true)
         * *    Print z
         * *    x = x U z; y = y \ z
         */

        static void Main(string[] args)
        {
            sw = Stopwatch.StartNew();
            /* Command line parsing */
            if (!Options.ParseCommandLine(String.Join(" ", args))) return;

            foreach (var f in CommandLineOptions.Clo.Files.FindAll(x => x != ""))
            {
                Console.WriteLine("Processing file {0}", f);
                if (!Utils.ParseProgram(f, out prog)) return;

                //(new TestHavocStmtsVisitor()).Visit(prog); //testing the havoc crash
                //(new Utils.LiftConditionalsInCFG()).Visit(prog);
                //Utils.PrintProg(prog);
                Utils.Inline(prog); //inline any callees marked with {:inline 1}
                if (Options.trackUninterpreted) AddDatatypes();
                var impls = new List<Declaration>(prog.TopLevelDeclarations.Where(x => x is Implementation &&
                    ((Implementation)x).Name.Substring(0, 2) == "EQ").AsEnumerable<Declaration>());
                foreach(Implementation impl in impls)
                    try
                    {
                        if (!Utils.IsInlinedProc(impl.Proc))
                            Go(impl as Implementation, f); //program is implicit
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine("Rootcause terminated with an exception {0}", e);
                    }
            }

        }
        private static void Go(Implementation impl, string filename)
        {
            if (impl == null) return;
            if (CommandLineOptions.Clo.ProcsToCheck != null && CommandLineOptions.Clo.ProcsToCheck.FindAll(x => impl.Name.StartsWith(x)).Count == 0) return;
            Console.WriteLine("############# Implementation = {0} #################", impl.Name);


            if (Options.equalityFixes)
            {
                try
                {
                    EqualityFixes.PerformRootcause(prog, impl);
                }
                catch (Exception e)
                {
                    Console.WriteLine("Rootcause terminated with exception {0}", e.Message);
                }
                Console.WriteLine("Total time for rootcause analysis = {0} seconds", sw.Elapsed.TotalSeconds);
            }
            else if (Options.useUnsatCoresFromFailures)
            {
                CommandLineOptions.Clo.UseUnsatCoreForContractInfer = true; //ROHIT
                CommandLineOptions.Clo.ContractInfer = true; //ROHIT
                UnsatCoreFromFailure.PerformRootcauseTrial(prog, impl);
            }
            else
            {
                UseMaxSatForFailingInput(impl);
            }
                
        }

        /// <summary>
        /// MAXSAT based rootcause analysis [Jose, Majumdar '11] + various refinements
        /// </summary>
        /// <param name="impl"></param>
        private static void UseMaxSatForFailingInput(Implementation impl)
        {
            assertCount = 0;
            ensuresCount = 0;

            new EnforceAtMostOneAssertOrEnsures().Visit(impl); //ensure at most 1 assert/ensures
            /* make the impl predicated */
            if (Options.trackUninterpreted) new MakeUninterpreted(impl).Visit(impl);
            MakeStmtPredicated mkPred = MakePredicatedProgram(impl); //updates predConsts
            //Add ensures true and assume false after the true assertion (assume false is non-predicated)
            if (assertCount == 1)
            {
                impl.Proc.Ensures.Add(new Ensures(false, Expr.True));
                new AddAssumeFalseAfterAssert().Visit(impl);
            }

            Utils.PrintProg(prog);

            /*  guard the assertion */
            GuardAndAddTrueAssertions(impl); //updates assertConsts (has to come after AddDummyAssertsAtReturn to see the new asserts)
            Utils.PrintProg(prog);
            VC.InitializeVCGen(prog);

            /* Generate the program VC once and for all */
            VCExpr progVC = VC.GenerateVC(prog,impl);
            Dictionary<VCExprVar, VCExpr> subst = null;
            List<Counterexample> cex;
            VCExpr modelExpr;
            if (Options.addGoodInputs)
            {
                var cloneVCtmp = CloneVC(progVC, out subst); //HACK: NEED TO CREATE THE RENAMED CONSTANTS BEFORE THE PROVER IS CALLED
                modelExpr = GetModelExprForVC(impl, cloneVCtmp, true, mkPred, out cex); //HACK: NEED to declare them to Z3
            }

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

            //add a few good inputs to the hard constraints
            AddGoodInputs(impl, mkPred, progVC, subst, flipAssertConstraint, hard);

            var unsat = new List<int>();
            //continue until the hard constraints are unsat as a result of moving enough soft --> hard
            int i = 0;
            if (Options.verbose > 0) cex.Clear();
            Utils.PrintQueryToMAXSAT(prog,hard, soft, impl);
            ProverInterface.Outcome t = ProverInterface.Outcome.Undetermined;
            while ((t = VC.proverInterface.CheckAssumptions(hard, soft, out unsat, VC.handler)) == ProverInterface.Outcome.Invalid)
            {
                Console.WriteLine("---------- Cause {0} ----------", ++i);
                unsat.ForEach(x => Console.WriteLine("\t Stmt => {0}", preds2Stmt[soft[x].ToString()].ToString())); //don't index into soft and remove from it
                if (Options.verbose == 2)
                {
                    cex.ForEach(c => c.Model.Elements.ToList().ForEach(m => m.Names.ToList().ForEach(x => Console.WriteLine("\t\t " + x))));
                    cex.Clear();
                }
                var elems = unsat.ConvertAll<VCExpr>(x => soft[x]); //these are the predicates
                foreach (var e in elems)
                {
                    //move the unsat clauses from soft --> hard
                    hard.Add(e);
                    soft.Remove(e); //can't remove by index as soft is changing
                }

            }
            if (i == 0)
                Console.WriteLine("Something weird, no rootcauses found (possible reason, use of if (!a) assert false  instead of assert (a), outcome = {0}", t);
        }

        #region Utilities for models 
        private static VCExpr ModelToConstraint(Implementation impl, List<Counterexample> cexs, List<Variable> assumePenalizers)
        {
            VCExpr ret = VCExpressionGenerator.True;
            Utils.Assert(cexs.Count > 0, "Expecting a non-empty list of counterexamples");
            var cex = cexs[0];
            var model = cex.Model;
            modelConsts = new Dictionary<BType,Dictionary<string,Constant>>();
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
            if(Options.verbose == 2) Console.WriteLine("List of map types = {0}", String.Join(",", mapTypes));

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
            foreach(BType a in tp.AsMap.Arguments) {
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
                    Microsoft.Basetypes.BigNum.FromInt((((Model.Integer)g).AsInt()))));
            else if (tp.IsBv)
                throw new Exception("Handling of bit-vector models not supported yet");
            else if (tp.IsReal)
                throw new Exception("Handling of real valued models not supported yet");
            else if (tp.IsMap  || tp.IsCtor) // map or user defined 
            {
                var h = g as Model.DatatypeValue;
                if (h != null)
                {
                    //TODO: we should not be creating a constant with a string (__DT_int 8), rather want to create a function application
                    if (h.Arguments.Length > 0)
                        throw new Exception("Handling of datatype ctors of non-zero size is not supported yet " + tp.ToString() + " " + g.ToString());                        
                }
                if (!modelConsts.ContainsKey(tp)) modelConsts[tp] = new Dictionary<string,Constant>();                
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
                throw new Exception("Handling of type basic/ctors/closed/variable models not supported yet " + tp.ToString() + " " +  g.ToString());
            }
            if (Options.verbose == 2) Console.WriteLine("\t VCExpr = {0}", n);
            return n;
        }
        private static VCExpr ModelToConstraintOld(Implementation impl, List<Counterexample> cexs)
        {
            throw new Exception("This method is deprecated, just for historic reasons and reference");
            //Look at the description of Model class in Boogie (the prelude describes the class nicely)
            //Each const/parameter of base type is represented as a 0-arity Element
            //Each const/parameter of array type is represented by a 0-arity Element. The actual value is given by Select_
            //Each function is represented by k-arity Element.
#if DEAD
            Utils.Assert(cexs.Count > 0, "Expecting a non-empty list of counterexamples");
            var cex = cexs[0];
            var model = cex.Model;
            var inputs = new List<Variable>();
            foreach (Variable v in impl.InParams)
                inputs.Add(v);
            inputs.AddRange(prog.TopLevelDeclarations.Where(x => x is Constant).Cast<Variable>()); //constants
            inputs.AddRange(prog.GlobalVariables()); //globals

            VCExpr ret = VCExpressionGenerator.True;
            
            modelConsts = new Dictionary<BType, List<Constant>>();

            Console.Write("\nThe model ==> [");
            foreach (var v in inputs)
            {
                var e = model.TryGetFunc(v.Name);
                if (e == null) continue;
                var c = e.GetConstant();
                /* constant of type [int]int have the Element type as Uninterpreted */
                VCExpr t = null;
                if (c is Model.Integer) 
                {
                    var x = ((Model.Integer)c).AsInt();
                    t = VC.exprGen.Eq(VC.translator.LookupVariable(v), VC.translator.Translate(new LiteralExpr(Token.NoToken, Microsoft.Basetypes.BigNum.FromInt(x))));
                    Console.Write("({0}, {1})  ", v.Name, c);              
                }
                else if (c is Model.Boolean)
                {
                    var x = ((Model.Boolean)c).Value;
                    t = VC.exprGen.Eq(VC.translator.LookupVariable(v), VC.translator.Translate(new LiteralExpr(Token.NoToken, x)));
                    Console.Write("({0}, {1})  ", v.Name, c);
                }
                else if (c is Model.BitVector)
                {
                    Console.Write("({0}, {1})  ", v.Name, c);
                    throw new Exception("Bit vectors values not supported yet");
                }
                else if (c is Model.Array)
                {
                    throw new Exception("Arrays using array theory not supported yet");
                }
                else if (c is Model.Uninterpreted)
                {
                    //any uninterpreted type include "type ref", or "arrays" come here
                    var x = ((Model.Uninterpreted)c).Name;
                    var tp = v.TypedIdent.Type;
                    var n = new Constant(Token.NoToken, new TypedIdent(Token.NoToken, x, tp), true); //can't make it unique
                    if (!modelConsts.ContainsKey(tp))
                        modelConsts[tp] = new List<Constant>();
                    if (!modelConsts[tp].Contains(n))
                        modelConsts[tp].Add(n);
                    prog.TopLevelDeclarations.Add(n);
                    t = VC.exprGen.Eq(VC.translator.LookupVariable(v),
                        VC.translator.LookupVariable(n));
                    ret = VC.exprGen.And(ret, t); //HACK
                    //TODO: only support [int]int arrays
                    var sel = model.TryGetFunc("Select_[$int]$int");
                    if (sel == null) continue; //maybe there is no value of relevance
                    t = VCExpressionGenerator.True;
                    foreach (var a in sel.AppsWithArg(0, c))
                    {
                        Utils.Assert(a.Args.Count() == 2, "only support [int]int arrays");
                        Console.Write("({0}[{1}], {2})  ", v, a.Args[1], a.Result);
                        //construct VC.exprGen.Eq(Select(v.Name, a.Args[1..n]), a.Result)
                        VCExpr[] args = {VC.translator.LookupVariable(v), 
                        VC.translator.Translate(new LiteralExpr(Token.NoToken, Microsoft.Basetypes.BigNum.FromInt(a.Args[1].AsInt())))};
                        var u = VC.exprGen.Eq(VC.exprGen.Select(args), 
                            VC.translator.Translate(new LiteralExpr(Token.NoToken, Microsoft.Basetypes.BigNum.FromInt(a.Result.AsInt()))));
                        t = VC.exprGen.And(t, u);
                    }
                }
                if (t != null)
                    ret = VC.exprGen.And(ret, t);
            }
            foreach (Function f in prog.TopLevelDeclarations.Where(x => x is Function))
            {
                var e = model.TryGetFunc(f.Name);
                if (e == null) continue;
                var t = VCExpressionGenerator.True;
                foreach (var a in e.Apps)
                {
                    //construct VC.exprGen.Eq(Select(v.Name, a.Args[1..n]), a.Result)
                    VCExpr[] args = new VCExpr[a.Args.Count()];
                    int i = 0;
                    var argsStr = "";
                    foreach (var b in a.Args)
                    {
                        args[i++] = VC.translator.Translate(new LiteralExpr(Token.NoToken, Microsoft.Basetypes.BigNum.FromInt(b.AsInt())));
                        argsStr +=  (i > 1 ? ", " : "" ) + b.ToString() ;
                    }
                    Console.Write("({0}({1}), {2})  ", f.Name, argsStr, a.Result);
                    var u = VC.exprGen.Eq(VC.exprGen.Function(f, args), 
                        VC.translator.Translate(new LiteralExpr(Token.NoToken, Microsoft.Basetypes.BigNum.FromInt(a.Result.AsInt()))));
                    t = VC.exprGen.And(t, u);
                }
                if (t != null)
                    ret = VC.exprGen.And(ret, t);
            }
            ret = VC.exprGen.And(ret, GenerateDistinctAssumptions(modelConsts));
            Console.WriteLine("]\n");
            return ret;
#endif
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

        #region Datatypes and uninterpreted operations (to be moved to datatypes.cs)

        private static void AddDatatypes()
        {
            IToken tok = Token.NoToken;
            IEnumerable<Declaration> top = prog.TopLevelDeclarations;
            TypeCtorDecl tDecl = top.OfType<TypeCtorDecl>().Where(x => x.Name == "__DT").First();
            Datatypes.dtType = new CtorType(tok, tDecl, new List<BType>(new BType[0]));
            Datatypes.dtSetType = new MapType(tok, new List<TypeVariable>(new TypeVariable[0]),
                new List<BType>(new BType[] { Datatypes.dtType }), BType.Bool);
            foreach (Function f in prog.TopLevelDeclarations.OfType<Function>().ToList())
            {
                if (QKeyValue.FindBoolAttribute(f.Attributes, "uninterpreted"))
                {
                    var vars = f.InParams.Cast<Variable>();
                    // BOOGIE WORKAROUND: original: var tVars = vars.Select(x => Tuple.Create(x.Name, x.TypedIdent.Type));
                    var tVars = vars.Select(x => Tuple.Create(x.Name, x.TypedIdent.Type.IsInt || x.TypedIdent.Type.IsBool ? (BType)Datatypes.dtType : x.TypedIdent.Type));
                    var dtVars = vars.Select(x => Tuple.Create("__DT__" + x.Name, (BType)Datatypes.dtType));
                    Datatypes.functionToConstructor.Add(f.Name,
                        AddConstructor(f.tok, Datatypes.dtType, "__DT__" + f.Name,
                            Options.fatDatatypes ? (tVars.Concat(dtVars)) : dtVars));
                }
            }
            Datatypes.emptyConstant = top.OfType<Constant>().Where(x => x.Name == "__DT_Empty").First();
            Datatypes.nilConstructor = top.OfType<DatatypeConstructor>().Where(x => x.Name == "__DT_nil").First();
            Datatypes.intConstructor = top.OfType<DatatypeConstructor>().Where(x => x.Name == "__DT_int").First();
            Datatypes.boolConstructor = top.OfType<DatatypeConstructor>().Where(x => x.Name == "__DT_bool").First();
            Datatypes.havocConstructor = top.OfType<DatatypeConstructor>().Where(x => x.Name == "__DT_havoc").First();
            Datatypes.singleFunction = top.OfType<Function>().Where(x => x.Name == "__DT_Single").First();
            Datatypes.unionFunction = top.OfType<Function>().Where(x => x.Name == "__DT_Union").First();
            Datatypes.setFunction = top.OfType<Function>().Where(x => x.Name == "__DT_Set").First();
            prog.TopLevelDeclarations.OfType<Variable>().Select(MakeUninterpreted.MakeVars).ToList()
                .ForEach(prog.AddTopLevelDeclarations);
        }
        private static DatatypeConstructor AddConstructor(IToken tok, CtorType typ, string name, IEnumerable<Tuple<string, BType>> args)
        {
            DatatypeConstructor cons = new DatatypeConstructor(
                new Function(tok, name, new List<TypeVariable>(), new List<Variable>(
                        args.Select(x => (Variable)new Formal(tok, new TypedIdent(tok, x.Item1, x.Item2), true)).ToArray()),
                    new Formal(tok, new TypedIdent(tok, "", typ), false),
                    null, new QKeyValue(tok, "constructor", new List<object>(), null)));
            DatatypeMembership membership = new DatatypeMembership(cons);
            cons.membership = membership;
            var selectors = args.Select((x, i) => new DatatypeSelector(cons, i)).ToList();
            selectors.ForEach(cons.selectors.Add);
            prog.AddTopLevelDeclaration(cons);
            prog.AddTopLevelDeclaration(membership);
            selectors.ForEach(prog.AddTopLevelDeclaration);
            return cons;
        }

        class MakeUninterpreted : StandardVisitor
        {
            private Implementation impl;
            static Dictionary<Variable,Variable> uninterpretedVars = new Dictionary<Variable,Variable>(new VarComparer());
            static Dictionary<Variable,Variable> uninterpretedBoolVars = new Dictionary<Variable,Variable>(new VarComparer());
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
                Dictionary<Variable,Variable> table = boolVar ? uninterpretedBoolVars : uninterpretedVars;
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
                if (Options.verbose == 2) Console.WriteLine ("interpreted function: " + e.Fun.FunctionName);
                return MakeUnions(e.tok, e.Args, 0);
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
                foreach (var lrhs in node.Lhss.Cast<AssignLhs>().Zip(node.Rhss.Cast<Expr>()).ToList())
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
        #endregion

        #region Instrumenting asserts and ensures
        private static VCExpr FlipAssertion(List<Counterexample> cex)
        {
            //HACK for single assertion --- generalize
            //Utils.Assert(assertConsts.Count == 1, "Expecting only 1 assertion in the program");
            //return VC.exprGen.Not(VC.translator.LookupVariable(assertConsts[0]));
            return assertConsts.Aggregate(VCExpressionGenerator.True, (x, y) => VC.exprGen.And(x, VC.exprGen.Not(VC.translator.LookupVariable(y))));
        }
        /// <summary>
        /// Guards assertions as well as follows them with assume false (if its instrumented)
        /// </summary>
        /// <param name="impl"></param>
        private static void GuardAndAddTrueAssertions(Implementation impl)
        {
            assertConsts = new List<Constant>();
            var assertGuarded = new MakeAssertsGuarded();
            assertGuarded.Visit(impl);
        }

        //we will relax this later 
        class EnforceAtMostOneAssertOrEnsures : StandardVisitor
        { 
            public override Cmd VisitAssertCmd(AssertCmd node)
            {
                if (Utils.ReadSourceAssert(node) == null)
                    if ((assertCount++) + ensuresCount > 1)
                        throw new Exception("Expecting only 1 assertion/ensures in a procedure for now");
                return base.VisitAssertCmd(node);
            }
            public override Ensures VisitEnsures(Ensures ensures)
            {
                if (assertCount + (ensuresCount++) > 1)
                    throw new Exception("Expecting only 1 assertion/ensures in a procedure for now");
                return base.VisitEnsures(ensures);
            }
        }

        //need to rename these class names
        class AddAssumeFalseAfterAssert: StandardVisitor
        {
            public override List<Cmd> VisitCmdSeq(List<Cmd> cmdSeq)
            {
                var newCmdSeq = new List<Cmd>();
                foreach (var cmd in cmdSeq)
                {
                    newCmdSeq.Add(cmd);
                    var assertCmd = cmd as AssertCmd;
                    if (assertCmd == null) continue;
                    if (Utils.ReadSourceAssert(assertCmd) != null) continue;
                    //add an assume false command after the true assertion
                    newCmdSeq.Add(new AssumeCmd(Token.NoToken, Expr.False));
                }
                return base.VisitCmdSeq(newCmdSeq);
            }
        }

        class MakeAssertsGuarded : StandardVisitor
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
                if (Utils.ReadSourceAssert(node) != null)
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
            public Tuple<string,BigNum> sourceLoc;
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
        class MakeStmtPredicated: StandardVisitor
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
                Tuple<string, BigNum> sourceLoc = Utils.ReadSourceAssert(node);
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
            public override Cmd  VisitAssignCmd(AssignCmd node)
            {
                if (predOn || node.Rhss.Exists(ContainsPredFun))
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
                                     new List<Expr>{Expr.Not(IdentifierExpr.Ident(a)), iExpr, CreateHavocConst(iExpr)}));
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
                Constant constant  = new Constant(tok, typedIdent, false);
                IdentifierExpr hExpr = new IdentifierExpr(tok, constant);
                prog.AddTopLevelDeclaration(constant);
                return hExpr;
            }
        }
        #endregion         

        # region Deprecated for now (regarding adding Good inputs)
        private static void AddGoodInputs(Implementation impl, MakeStmtPredicated mkPred, VCExpr progVC, Dictionary<VCExprVar, VCExpr> subst, VCExpr flipAssertConstraint, List<VCExpr> hard)
        {
            if (Options.addGoodInputs)
            {
                List<Counterexample> altCex;
                var altModelExpr = GetModelExprForVC(impl, progVC, false, mkPred, out altCex);
                var cloneVC = CloneVCUsingSubst(VC.exprGen.And(VC.exprGen.Not(progVC), altModelExpr), subst); //takes the subst earlier created
                //trying to make maxsat of good model (remove the next two lines)
                hard.Clear();
                hard.Add(VC.exprGen.Not(flipAssertConstraint));
                hard.Add(cloneVC);
            }
        }
        private static VCExpr CloneVCUsingSubst(VCExpr progVC, Dictionary<VCExprVar, VCExpr> substDict)
        {
            VCExprSubstitution subst = new VCExprSubstitution(substDict, new Dictionary<TypeVariable, Microsoft.Boogie.Type>());
            SubstitutingVCExprVisitor substVisitor = new SubstitutingVCExprVisitor(VC.proverInterface.VCExprGen);
            VCExpr vcexpr = substVisitor.Mutate(progVC, subst);
            return vcexpr;
        }
        private static VCExpr CloneVC(VCExpr progVC, out Dictionary<VCExprVar, VCExpr> substDict)
        {
            //collect the free vars in the VC
            var fvc = new FreeVariableCollector();
            fvc.Collect(progVC);
            var freeVars = fvc.FreeTermVars;
            //make a clone of the VC
            substDict = new Dictionary<VCExprVar, VCExpr>();
            foreach (VCExprVar v in freeVars.Keys)
            {
                if (!DontCloneVar(v))
                {
                    var t = CreateNewVCVar(v, 1);
                    substDict.Add(v, t);
                }
            }
            VCExprSubstitution subst = new VCExprSubstitution(substDict, new Dictionary<TypeVariable, Microsoft.Boogie.Type>());
            SubstitutingVCExprVisitor substVisitor = new SubstitutingVCExprVisitor(VC.proverInterface.VCExprGen);
            VCExpr vcexpr = substVisitor.Mutate(progVC, subst);
            return vcexpr;
        }
        private static bool DontCloneVar(VCExprVar v)
        {
            if (v.Name.Contains("_bpred_") || v.Name.Contains("_havoc#") || v.Name.Contains("_bassert_")) return true;
            if (v.Name.Contains(versionString)) return true;
            return false;
        }
        private static VCExprVar CreateNewVCVar(VCExprVar v, int version)
        { //copied after StratifiedInlining
            Constant newVar = new Constant(Token.NoToken, new TypedIdent(Token.NoToken, v.Name + versionString + version, v.Type));
            VC.proverInterface.Context.DeclareConstant(newVar, false, null);
            return VC.proverInterface.VCExprGen.Variable(newVar.Name, v.Type);
        }
        #endregion


    }
}
