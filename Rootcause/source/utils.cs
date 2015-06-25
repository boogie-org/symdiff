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
using Microsoft.Basetypes;
using BType = Microsoft.Boogie.Type;

namespace Rootcause
{
    static class Utils
    {
        #region debugging aid
        //Testing the crash when looking up the type of vars in a havoc cmd
        class TestHavocStmtsVisitor : StandardVisitor
        {
            public override Cmd VisitHavocCmd(HavocCmd node)
            {
                foreach (IdentifierExpr e in node.Vars)
                    Debug.Assert(e.Type != null);
                return base.VisitHavocCmd(node);
            }
        }

        public static bool verbosityLevel(int level) { return (Options.verbose >= level); }
        #endregion

        #region Various Boogie utilities
        public static void Assert(bool b, string msg = "")
        {
            if (!b) throw new Exception("assertion failure: " + msg);
        }
        public static void PrintProg(Program p)
        {
            //ROHIT: always print
            var filename = Options.outputPath + @"\tmp" + Options.htmlTag + ".bpl";
            var tuo = new TokenTextWriter(filename);
            try
            {
                p.Emit(tuo);
            }
            finally
            {
                tuo.Close();
            }

        }
        public static bool ParseProgram(string fname, out Program prog)
        {
            prog = null;
            int errCount;
            try
            {
                errCount = Parser.Parse(fname, new List<string>(), out prog);
                if (errCount != 0 || prog == null)
                {
                    Console.WriteLine("WARNING: {0} parse errors detected in {1}", errCount, fname);
                    return false;
                }
            }
            catch (IOException e)
            {
                Console.WriteLine("WARNING: Error opening file \"{0}\": {1}", fname, e.Message);
                return false;
            }
            if (Options.fatDatatypes || Options.trackUninterpreted || Options.useSetAxioms)
            {
                Program preludeProg;
                Parser.Parse(Datatypes.prelude + (Options.useSetAxioms ? Datatypes.preludeSetAxioms : Datatypes.preludeSetAxiomsMin), "prelude", out preludeProg);
                prog.AddTopLevelDeclarations(preludeProg.TopLevelDeclarations);
            }
            errCount = prog.Resolve();
            if (errCount > 0)
            {
                Console.WriteLine("WARNING: {0} name resolution errors in {1}", errCount, fname);
                return false;
            }
            errCount = prog.Typecheck();
            if (errCount > 0)
            {
                Console.WriteLine("WARNING: {0} type checking errors in {1}", errCount, fname);
                return false;
            }
            //var s = new FindLocationAssertion();
            //s.Visit(prog);
            return true;
        }
        public static void PrintQueryToMAXSAT(Program prog, List<VCExpr> hard, List<VCExpr> soft, Implementation impl)
        {
            PrintProg(prog);
            if (Utils.verbosityLevel(2)) Console.WriteLine("HARD constraints => {0}, \n\n \n", String.Join("\n", hard));
            if (Utils.verbosityLevel(2)) Console.WriteLine("SOFT constraints => {0}, \n\n n", String.Join("\n", soft));
        }
        public static void Inline(Program program)
        {
            //perform inlining on the procedures
            IEnumerable<Declaration> impls = program.TopLevelDeclarations.Where(x => x is Implementation);
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
        public static LocalVariable MkLocalVar(string v, BType t)
        {
            return new LocalVariable(Token.NoToken, new TypedIdent(Token.NoToken, v, t));
        }
        #endregion 

        #region Rootcause related utilities
        public static Tuple<string, BigNum> ReadSourceAssert(AssertCmd node)
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

        enum Side {Left, Right, None};

        //These three things will collect left and right blocks
        public static Tuple<List<Block>, List<Block>> GetLeftRightBlocks(Implementation impl)
        {
            //Compute partition
            int partition;
            if (!DetermineTwoProcedures(impl, out partition))
            {
                throw new Exception("Program does not have Left and Right components");
            }
            var extractor = new GetLeftRightBlocksVisitor(impl, partition);
            Tuple<List<Block>, List<Block>, List<Block>> sets = extractor.extractBlocks();
            return Tuple.Create<List<Block>, List<Block>>(sets.Item2, sets.Item3); //sets.Item1 is allCmdSeq
        }

        internal class GetLeftRightBlocksVisitor : StandardVisitor
        {
            private Implementation impl;
            private int partition = -1;
            private List<Block> allBlocks, leftBlocks, rightBlocks;
            public GetLeftRightBlocksVisitor(Implementation impl, int partition)
            {
                this.impl = impl;
                this.partition = partition; //setting partition
                this.allBlocks = new List<Block>();
                this.leftBlocks = new List<Block>();
                this.rightBlocks = new List<Block>();
                
            }

            public Tuple<List<Block>, List<Block>, List<Block>> extractBlocks()
            {
                this.Visit(impl);
                return Tuple.Create<List<Block>, List<Block>, List<Block>>(allBlocks, leftBlocks, rightBlocks);
            }

            public override Block VisitBlock(Block node)
            {
                List<Cmd> cmdSeq = node.Cmds;
                Side side = processCmdSeq(cmdSeq);
                if (side == Side.Left) { this.leftBlocks.Add(node); }
                else if (side == Side.Right) { this.rightBlocks.Add(node); }
                return base.VisitBlock(node);
            }

            private Side processCmdSeq(List<Cmd> cmdSeq)
            {
                bool encounteredLeft = false;
                bool encounteredRight = false;
                foreach (var c in cmdSeq)
                {
                    var c_assign = c as AssignCmd;
                    //var c_goto = c as GotoCmd;
                    var c_assume = c as AssumeCmd;
                    var c_havoc = c as HavocCmd;
                    var c_assert = c as AssertCmd;
                    var c_call = c as CallCmd;
                    Utils.Assert(c_assign != null || c_assume != null || c_havoc != null || c_assert != null || c_call != null, 
                        "Unexpected command type not one of assign, goto, assume, havoc, assert, call");
                    List<Absy> nonNullCastedCommands = new List<Absy>(new Absy[] { c_assign, c_assume, c_havoc, c_assert, c_call }).Where(x => x != null).ToList<Absy>();
                    //list should contain only 1 element now.
                    Utils.Assert(nonNullCastedCommands.Count == 1, "Command is more than one of assign, goto, assume, havoc, assert");
                    int line = nonNullCastedCommands[0].Line;
                    if (line < partition) { encounteredLeft = true; }
                    else { encounteredRight = true; }
                }

                if (cmdSeq.Count == 0) { return Side.None; }

                if (encounteredLeft == true && encounteredRight == false) { return Side.Left; }
                else if (encounteredLeft == false && encounteredRight == true) { return Side.Right; }
                else if (encounteredLeft == false && encounteredRight == false) { throw new Exception("Block claims to be neither left nor right."); }
                else if (encounteredLeft == true && encounteredRight == true) { throw new Exception("Block claims to be both left nor right."); }

                throw new Exception("Unable to categorize block into Left or Right");
            }
        }

        //These two functions will find us the partition
        public static bool DetermineTwoProcedures(Implementation impl, out int partition)
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

        //check for timeout
        public static void CheckRootcauseTimeout(Stopwatch sw)
        {
            var tout = Options.rootcauseTimeout - Options.boogieTimeout < 50 ? Options.rootcauseTimeout : Options.rootcauseTimeout - Options.boogieTimeout;
            if (sw.ElapsedMilliseconds / 1000 > tout)
                throw new TimeoutException("Rootcause timeout exception: exceeds " + tout + " secs");
        }
        #endregion

        #region Utilities for models
        
        public static Dictionary<Constant,Model.Element> ModelForCex(Program prog, Implementation impl, Counterexample cex)
        {
            Dictionary<Constant, Model.Element> ret = new Dictionary<Constant, Model.Element>();

            var model = cex.Model;
            Dictionary<BType, Dictionary<string, Constant>> modelConsts = new Dictionary<BType, Dictionary<string, Constant>>();

            var inputs = new List<Variable>();
            //gather inputs, constants and globals
            foreach (Variable v in impl.InParams) inputs.Add(v);
            inputs.AddRange(prog.TopLevelDeclarations.Where(x => x is Constant).Cast<Variable>()
                .Where(x => true)); //constants
            inputs.AddRange(prog.GlobalVariables); //globals
            //it is not true that all the values are present as assignment of inputs/consts/globals/localvars,
            //some output of functions such as select don't appear in locvars
            //foreach (Variable v in impl.LocVars) inputs.Add(v); //incarnation variables h@1, h@3, ..
            var vars = inputs.Concat(impl.LocVars.Cast<Variable>()).ToList();

            //list of map types in the program
            List<BType> mapTypes = vars.FindAll(x => x.TypedIdent.Type.IsMap).ConvertAll(x => x.TypedIdent.Type);

            foreach (var func in model.Functions)
            {
                //if (Utils.verbosityLevel(3)) Console.WriteLine("Function = {0}", func.Name);
                //look for inputs
                //var s = inputs.FindAll(x => x.Name == func.Name);
                var s = inputs.FindAll(x => x.Name == func.Name);
                if (s.Count > 0)
                {
                    var v = s[0];
                    foreach (var a in func.Apps) //should only go once
                    {
                        Utils.Assert(a.Args.Count() == 0, "#of args to input function is 0");
                        //if (Utils.verbosityLevel(3)) Console.WriteLine("\t Result = {0}, {1}", a.Result, a.Result.Kind);
                        if (v is Constant) { ret[v as Constant] = a.Result; }
                    }
                    continue;
                }
            }

            return ret;
        }

        public static VCExpr ModelToConstraintHelper(Program prog, Implementation impl, List<Counterexample> cexs,
                                                     List<Variable> inputs, List<Variable> vars)
        {
            VCExpr ret = VCExpressionGenerator.True;
            Utils.Assert(cexs.Count > 0, "Expecting a non-empty list of counterexamples");
            var cex = cexs[0];
            var model = cex.Model;
            Dictionary<BType, Dictionary<string, Constant>> modelConsts = new Dictionary<BType, Dictionary<string, Constant>>();

            //list of map types in the program
            List<BType> mapTypes = vars.FindAll(x => x.TypedIdent.Type.IsMap).ConvertAll(x => x.TypedIdent.Type);
            //Console.WriteLine("List of map types = {0}", String.Join(",", mapTypes));
            //Console.WriteLine("Inputs = {0}", String.Join(", ", inputs.ConvertAll<string>(x => x.Name)));
            foreach (var func in model.Functions)
            {
                //Console.WriteLine("Function = {0}", func.Name);
                //look for inputs
                //var s = inputs.FindAll(x => x.Name == func.Name);
                var s = inputs.FindAll(x => x.Name == func.Name);
                if (s.Count > 0)
                {
                    var v = s[0];
                    foreach (var a in func.Apps) //should only go once
                    {
                        Utils.Assert(a.Args.Count() == 0, "#of args to input function is 0");
                        if (Utils.verbosityLevel(3)) Console.WriteLine("\t Result = {0}, {1}", a.Result, a.Result.Kind);
                        ret = VC.exprGen.And(ret,
                            VC.exprGen.Eq(VC.translator.LookupVariable(v),
                            ModelElementToVCExpr(prog, impl, modelConsts, v.TypedIdent.Type, a.Result)));
                    }
                    continue;
                }
                //look for functions
                var fns = prog.TopLevelDeclarations.Where(x => x is Function).Cast<Function>().Where(x => x.Name == func.Name);
                if (fns.Count() > 0)
                {
                    var v = fns.First();
                    ret = VC.exprGen.And(ret, FuncModelToVCExpr(prog, impl, modelConsts, func, v));
                    continue;
                }
                if (func.Name.Contains("Select_"))
                {
                    if (Utils.verbosityLevel(2)) Console.WriteLine("Processing select function {0}", func.Name);
                    ret = VC.exprGen.And(ret, FuncModelToVCExpr(prog, impl, modelConsts, func, MkSelectFunc(func, mapTypes)));
                }
                if (func.Name.Contains("Store_"))
                {
                    if (Utils.verbosityLevel(2)) Console.WriteLine("Processing store function {0}", func.Name);
                    ret = VC.exprGen.And(ret, FuncModelToVCExpr(prog, impl, modelConsts, func, MkStoreFunc(func, mapTypes)));
                }
            }

            ret = VC.exprGen.And(ret, GenerateDistinctAssumptions(modelConsts));
            if (Utils.verbosityLevel(2)) Console.WriteLine("ModelExpr = {0}", ret);
            return ret;
        }

        public static VCExpr ModelToConstraint(Program prog, Implementation impl, List<Counterexample> cexs)
        {
            var inputs = new List<Variable>();
            //gather inputs, constants and globals
            foreach (Variable v in impl.InParams) inputs.Add(v);
            inputs.AddRange(prog.TopLevelDeclarations.Where(x => x is Constant).Cast<Variable>()
                .Where(x => true)); //constants
            inputs.AddRange(prog.GlobalVariables); //globals
            //it is not true that all the values are present as assignment of inputs/consts/globals/localvars,
            //some output of functions such as select don't appear in locvars
            //foreach (Variable v in impl.LocVars) inputs.Add(v); //incarnation variables h@1, h@3, ..
            var locals = inputs.Concat(impl.LocVars.Cast<Variable>()).ToList();

            return ModelToConstraintHelper(prog, impl, cexs, inputs, locals);
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
            if (Utils.verbosityLevel(3)) Console.WriteLine("\tCreated Store funct with {0} Types = ({1}) --> ({2})", store, String.Join(",", tp.AsMap.Arguments.ToList().ConvertAll(x => x.ToString())), tp.AsMap.Result);
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
            if (Utils.verbosityLevel(3)) Console.WriteLine("\tCreated Select funct with {0} Types = ({1}) --> ({2})", select, String.Join(",", tp.AsMap.Arguments.ToList().ConvertAll(x => x.ToString())), tp.AsMap.Result);
            return select;
        }
        private static VCExpr FuncModelToVCExpr(Program prog, Implementation impl, Dictionary<BType, Dictionary<string, Constant>> modelConsts, Model.Func func, Function v)
        {
            //Case of non-functions
            var ret = VCExpressionGenerator.True;
            foreach (var a in func.Apps)
            {
                List<VCExpr> vcArgs = new List<VCExpr>();
                int i = 0;
                foreach (var g in a.Args)
                {
                    //if (Utils.verbosityLevel(2)) Console.Write("\t App = {0}, {1}\t", g.ToString(), g.Kind);
                    vcArgs.Add(ModelElementToVCExpr(prog, impl, modelConsts, v.InParams[i].TypedIdent.Type, g));
                    i++;
                }
                //if (Utils.verbosityLevel(2)) Console.Write("\t Result = {0}, {1}", a.Result, a.Result.Kind);
                var res = ModelElementToVCExpr(prog, impl, modelConsts, v.OutParams[0].TypedIdent.Type, a.Result);
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
        private static VCExpr ModelElementToVCExpr(Program prog, Implementation impl, Dictionary<BType, Dictionary<string, Constant>> modelConsts, BType tp, Model.Element g)
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
            //if (Utils.verbosityLevel(2)) Console.WriteLine("\t VCExpr = {0}", n);
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
        public static VCExpr GetModelExprForVC(Program prog, Implementation impl, VCExpr vc, out List<Counterexample> cex)
        {
            var outcome = VC.VerifyVC(impl.Name, vc, out cex);
            if (outcome == ProverInterface.Outcome.Valid)
            {
                return null;
            }

            VCExpr modelExpr = ModelToConstraint(prog, impl, cex);
            return modelExpr;
        }
        #endregion

        #region Lifting conditionals

        //rewrites a conditional (if (e) then s else t --> c := e; if (c) then s else t)
        //if e is non Boolean variable
        public static void liftConditionalsInCFG(Program prog, Implementation impl)
        {
            (new ConditionalLifter()).Visit(prog);
        }
        
        public class ConditionalLifter : StandardVisitor
        {
            Implementation currImpl = null;
            LocalVariable locvar = null;
            public override Implementation VisitImplementation(Implementation node)
            {
                currImpl = node;
                locvar = MkLocalVar("rootcause_cond_var", BType.Bool);
                currImpl.LocVars.Add(locvar);
                return base.VisitImplementation(node);
            }
            public override Block VisitBlock(Block node)
            {
                if (!(node.TransferCmd is GotoCmd)) return base.VisitBlock(node);
                var g = node.TransferCmd as GotoCmd;
                if (g.labelTargets.Count != 2) return base.VisitBlock(node); //goto A, B
                var truet = g.labelTargets[0];
                var falset = g.labelTargets[1];
                if (!(truet.Cmds.Count > 0 && falset.Cmds.Count > 0)) return base.VisitBlock(node);
                if (!(truet.Cmds[0] is AssumeCmd && falset.Cmds[0] is AssumeCmd)) return base.VisitBlock(node);
                var condT = truet.Cmds[0] as AssumeCmd;
                var condF = falset.Cmds[0] as AssumeCmd;
                if (!(condT.Expr.ToString() == (Expr.Not(condF.Expr)).ToString() ||
                    condF.Expr.ToString() == (Expr.Not(condT.Expr)).ToString())) return base.VisitBlock(node);
                var assignLhs = new List<AssignLhs>();
                assignLhs.Add(new SimpleAssignLhs(Token.NoToken,
                    new IdentifierExpr(Token.NoToken, locvar)));
                var assignRhs = new List<Expr>();
                assignRhs.Add(condT.Expr);
                node.Cmds.Add(new AssignCmd(Token.NoToken, assignLhs, assignRhs));
                //Important, the condT/condF blocks may be visited before this block
                condT.Expr = new IdentifierExpr(Token.NoToken, locvar); 
                condF.Expr = Expr.Not(new IdentifierExpr(Token.NoToken, locvar));
                return base.VisitBlock(node);
            }
        }
        #endregion

        #region Pulls out callees from CallMem
        public class ExtractCalleeConstVisitor : StandardVisitor
        {
            Implementation currImpl = null;
            LocalVariable locvar = null;
            Function callMem = null;
            public override Program VisitProgram(Program node)
            {
                //callMem = (Function) node.TopLevelDeclarations.Where(x => x is Function).Where(x => (x as Function).Name.Contains("CallMem")); //  Where(x => (x is Function && ((Function)x).Name.Contains("CallMem")));
                IEnumerable<Declaration> candidateFunctions = node.TopLevelDeclarations.Where(x => (x is Function && ((Function)x).Name.Contains("CallMem")));
                callMem = candidateFunctions.Count() > 0 ? candidateFunctions.First() as Function : null;
                if (callMem == null) return node;
                return base.VisitProgram(node);
            }
            public override Implementation VisitImplementation(Implementation node)
            {
                Debug.Assert(callMem != null);
                currImpl = node;
                var calleeType = callMem.InParams[0].TypedIdent.Type;
                locvar = MkLocalVar("rootcause_callee_var", calleeType);
                currImpl.LocVars.Add(locvar);
                return base.VisitImplementation(node);
            }
            public override List<Cmd> VisitCmdSeq(List<Cmd> cmdSeq)
            {
                var newCmdSeq = new List<Cmd>();
                foreach (var c in cmdSeq)
                {
                    if (c is AssignCmd)
                    {
                        var a = c as AssignCmd;
                        if (a.Rhss.Count == 2 &&
                            EqualityFixes.FilterManager.FunctionNameContains(a.Rhss[1], "CallMem"))
                        {
                            Expr t = GetFirstArgFromNaryExpr(a.Rhss[0]);
                            var locExpr = new IdentifierExpr(Token.NoToken, locvar); 
                            newCmdSeq.Add(new AssignCmd(Token.NoToken,
                                new List<AssignLhs>() { new SimpleAssignLhs(Token.NoToken, locExpr) },
                                new List<Expr>() {t}));
                            var d0 = SetFirstArgOfNaryExpr(a.Rhss[0], locExpr);
                            var d1 = SetFirstArgOfNaryExpr(a.Rhss[1], locExpr); 
                            newCmdSeq.Add(new AssignCmd(Token.NoToken,
                                new List<AssignLhs>() {a.Lhss[0], a.Lhss[1]},
                                new List<Expr> () {d0, d1}));
                        }
                        else
                        {
                            newCmdSeq.Add(c);
                        }                        
                    }
                    else
                    {
                        newCmdSeq.Add(c);
                    }
                }
                return base.VisitCmdSeq(newCmdSeq);
            }
            private Expr SetFirstArgOfNaryExpr(Expr expr, IdentifierExpr locExpr)
            {
                if (!(expr is NAryExpr)) return expr;
                var e = expr as NAryExpr;
                if (e.Args.Count == 0) return expr;
                var nargs = new List<Expr>();
                for(int i = 0; i < e.Args.Count; ++i)
                    if (i == 0) nargs.Add(locExpr);
                    else nargs.Add(e.Args[i]);
                return new NAryExpr(Token.NoToken, e.Fun, nargs);
            }
            private Expr GetFirstArgFromNaryExpr(Expr expr)
            {
                if (!(expr is NAryExpr)) return null;
                var e = expr as NAryExpr;
                if (e.Args.Count == 0) return null;
                return e.Args[0];
            }
        }
        #endregion 

        public class MiscStatementPruner : StandardVisitor
        {
            public override List<Cmd> VisitCmdSeq(List<Cmd> cmdSeq)
            {
                var newCmdSeq = new List<Cmd>();
                foreach (Cmd c in cmdSeq)
                {
                    if (c is AssumeCmd)
                    {
                        Expr e = (c as AssumeCmd).Expr;
                        if (!exprContainsCtobplAssumption(e)) { newCmdSeq.Add(c); }
                    }
                    else { newCmdSeq.Add(c); }
                }
                return base.VisitCmdSeq(newCmdSeq);
            }
            private static bool exprContainsCtobplAssumption(Expr e)
            {
                if (e is NAryExpr)
                {
                    if (FunctionNameContains(e, "value_is")) { return true; }
                    else //recurse looking for imm
                    {
                        foreach (Expr e_sub in (e as NAryExpr).Args)
                        {
                            if (exprContainsCtobplAssumption(e_sub)) { return true; }
                        }
                        return false;
                    }
                }

                return false;
            }
            private static bool FunctionNameContains(Expr e, string s)
            {
                return (
                    (e is NAryExpr) &&
                   ((e as NAryExpr).Fun is FunctionCall) &&
                  (((e as NAryExpr).Fun as FunctionCall).FunctionName.Contains(s))
                );
            }
        }

        #region Utilities for displaying output information on the html file
        private static string HtmlifyString(string s)
        {
            return
                "<font face=\\\"monospace\\\"><font color=red size=6 style=\\\"background-color:black\\\"><b>&nbsp;" +
                s +
                "</b></font><br>"
                ;
        }

        public static Tuple<List<int>,List<int>> parseHtmlForCexLines(string[] l)
        {
            List<int> leftLines = new List<int>();
            List<int> rightLines = new List<int>();

            //parse html here
            for (int i = 0; i < l.Count(); )
            {
                while (i < l.Count() && !l[i].Contains(@"<tr><td valign=")) i++;
                while (i < l.Count() && !l[i].Contains(@"</td><td valign"))
                {
                    if (l[i].Contains(@"<span class=") &&
                        (l[i].Contains(@"trace") ||
                        l[i].Contains(@"reportstmt")
                        ))
                    {
                        var j = l[i].IndexOf(">");
                        var k = l[i].IndexOf(":");
                        var s = l[i].Substring(j + 1, k - j - 1);
                        leftLines.Add(int.Parse(s));
                    }
                    i++;
                }
                while (i < l.Count() && !l[i].Contains(@"</td></tr>"))
                {
                    if (l[i].Contains(@"<span class=") &&
                        (l[i].Contains(@"trace") ||
                        l[i].Contains(@"reportstmt")
                        ))
                    {
                        var j = l[i].IndexOf(">");
                        var k = l[i].IndexOf(":");
                        var s = l[i].Substring(j + 1, k - j - 1);
                        rightLines.Add(int.Parse(s));
                    }
                    i++;
                }
            }

            return new Tuple<List<int>, List<int>>(leftLines, rightLines);
        }

        public static List<string> ParseHtmlForCompilerOutput(string[] l, List<Tuple<BigNum, string, BigNum, string>> outs)
        {
            //Partition looks like (for CLR compiler output)
            //<tr><td valign="bottom">
            //Trace1
            //<span class="trace">21:&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;((s)&ensp;cmp&ensp;r0&ensp;0)</span><br>
            //<span class="reportstmt">37:&ensp;&ensp;&ensp;000036&ensp;F000&ensp;F800&ensp;&ensp;&ensp;bl&ensp;&ensp;&ensp;System.&ensp;Collections.&ensp;Generic.&ensp;Dictionary`2[System.&ensp;__Canon,System.&ensp;__Canon]:&ensp;ContainsKey(ref):&ensp;bool</span><br>
            //</td><td valign="top">
            //Trace2
            //<span class="trace">21:&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;((s)&ensp;cmp&ensp;r0&ensp;0)</span><br>
            //<span class="reportstmt">37:&ensp;&ensp;&ensp;000036&ensp;F000&ensp;F800&ensp;&ensp;&ensp;bl&ensp;&ensp;&ensp;System.&ensp;Collections.&ensp;Generic.&ensp;Dictionary`2[System.&ensp;__Canon,System.&ensp;__Canon]:&ensp;ContainsKey(ref):&ensp;bool</span><br>
            //</td></tr>
            var trace1 = new List<string>();
            var trace2 = new List<string>();
            var output = new List<string>(l);
            for (int i = 0; i < l.Count(); )
            {
                while (i < l.Count() && !l[i].Contains(@"<tr><td valign=")) i++;
                while (i < l.Count() && !l[i].Contains(@"</td><td valign"))
                {
                    if (l[i].Contains(@"<span class=") &&
                        (l[i].Contains(@"trace") ||
                        l[i].Contains(@"reportstmt")
                        ))
                    {
                        trace1.Add(l[i]);
                        var j = l[i].IndexOf(">");
                        var k = l[i].IndexOf(":");
                        var s = l[i].Substring(j + 1, k - j - 1);
                        foreach (var o in outs)
                        {
                            if (int.Parse(s) == o.Item1.ToInt)
                                output[i] = output[i] + HtmlifyString(o.Item2); //"--> <b>" +  o.Item2  + "</b> <---- <br>";
                        }
                    }
                    i++;
                }
                while (i < l.Count() && !l[i].Contains(@"</td></tr>"))
                {
                    if (l[i].Contains(@"<span class=") &&
                        (l[i].Contains(@"trace") ||
                        l[i].Contains(@"reportstmt")
                        ))
                    {
                        trace2.Add(l[i]);
                        var j = l[i].IndexOf(">");
                        var k = l[i].IndexOf(":");
                        var s = l[i].Substring(j + 1, k - j - 1);
                        foreach (var o in outs)
                        {
                            if (int.Parse(s) == o.Item3.ToInt)
                                output[i] = output[i] + HtmlifyString(o.Item4); //"--> <b>" + o.Item4 + "</b> <---- <br>";
                        }
                    }
                    i++;
                }
            }
            //Console.WriteLine("Trace1 = {0}, \n Trace2 = {1}", String.Join("\n ", trace1.ToArray()), String.Join("\n ", trace2.ToArray()));
            return output;
        }
        public static List<string> ParseRawHtmlForSymDiffOutputFromCompiler(string[] l, List<Tuple<BigNum, string, BigNum, string>> outs)
        {
            throw new NotImplementedException("Call ParseHtmlForCompilerOutput instead\n");
            //For the output html from the CLR diff tool
            //Partition looks like (for any html generated by SymDiff)
            //<span class="trace">14:&ensp;&ensp;000000&ensp;E92D&ensp;4830&ensp;&ensp;&ensp;push&ensp;&ensp;{r4,r5,r11,lr}</span><br>
            //</td><td valign="top"><br>
            //<span class="trace">8:&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;(Line&ensp;9)</span><br>
            //</td><td valign="top"><br>
            
            var trace1 = new List<string>();
            var trace2 = new List<string>();
            var output = new List<string>(l);
            for (int i = 0; i < l.Count(); )
            {
                while (!l[i].Contains(@"</td><td valign="))
                {
                    if (l[i].Contains(@"<span class=") &&
                        (l[i].Contains(@"trace")                        
                        ))
                    {
                        trace1.Add(l[i]);
                        var j = l[i].IndexOf(">");
                        var k = l[i].IndexOf(":");
                        var s = l[i].Substring(j + 1, k - j - 1);
                        foreach (var o in outs)
                        {
                            if (int.Parse(s) == o.Item1.ToInt)
                                output[i] = output[i] + HtmlifyString(o.Item2); //"--> " + o.Item2 + " <---- <br>";
                        }
                    }
                    i++;
                    if (i >= l.Count()) break;
                }
                if (i >= l.Count()) break;
                i++;
                if (i >= l.Count()) break;
                while (!l[i].Contains(@"</td><td valign="))
                {
                    if (l[i].Contains(@"<span class=") &&
                        (l[i].Contains(@"trace")
                        ))
                    {
                        trace2.Add(l[i]);
                        var j = l[i].IndexOf(">");
                        var k = l[i].IndexOf(":");
                        var s = l[i].Substring(j + 1, k - j - 1);
                        foreach (var o in outs)
                        {
                            if (int.Parse(s) == o.Item3.ToInt)
                                output[i] = output[i] + HtmlifyString(o.Item4); //"--> " + o.Item4 + " <---- <br>";
                        }
                    }
                    i++;
                    if (i >= l.Count()) break;
                }
            }
            //Console.WriteLine("Trace1 = {0}, \n Trace2 = {1}", String.Join("\n ", trace1.ToArray()), String.Join("\n ", trace2.ToArray()));
            return output;
        }
        public static List<string> ParseHtmlForSymDiffOutput(string[] l, List<Tuple<BigNum, string, BigNum, string>> outs)
        {
            //Output for regular symdiff 
            //Partition looks like (for any html generated by SymDiff)
            /*
             * <table><tr><td><font face="monospace">d:\tvm\projects\symb_diff\symdiff\test\c_examples\ex3\v1\foo.c:<br>
             * "<font face=\"monospace\"><font color=red size=3 style=\"background-color:yellow\"><b>14:&nbsp;&nbsp;&nbsp;&nbsp;else&nbsp;if&nbsp;(e->oper&nbsp;==&nbsp;2)&nbsp;</b></font><br>
             * </font><font face=\"monospace\">16:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e->result&nbsp;=&nbsp;e->op1&nbsp;-&nbsp;e->op2;&nbsp;<br>
             * 
             * </font><font face=\"monospace\"></td><td><br></font><font face=\"monospace\">4:&nbsp;&nbsp;&nbsp;&nbsp;int&nbsp;result;<br>
             * 
             * "<font face=\"monospace\"><font color=red size=3 style=\"background-color:yellow\"><b>14:&nbsp;&nbsp;&nbsp;&nbsp;else&nbsp;if&nbsp;(e->oper&nbsp;==&nbsp;2)&nbsp;</b></font><br>
             * </font><font face=\"monospace\">16:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e->result&nbsp;=&nbsp;e->op1&nbsp;-&nbsp;e->op2;&nbsp;<br>
             * 
             * </font><font face="monospace"></td><td><br></font></td></tr></table></body>
             */

            var trace1 = new List<string>();
            var trace2 = new List<string>();
            var output = new List<string>(l);
            for (int i = 0; i < l.Count(); )
            {
                while (i < l.Count() && !l[i].Contains(@"<table><tr><td>")) i++;
                //trace 1 starts
                while (i < l.Count() &&  !l[i].Contains(@"</td><td><br>"))
                {
                    if (l[i].Contains(@"<font face=") &&
                        (l[i].Contains(@"<font color=red")
                        ))
                    {
                        trace1.Add(l[i]);
                        var j = l[i].IndexOf("<b>");
                        var k = l[i].IndexOf(":&nbsp");
                        var s = l[i].Substring(j + 3, k - j - 3);
                        foreach (var o in outs)
                        {
                            if (int.Parse(s) == o.Item1.ToInt)
                                output[i] = output[i] + HtmlifyString(o.Item2); // "--> <b>" + o.Item2 + "</b> <---- <br>";
                        }
                    }
                    i++;
                }
                //trace 2 starts
                while (i < l.Count() && !l[i].Contains(@"</td></tr></table>"))
                {
                    if (l[i].Contains(@"<font face=") &&
                        (l[i].Contains(@"<font color=red")
                        ))
                    {
                        trace2.Add(l[i]);
                        var j = l[i].IndexOf("<b>");
                        var k = l[i].IndexOf(":&nbsp");
                        var s = l[i].Substring(j + 3, k - j - 3);
                        foreach (var o in outs)
                        {
                            if (int.Parse(s) == o.Item3.ToInt)
                                output[i] = output[i] + HtmlifyString(o.Item4); //"--> <b>" + o.Item4 + "</b> <---- <br>";
                        }
                    }
                    i++;
                }
            }
            //Console.WriteLine("Trace1 = {0}, \n Trace2 = {1}", String.Join("\n ", trace1.ToArray()), String.Join("\n ", trace2.ToArray()));
            return output;
        }



        public static void PrintHtmlOutput(List<Tuple<BigNum, string, BigNum, string>> htmlOutputs)
        {
            if (Options.htmlInput == "") return;
            var fileName = Options.htmlInput + ".html";
            if (!System.IO.File.Exists(fileName))
            {
                Console.WriteLine("Warning!! The input html file {0} does not exist", fileName);
                return;
            }
            var l = System.IO.File.ReadAllLines(fileName);
            //var o = ParseHtmlForCompilerOutput(l, leftLine, rightLine);
            List<string> o;
            if (Options.htmlInput.EndsWith(".analyze"))
                o = Utils.ParseHtmlForCompilerOutput(l, htmlOutputs); //stylized compiler output
            else
                o = Utils.ParseHtmlForSymDiffOutput(l, htmlOutputs);  //raw symdiff output
            var outFile = Options.htmlInput + "." + Options.htmlTag + ".rootcause.html"; //same directory as the input html
            Console.WriteLine("Writing output html to {0}", outFile);
            System.IO.File.WriteAllLines(outFile, o);
        }
        #endregion

        public static List<Expr> constructDemonicAxioms(Program prog)
        {
            List<Expr> axioms = new List<Expr>();
            List<Function> functions = prog.TopLevelDeclarations.OfType<Function>().ToList();
            for (int iter_i = 0; iter_i < functions.Count; iter_i++)
            {
                Function f = functions[iter_i];
                //if (!(f.Name.Contains("CallMem") || f.Name.Contains("CallOut"))) { continue; }
                //if (QKeyValue.FindBoolAttribute(f.Attributes, "uninterpreted"))
                //if ((f.Name.Contains("CallMem") || f.Name.Contains("CallOut")))
                if (QKeyValue.FindBoolAttribute(f.Attributes, "uninterpreted"))
                {
                    //Make axioms of the form: forall x1, x2 :: f(x1) == f(x2) ==> x1 == x2
                    var inParams = f.InParams.Cast<Variable>();
                    List<BoundVariable> boundedVars1 = new List<BoundVariable>();
                    List<BoundVariable> boundedVars2 = new List<BoundVariable>();
                    List<Expr> axiomBoundVars1 = new List<Expr>();
                    List<Expr> axiomBoundVars2 = new List<Expr>();
                    Expr axiomExpr = Expr.True;
                    foreach (Variable inParam in inParams)
                    {
                        //FIXME: check if another boundvariable by this name exists?
                        BoundVariable bvar1 = new BoundVariable(Token.NoToken, new TypedIdent(Token.NoToken, inParam.Name + "_1", inParam.TypedIdent.Type));
                        BoundVariable bvar2 = new BoundVariable(Token.NoToken, new TypedIdent(Token.NoToken, inParam.Name + "_2", inParam.TypedIdent.Type));
                        boundedVars1.Add(bvar1);
                        axiomBoundVars1.Add(new IdentifierExpr(Token.NoToken, bvar1));
                        boundedVars2.Add(bvar2);
                        axiomBoundVars2.Add(new IdentifierExpr(Token.NoToken, bvar2));
                        axiomExpr = Expr.And(axiomExpr, Expr.Eq(
                            new IdentifierExpr(Token.NoToken, bvar1), new IdentifierExpr(Token.NoToken, bvar2)));
                    }

                    if (inParams.Count() > 0)
                    {
                        axiomExpr.Typecheck(new TypecheckingContext(null));
                        Expr f_of_x1 = new NAryExpr(Token.NoToken, new FunctionCall(f), axiomBoundVars1);
                        f_of_x1.Typecheck(new TypecheckingContext(null));
                        Expr f_of_x2 = new NAryExpr(Token.NoToken, new FunctionCall(f), axiomBoundVars2);
                        f_of_x2.Typecheck(new TypecheckingContext(null));
                        Expr f_of_x1_eq_f_of_x2 = Expr.Eq(f_of_x1, f_of_x2);
                        f_of_x1_eq_f_of_x2.Typecheck(new TypecheckingContext(null));
                        Expr body = Expr.Imp(f_of_x1_eq_f_of_x2, axiomExpr);
                        body.Typecheck(new TypecheckingContext(null));

                        var TriggerSeq = new List<Expr>();
                        TriggerSeq.Add(f_of_x1);
                        TriggerSeq.Add(f_of_x2);

                        //Expr forall_x_P_of_x_eq_body = new ForallExpr(Token.NoToken, new VariableSeq(boundedVars1.Concat(boundedVars2).ToArray()), body);
                        Expr forall_x_P_of_x_eq_body = new ForallExpr(Token.NoToken,
                            new List<Variable>(boundedVars1.Concat(boundedVars2).ToArray()),
                            new Trigger(new Token(), true, TriggerSeq), body);
                        forall_x_P_of_x_eq_body.Typecheck(new TypecheckingContext(null));
                        axioms.Add(forall_x_P_of_x_eq_body);
                    }

                    //Make axioms of the form: forall x: f(x) != g(x)
                    for (int iter_j = iter_i; iter_j < functions.Count; iter_j++)
                    {
                        //find all functions with matching return
                        Function other_f = functions[iter_j];
                        if (other_f == f) { continue; }
                        if (QKeyValue.FindBoolAttribute(other_f.Attributes, "uninterpreted"))
                        {
                            if (other_f.OutParams.Count != f.OutParams.Count) { continue; }
                            bool matchingOutputs = true;
                            for (int iter_k = 0; iter_k < f.OutParams.Count; iter_k++)
                            {
                                if (f.OutParams[iter_k].TypedIdent.Type.ToString() != other_f.OutParams[iter_k].TypedIdent.Type.ToString())
                                {
                                    matchingOutputs = false;
                                }
                            }
                            if (!matchingOutputs) { continue; }
                            boundedVars1 = new List<BoundVariable>();
                            boundedVars2 = new List<BoundVariable>();
                            axiomBoundVars1 = new List<Expr>();
                            axiomBoundVars2 = new List<Expr>();
                            axiomExpr = Expr.True;
                            foreach (Variable inParam in inParams)
                            {
                                //FIXME: check if another boundvariable by this name exists?
                                BoundVariable bvar1 = new BoundVariable(Token.NoToken, new TypedIdent(Token.NoToken, inParam.Name, inParam.TypedIdent.Type));
                                boundedVars1.Add(bvar1);
                                axiomBoundVars1.Add(new IdentifierExpr(Token.NoToken, bvar1));
                            }
                            foreach (Variable inParam in other_f.InParams.Cast<Variable>())
                            {
                                //FIXME: check if another boundvariable by this name exists?
                                BoundVariable bvar2 = new BoundVariable(Token.NoToken, new TypedIdent(Token.NoToken, inParam.Name, inParam.TypedIdent.Type));
                                boundedVars2.Add(bvar2);
                                axiomBoundVars2.Add(new IdentifierExpr(Token.NoToken, bvar2));
                            }
                            Expr f_of_x = new NAryExpr(Token.NoToken, new FunctionCall(f), axiomBoundVars1);
                            f_of_x.Typecheck(new TypecheckingContext(null));
                            Expr other_f_of_y = new NAryExpr(Token.NoToken, new FunctionCall(other_f), axiomBoundVars2);
                            other_f_of_y.Typecheck(new TypecheckingContext(null));
                            Expr body = Expr.Not(Expr.Eq(f_of_x, other_f_of_y));
                            body.Typecheck(new TypecheckingContext(null));

                            if (inParams.Count() > 0 || other_f.InParams.Count > 0)
                            {
                                var TriggerSeq = new List<Expr>();
                                TriggerSeq.Add(f_of_x);
                                TriggerSeq.Add(other_f_of_y);

                                //ForallExpr forallexpr = new ForallExpr(Token.NoToken, new VariableSeq(boundedVars1.Concat(boundedVars2).ToArray()), body);
                                Expr forallexpr = new ForallExpr(Token.NoToken,
                                    new List<Variable>(boundedVars1.Concat(boundedVars2).ToArray()),
                                    new Trigger(new Token(), true, TriggerSeq), body);
                                forallexpr.Typecheck(new TypecheckingContext(null));
                                axioms.Add(forallexpr);
                            }
                            else
                            {
                                axioms.Add(body);
                            }
                        }
                    }
                }
            }
            if (Utils.verbosityLevel(3))
            {
                Console.WriteLine("Printing Axioms...");
                axioms.ForEach(a => Console.WriteLine(a));
            }

            return axioms;
        }

    }
}
