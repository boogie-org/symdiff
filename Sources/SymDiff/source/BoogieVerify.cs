using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Boogie;
using Microsoft.BaseTypes; //For BigNum
using SDiff.Boogie;
using System.IO;
using System.Text.RegularExpressions;
using System.Threading;
using Microsoft.Boogie.VCExprAST;
using SymDiffUtils;
using VC;
using Util = SymDiffUtils.Util;

namespace SDiff
{
    public class SDiffCounterexample : Triple<Counterexample, List<Block>, Implementation>
    {
        public SDiffCounterexample(Counterexample cex, List<Block> trace, Implementation impl)
            : base(cex, trace, impl)
        {
        }

        public Counterexample Cex
        {
            get { return fst; }
        }

        public List<Block> Trace
        {
            get { return snd; }
        }

        public Implementation Impl
        {
            get { return thd; }
        }
    }

    public class SDiffCounterexamples : List<SDiffCounterexample>
    {
    }

    public enum VerificationResult { Error, Verified, Inconclusive, TimeOut, OutOfMemory, TBA, Unknown };

    public class VerificationTask : Triple<Implementation, Implementation, Implementation>, IEmittable
    {
        public VerificationResult Result;
        public SDiffCounterexamples Counterexamples;
        public List<Variable> DesiredOutputVars;
        public VerificationTask(Implementation eq, Implementation left, Implementation right)
            : base(eq, left, right)
        {
            Result = VerificationResult.TBA;
            DesiredOutputVars = new List<Variable>();
        }

        public VerificationTask(Implementation eq, Implementation left, Implementation right, List<Variable> outputVars)
            : this(eq, left, right)
        {
            this.DesiredOutputVars.AddRange(outputVars);
        }

        public Implementation Eq
        {
            get { return fst; }
        }

        public Implementation Left
        {
            get { return snd; }
        }

        public Implementation Right
        {
            get { return thd; }
        }

        public void Emit(TokenTextWriter t)
        {
            t.Write("vtask: (" + Eq.Name + ", " + Left.Name + ", " + Right.Name + ")");
            if (DesiredOutputVars.Count > 0)
            {
                t.Write(" / ");
                foreach (var v in DesiredOutputVars)
                    t.Write(v.Name + "; ");
            }
            t.WriteLine();
        }

        public static List<VerificationTask> Parse(string filename, Dictionary<string, Declaration> progDict)
        {
            try
            {
                var in_s = new StreamReader(filename);

                var vts = new List<VerificationTask>();

                string l;
                while (!in_s.EndOfStream)
                {
                    l = in_s.ReadLine().Trim();
                    if (l.StartsWith("#"))
                        continue;
                    if (l.StartsWith("vtask:"))
                    {
                        l = l.Substring(6).Replace("(", "").Replace(")", "").Replace(" ", "");
                        string[] sts = l.Split('/');
                        var trp = sts[0].Split(',');
                        var vt = new VerificationTask(progDict.Get(trp[0] + "$IMPL") as Implementation,
                                                      progDict.Get(trp[1] + "$IMPL") as Implementation,
                                                      progDict.Get(trp[2] + "$IMPL") as Implementation);
                        if (sts.Length > 1)
                            vt.DesiredOutputVars =
                              sts[1].Trim().Replace(" ", "").Split(';').Map(x => progDict.Get(x + "$VAR")).ToList().Map(x => x as Variable).Filter(x => !x.Equals(""));
                        vts.Add(vt);
                    }

                }
                return vts;
            }
            catch
            {
                Log.Out(Log.Error, "Failed to parse verification tasks");
                return null;
            }
        }
    }






    public static class BoogieVerify
    {

        class VerifyImplCleanup : StandardVisitor
        {
            public override Cmd VisitAssertCmd(AssertCmd node)
            {
                node.IncarnationMap = null;
                return base.VisitAssertCmd(node);
            }

            public override Cmd VisitAssertEnsuresCmd(AssertEnsuresCmd node)
            {
                node.IncarnationMap = null;
                return base.VisitAssertEnsuresCmd(node);
            }

            public override Cmd VisitAssertRequiresCmd(AssertRequiresCmd node)
            {
                node.IncarnationMap = null;
                return base.VisitAssertRequiresCmd(node);
            }

        }


        public enum ReturnStatus { OK, NOK };

        // public static VcOutcome MyVerifyImplementation(Implementation impl, Program prog)
        // {
        //     VC.ConditionGeneration vcgen = BoogieVerify.InitializeVC(prog);
        //     var outcome = vcgen.VerifyImplementation(impl, out var errs, "TODO:requestId", CancellationToken.None) ;
        //     vcgen.Close();
        //     return outcome;
        // }
        public static VerificationResult VerifyImplementation(VC.ConditionGeneration vcgen, Implementation impl, Program prog, out SDiffCounterexamples cex)
        {

            VerifyImplCleanup vic;
            vic = new VerifyImplCleanup();
            vic.Visit(prog);


            cex = null;

            if (impl == null)
            {
                Log.Out(Log.Urgent, "VerifyImplementation saw null implementation");
                return VerificationResult.Unknown;
            }

            //Log.Out(Log.Verifier, "Verifying implementation " + impl.Name);

            List<Counterexample> errors;
            VerificationResult sdoutcome = VerificationResult.Unknown;
            List<VerificationRunResult> vcResults;
            VcOutcome outcome;

            //Log.Out(Log.Verifier, "Saving implementation before Boogie preprocessing");
            var duper = new Duplicator();
            var imperativeBlocks = new Dictionary<string, Block>();
            foreach (Block b in impl.Blocks)
                //new: to avoid repeated blocks (MYSTERY)
                if (!imperativeBlocks.ContainsKey(b.Label))
                    imperativeBlocks.Add(b.Label, duper.VisitBlock(b));

            var inlineOptPrev = BoogieUtils.BoogieOptions.ProcedureInlining;
            if (Options.UnsoundRecursion)
            {
                BoogieUtils.BoogieOptions.ProcedureInlining = CoreOptions.Inlining.Spec;
            }
            var engine = new ExecutionEngine(BoogieUtils.BoogieOptions, new VerificationResultCache(),
                CustomStackSizePoolTaskScheduler.Create(16 * 1024 * 1024, 1));
            engine.EliminateDeadVariables(prog);
            engine.CoalesceBlocks(prog);
            engine.Inline(prog);
            engine.Dispose();
            BoogieUtils.BoogieOptions.ProcedureInlining = inlineOptPrev;

            var assumeFlags = new QKeyValue(Token.NoToken, "captureState", new List<object>{ "final_state" }, null);
            AssumeCmd ac = new AssumeCmd(Token.NoToken, new LiteralExpr(Token.NoToken, true), assumeFlags);
            impl.Blocks.Last().Cmds.Add(ac);

            try
            {
                var start = DateTime.Now;
                (outcome, errors, vcResults) =
                    vcgen.VerifyImplementation2(new ImplementationRun(impl, Console.Out), CancellationToken.None).Result;
                var end = DateTime.Now;

                TimeSpan elapsed = end - start;
                Console.WriteLine(string.Format("  [{0} s]  ", elapsed.TotalSeconds));
            }
            catch (VC.VCGenException e)
            {
                Log.Out(Log.Error, "Error BP5010: {0}  Encountered in implementation {1}: " + e.Message);
                errors = null;
                outcome = VcOutcome.Inconclusive;
            }
            catch (UnexpectedProverOutputException upo)
            {
                Log.Out(Log.Error, "Advisory: {0} SKIPPED because of internal error: unexpected prover output: {1}" + upo.Message);
                errors = null;
                outcome = VcOutcome.Inconclusive;
            }
            catch (Exception e)
            {
                Log.Out(Log.Error, "Unknown error somewhere in verification: ");
                Log.Out(Log.Error, e.ToString());
                return VerificationResult.Unknown;
            }

            switch (outcome)
            {
                case VcOutcome.Correct:
                    sdoutcome = VerificationResult.Verified;
                    break;
                case VcOutcome.Errors:
                    sdoutcome = VerificationResult.Error;
                    break;
                case VcOutcome.Inconclusive:
                    sdoutcome = VerificationResult.Inconclusive;
                    break;
                case VcOutcome.OutOfMemory:
                    sdoutcome = VerificationResult.OutOfMemory;
                    break;
                case VcOutcome.TimedOut:
                    sdoutcome = VerificationResult.TimeOut;
                    break;
            }

            Log.Out(Log.Normal, outcome.ToString());

            var eqVarName = "";
            if (errors != null && errors.Count() == 1)
            {
                //eqVarName = errors[0];
            }

            Log.Out(Log.Verifier, (errors == null ? 0 : errors.Count) + " counterexamples...");

            if (errors != null)
            {
                cex = new SDiffCounterexamples();
                for (int i = 0; i < errors.Count; i++)
                {
                    if (Options.EnumerateAllPaths) {
                        //just remove any time for this option
                        cex.Add(new SDiffCounterexample(errors[i], null, impl));
                        continue;
                    }

                    //reconstruct trace in terms of imperative blocks
                    var trace = ReconstructImperativeTrace(errors[i].Trace, imperativeBlocks);
                    if (SymEx.TraceValidator.Validate(trace))
                    {
                        Log.Out(Log.Cex, "Trace " + "[" + i + "]:");
                        Log.Out(Log.Cex, "Validating...");
                        Log.Out(Log.Cex, "Trace is not complete! Printing..");
                        SDiff.SymEx.CexDumper.PrintTrace(trace);
                        continue;
                    }
                    else
                    {
                        //Log.Out(Log.Cex, "Trace OK");
                        if (Options.DumpValidTraces)
                            SDiff.SymEx.CexDumper.PrintTrace(trace);
                    }

                    cex.Add(new SDiffCounterexample(errors[i], trace, impl));
                }
            }

            return sdoutcome;
        }

        public static VC.ConditionGeneration InitializeVC(Program prog)
        {
            var opts = CommandLineOptions.FromArguments(Console.Out);
            opts.PrintErrorModel = 1;
            if (!MonomorphismChecker.IsMonomorphic(prog))
            {
                Log.Out(Log.Warning, "Warning: Polymorphism detected in input.");
                opts.TypeEncodingMethod = CoreOptions.TypeEncoding.Arguments;
            }
            var checkerPool = new CheckerPool(opts);
            VC.ConditionGeneration vcgen;
            try
            {
                vcgen = new VerificationConditionGenerator(prog, checkerPool);
            }
            catch (ProverException)
            {
                Log.Out(Log.Error, "Fatal Error: ProverException: {0}");
                return null;
            }

            return vcgen;
        }

        //inputs the blocks over the original program starting from the blocks over the SSA/transformed program
        public static List<Block> ReconstructImperativeTrace(List<Block> blocks, Dictionary<string, Block> originalBlocks)
        {
            var newBlocks = new List<Block>();
            foreach (Block b in blocks)
            {
                Block ib;
                originalBlocks.TryGetValue(b.Label, out ib);
                if (ib == null)
                {
                    Log.Out(Log.TraceValidator, "Could not find block " + b.Label);
                    if (Log.Gate(Log.TraceValidator))
                        b.Emit(new TokenTextWriter(Console.Out, true, BoogieUtils.BoogieOptions), 0);
                }
                else
                    newBlocks.Add(ib);
            }
            return newBlocks;
        }

        public static void ProcessCounterexamples(SDiffCounterexamples errors, List<Variable> globals, List<Variable> outputVars, Program prog, Implementation vtLeftProcImpl, Implementation vtRightProcImpl)
        {
            List<Expr> constraintExprs = new List<Expr>();
            for (int i = 0; i < errors.Count; i++)
            {
                var impl = errors[i].Impl;
                var trace = errors[i].Trace;

                Log.Out(Log.Normal, "Attempting symbolic execution of [" + (i + 1) + "] $ " + impl.Name);


                if (Options.GenerateCTrace)
                {
                    Log.Out(Log.Normal, "Constructing metatrace from location annotations");
                    var extractor = new SDiff.SymEx.TraceExtractor();
                    extractor.VisitTrace(trace);
                    //Log.Out(Log.CTrace, CTrace.Make(extractor.metaTrace));
                    var cTrace = CTrace.Make(extractor.metaTrace, null, null, "", "");
                    //var cTrace = "";    
                    if (cTrace.Trim() != "")
                    {
                        var fname = impl.Name + "_cex_" + (i + 1) + "_out.c";
                        var cexOut = new TokenTextWriter(impl.Name + "_cex_" + (i + 1) + "_out.c",
                            TextWriter.Null, true, true, PrintOptions.Default);
                        cexOut.WriteLine(cTrace);
                        cexOut.Close();
                        Log.Out(Log.CTrace, "n:" + (i + 1) + ":" + fname);
                        Log.Out(Log.CTrace, "w:" + fname);
                    }
                }

                Log.Out(Log.Normal, "Desugaring calls");
                //HACK!!!: changes havoc x; assume (x= uf(..)); --> x := uf(...)
                var deCall = new SDiff.SymEx.DesugarCallCmds();
                trace = deCall.VisitTrace(trace);

                //symbolic constants
                var symInParams = new List<Variable>(impl.InParams);
                foreach (var g in globals)
                    symInParams.Add(g);

                Log.Out(Log.Normal, "Executing trace downward");
                //symbolic stores (look at symex.cs for the datastructure)
                var sTrace = SDiff.SymEx.Cexecutor.ExecDown(trace, symInParams);
                Log.Out(Log.Normal, "Executing trace upward");
                //looks at each assume to create the path constants
                //clean up the duplication of assignments
                SDiff.SymEx.Cexecutor.ExecUp(sTrace);

                if (Options.DumpSymTrace)
                    SDiff.SymEx.CexDumper.PrintSymbolicTrace(sTrace);

                //printing the symbolic stores at exit
                //still in SSA form  
                Log.Out(Log.Normal, "Grabbing final execution values");
                var lastStore = sTrace.LastSCmd().Gammas.Last();
                var firstCons = sTrace.FirstSCmd().Cons;

                //resolves the outputs to be expressions over uif and symbolic constants only
                Log.Out(Log.Normal, "Resolving result expressions");
                var outSymExprs = new List<Expr>();
                foreach (var v in outputVars)
                    outSymExprs.Add(SymEx.ResolveSymExpr.Resolve(v, lastStore));


                Log.Out(Log.SymEx, "SymEx Results===================================");

                Log.Out(Log.SymEx, "Input constraint");
                if (Options.EraseUFArgumentsOnPrintout) // f(..)
                {
                    var eraser = new ArgumentParameterEraser();
                    var duper = new Duplicator();
                    var dupConst = new SDiff.SymEx.Constraint(firstCons, true);
                    foreach (var e in dupConst.Conjuncts)
                    {
                        eraser.VisitExpr(e);
                    }
                    Log.LogEmit(Log.SymEx, 1, dupConst.Emit);
                }
                else
                {
                    Log.LogEmit(Log.SymEx, 1, firstCons.Emit);
                }

                constraintExprs.Add(firstCons.Conjoin());

                Console.WriteLine();


                Log.Out(Log.SymEx, "Symbolic output values");

                var outSymExprsPrintable = outSymExprs;
                if (Options.EraseUFArgumentsOnPrintout) // f(..)
                {
                    outSymExprsPrintable = new List<Expr>();
                    var eraser = new ArgumentParameterEraser();
                    var duper = new Duplicator();
                    foreach (Expr e in outSymExprs)
                    {
                        var ex = duper.VisitExpr(e);
                        eraser.VisitExpr(ex);
                        outSymExprsPrintable.Add(ex);
                    }
                }

                //if the output variables aren't paired, iterate through normally
                if (outputVars.Count % 2 != 0)
                    for (int j = 0; j < outputVars.Count; j++)
                    {
                        Log.Out(Log.SymEx, "\t" + outputVars[j].ToString() + ": ");
                        Log.LogEmit(Log.SymEx, 2, outSymExprsPrintable[j].Emit);
                        Log.Out(Log.Normal, "");
                    }
                //otherwise don't print a pair if it's syntactically equal
                else
                    for (int j = 0; j < outputVars.Count; j += 2)
                    {
                        if (!outSymExprs[j].StringEquals(outSymExprs[j + 1]))
                        {
                            Log.Out(Log.SymEx, "\t" + outputVars[j].ToString() + ": ");
                            Log.LogEmit(Log.SymEx, 2, outSymExprsPrintable[j].Emit);
                            Log.Out(Log.Normal, "");
                            Log.Out(Log.SymEx, "\t" + outputVars[j + 1].ToString() + ": ");
                            Log.LogEmit(Log.SymEx, 2, outSymExprsPrintable[j + 1].Emit);
                            Log.Out(Log.Normal, "");
                        }
                    }
            }
            Expr disjunctionDiffCond = Expr.False;

            if (Options.PropagateSingleDifference && errors.Count > 1)
            {
                var t = constraintExprs.First();
                disjunctionDiffCond = Expr.Or(disjunctionDiffCond, constraintExprs.First());
            }
            else
            {
                foreach (Expr currentExpr in constraintExprs)
                {
                    disjunctionDiffCond = Expr.Or(disjunctionDiffCond, currentExpr);
                }
            }

            ProcessCounterexampleForDiffInline(errors, vtLeftProcImpl, vtRightProcImpl, disjunctionDiffCond);
        }
        public static void ProcessCounterexamplesWOSymbolicOut(SDiffCounterexamples errors, List<Variable> globals, List<Variable> eqLocVars, Implementation vtLeftProcImpl, Implementation vtRightProcImpl, List<Declaration> consts, List<Model> errModelList)
        {
            //inlining Cex (trace) within the Diff_inline body
            var impName = errors[0].Impl.Name.Replace("EQ_", "");
            var index = impName.IndexOf("__xx__"); //avoid aliasing with funcs with x___y names
            var v1Name = impName.Substring(0, index);
            var v2Name = impName.Substring(index + 6);
            var indexPointV1Name = v1Name.IndexOf(".");
            var indexPointV2Name = v2Name.IndexOf(".");
            v1Name = v1Name.Substring(0, indexPointV1Name);
            v2Name = v2Name.Substring(0, indexPointV2Name);

            ProcessCounterexamplesWOSymbolicOut(errors, globals, eqLocVars, vtLeftProcImpl, vtRightProcImpl, consts, errModelList, v1Name, v2Name);
        }
        public static void ProcessCounterexamplesWOSymbolicOut(SDiffCounterexamples errors, List<Variable> globals, List<Variable> eqLocVars, 
            Implementation vtLeftProcImpl, Implementation vtRightProcImpl, List<Declaration> consts, List<Model> errModelList,
            string v1Name, string v2Name)
        {
            List<Expr> constraintExprs = new List<Expr>();
            List<Block> listBlocksV1 = new List<Block>();
            List<Block> listBlocksV2 = new List<Block>();
            Model[] errModelArray = errModelList.ToArray();

            var label = new GotoCmd(Token.NoToken, new List<String>() { "DONE" });
            label.labelNames = new List<string>(); // label.labelTargets = new List<Block>();
            label.labelNames.Add("DONE"); //label.labelTargets.Add("DONE");


            // First block
            var labels = new List<String>();

            for (int j = 0; j < errors.Count; j++)
            {
                labels.Add("Cex" + j);
            }

            labels.Add("ELSE");
            var labelEntry = new GotoCmd(Token.NoToken, labels);
            labelEntry.labelTargets = new List<Block>();

            for (int j = 0; j < errors.Count; j++)
            {
                labelEntry.labelNames.Add("Cex" + j);//labelEntry.labelTargets.Add("Cex" + j);
            }

            for (int i = 0; i < errors.Count; i++)
            {
                var impl = errors[i].Impl;
                var trace = errors[i].Trace;

                //Log.Out(Log.Normal, "Attempting symbolic execution of [" + i + "] $ " + impl.Name);


                if (Options.GenerateCTrace)
                {
                    Log.Out(Log.Normal, "Constructing metatrace from location annotations");
                    var extractor = new SDiff.SymEx.TraceExtractor();
                    extractor.VisitTrace(trace);
                    //Log.Out(Log.CTrace, CTrace.Make(extractor.metaTrace));
                    var cTrace = CTrace.Make(extractor.metaTrace, consts, errModelArray[i], v1Name, v2Name);
                    //var cTrace = "";
                    if (cTrace.Trim() != "")
                    {

                        //note that the index for cex on the output shows 1,2,..., instead of 0,1,2....
                        var fname = impl.Name + "_cex_" + (i + 1) + "_out.c";
                        var cexOut = new TokenTextWriter(impl.Name + "_cex_" + (i + 1) + "_out.c", true, BoogieUtils.BoogieOptions);
                        cexOut.WriteLine(cTrace);
                        cexOut.Close();
                        Log.Out(Log.CTrace, "n:" + (i + 1) + ":" + fname);
                        Log.Out(Log.CTrace, "w:" + fname);
                    }
                }

                Log.Out(Log.Normal, "Desugaring calls");
                //HACK!!!: changes havoc x; assume (x= uf(..)); --> x := uf(...)
                var deCall = new SDiff.SymEx.DesugarCallCmds();
                trace = deCall.VisitTrace(trace);

                //symbolic constants
                var symInParams = new List<Variable>(impl.InParams);
                foreach (var g in globals)
                    symInParams.Add(g);

                Log.Out(Log.Normal, "Executing trace downward");
                //symbolic stores (look at symex.cs for the datastructure)
                // var sTrace = SDiff.SymEx.Cexecutor.ExecDown(trace, symInParams);
                Log.Out(Log.Normal, "Executing trace upward");
                //looks at each assume to create the path constants
                //clean up the duplication of assignments
                //SDiff.SymEx.Cexecutor.ExecUp(sTrace);

                Log.Out(Log.Normal, "Grabbing final execution values");
                // var lastStore = sTrace.LastSCmd().Gammas.Last();
                // var firstCons = sTrace.FirstSCmd().Cons;

                // constraintExprs.Add(firstCons.Conjoin());

                //#hemr - generating new strategy right here with inlining counterexamples!

                // Second block
                List<Cmd> cmdsV1_Diff_inline = new List<Cmd>();
                List<Cmd> cmdsV2_Diff_inline = new List<Cmd>();

                Substitution replaceScopeV1 = delegate(Variable x)
                {
                    return replaceScopeGeneric(vtLeftProcImpl, x);
                };

                Substitution replaceScopeV2 = delegate(Variable x)
                {
                    return replaceScopeGeneric(vtRightProcImpl, x);
                };

                foreach (Block currentBlock in trace)
                {
                    if (currentBlock.ToString().Contains("inline$" + v1Name))
                    {
                        foreach (Cmd currentCmd in currentBlock.Cmds)
                        {
                            Cmd newCmd = Substituter.Apply(replaceScopeV1, currentCmd);
                            cmdsV1_Diff_inline.Add(newCmd);
                        }
                    }
                    else if (currentBlock.ToString().Contains("inline$" + v2Name))
                    {
                        foreach (Cmd currentCmd in currentBlock.Cmds)
                        {
                            Cmd newCmd = Substituter.Apply(replaceScopeV2, currentCmd);
                            cmdsV2_Diff_inline.Add(newCmd);
                        }
                    }
                }

                Block blockV1 = new Block(Token.NoToken, "Cex" + i, cmdsV1_Diff_inline, label);
                Block blockV2 = new Block(Token.NoToken, "Cex" + i, cmdsV2_Diff_inline, label);

                listBlocksV1.Add(blockV1);
                listBlocksV2.Add(blockV2);

                //#hemr - displaying values related to error model (at console level)

                Model currentModel = errModelArray[i];

                //var keys = currentModel.identifierToPartition.Keys;
                var keys = currentModel.Functions.Where(f => f.Arity == 0).Select(f => f.GetConstant());

        
            }

            Expr disjunctionDiffCond = Expr.False;

            foreach (Expr currentExpr in constraintExprs)
            {
                disjunctionDiffCond = Expr.Or(disjunctionDiffCond, currentExpr);
            }

            ProcessCounterexampleForDiffInliningWOSymbolicOut(eqLocVars, vtLeftProcImpl, vtRightProcImpl, v1Name, v2Name, listBlocksV1, listBlocksV2, labelEntry);
        }

        //additional stuff needed to do for diff inlining is on
        private static void ProcessCounterexampleForDiffInline(SDiffCounterexamples errors, Implementation vtLeftProcImpl, Implementation vtRightProcImpl, Expr disjunctionDiffCond)
        {
            if (vtLeftProcImpl != null && vtRightProcImpl != null)
            {
                var blocksLeftProcImpl = vtLeftProcImpl.Blocks.ToArray();
                var blocksRightProcImpl = vtRightProcImpl.Blocks.ToArray();
                var firstCmdSecondBlockLeft = new AssumeCmd(Token.NoToken, disjunctionDiffCond);
                var firstCmdSecondBlockRight = new AssumeCmd(Token.NoToken, disjunctionDiffCond);
                var firstCmdThirdBlockLeft = new AssumeCmd(Token.NoToken, Expr.Not(disjunctionDiffCond));
                var firstCmdThirdBlockRight = new AssumeCmd(Token.NoToken, Expr.Not(disjunctionDiffCond));

                if (Options.PropagateSingleDifference && errors.Count > 1)
                {
                    firstCmdThirdBlockLeft = new AssumeCmd(Token.NoToken, Expr.False);
                    firstCmdThirdBlockRight = new AssumeCmd(Token.NoToken, Expr.False);
                }

                var leftSecondBlockCmdElems = blocksLeftProcImpl[1].Cmds;
                var leftThirdBlockCmdElems = blocksLeftProcImpl[2].Cmds;
                var rightSecondBlockCmdElems = blocksRightProcImpl[1].Cmds;
                var rightThirdBlockCmdElems = blocksRightProcImpl[2].Cmds;

                leftSecondBlockCmdElems[0] = firstCmdSecondBlockLeft;
                leftThirdBlockCmdElems[0] = firstCmdThirdBlockLeft;
                rightSecondBlockCmdElems[0] = firstCmdSecondBlockRight;
                rightThirdBlockCmdElems[0] = firstCmdThirdBlockRight;

                blocksLeftProcImpl[1].Cmds= leftSecondBlockCmdElems;
                blocksLeftProcImpl[2].Cmds= leftThirdBlockCmdElems;
                blocksRightProcImpl[1].Cmds = rightSecondBlockCmdElems;
                blocksRightProcImpl[2].Cmds = rightThirdBlockCmdElems;
            }
        }
        private static void ProcessCounterexampleForDiffInliningWOSymbolicOut(List<Variable> eqLocVars, Implementation vtLeftProcImpl, Implementation vtRightProcImpl, string v1Name, string v2Name, List<Block> listBlocksV1, List<Block> listBlocksV2, GotoCmd labelEntry)
        {
            if (vtLeftProcImpl != null && vtRightProcImpl != null) //only when diff inlining is on
            {
                var blocksLeftProcImpl = vtLeftProcImpl.Blocks.ToArray();
                var blocksRightProcImpl = vtRightProcImpl.Blocks.ToArray();
                var firstCmdThirdBlockLeft = new AssumeCmd(Token.NoToken, Expr.Not(Expr.True));
                var firstCmdThirdBlockRight = new AssumeCmd(Token.NoToken, Expr.Not(Expr.True));

                var leftThirdBlockCmdElems = blocksLeftProcImpl[2].Cmds;
                var rightThirdBlockCmdElems = blocksRightProcImpl[2].Cmds;

                leftThirdBlockCmdElems[0] = firstCmdThirdBlockLeft;
                rightThirdBlockCmdElems[0] = firstCmdThirdBlockRight;

                blocksLeftProcImpl[2].Cmds = leftThirdBlockCmdElems;
                blocksRightProcImpl[2].Cmds = rightThirdBlockCmdElems;

                // re-building the first block (only the goto cmds)
                blocksLeftProcImpl[0].TransferCmd = labelEntry;
                blocksRightProcImpl[0].TransferCmd = labelEntry;

                // removing the second block
                vtLeftProcImpl.Blocks.RemoveAt(1);
                vtRightProcImpl.Blocks.RemoveAt(1);

                foreach (Block currentBlockV1 in listBlocksV1)
                {
                    vtLeftProcImpl.Blocks.Add(currentBlockV1);
                }

                foreach (Block currentBlockV2 in listBlocksV2)
                {
                    vtRightProcImpl.Blocks.Add(currentBlockV2);
                }

                //vtLeftProcImpl.Blocks.Add(blockV1);
                //vtRightProcImpl.Blocks.Add(blockV2);

                //hemr - handling local variable declarations
                List<Variable> locVarsV1_diff_inline = new List<Variable>();
                List<Variable> locVarsV2_diff_inline = new List<Variable>();

                foreach (Variable currentVariable in eqLocVars)
                {
                    if (currentVariable.ToString().Contains("inline$" + v1Name))
                    {
                        locVarsV1_diff_inline.Add(currentVariable);
                    }

                    else if (currentVariable.ToString().Contains("inline$" + v2Name))
                    {
                        locVarsV2_diff_inline.Add(currentVariable);
                    }
                }

                vtLeftProcImpl.LocVars = locVarsV1_diff_inline;
                vtRightProcImpl.LocVars = locVarsV2_diff_inline;
            }
        }

        private static Expr replaceScopeGeneric(Implementation procImpl, Variable x)
        {
            if (procImpl == null) //#hemr - Can be null when we do not have callers for this proc!
                return Expr.Ident(x);

            foreach (var currentVar in procImpl.Proc.InParams)
            {
                Variable v = (Variable)currentVar;
                if (currentVar != null)
                {
                    if (v.Name.Equals(x.Name))
                    {
                        Log.Out(Log.Normal, "InParam = " + x.Name + " ProcImplName = " + procImpl.Name);
                        return Expr.Ident(v);
                    }
                }
            }

            foreach (var currentVar in procImpl.Proc.OutParams)
            {
                Variable v = (Variable)currentVar;
                if (currentVar != null)
                {
                    if (v.Name.Equals(x.Name))
                    {
                        Log.Out(Log.Normal, "OutParam = " + x.Name + " ProcImplName = " + procImpl.Name);
                        return Expr.Ident(v);
                    }
                }
            }

            return Expr.Ident(x);
        }

        public static void ProcessDiffInlineProc(List<Expr> constraints, VerificationTask vt, Program prog)
        {
            var eqProcName = vt.Eq.Name;
            eqProcName = eqProcName.Replace("EQ_", "");
            int index = eqProcName.IndexOf("__xx__");
            var procNameV1 = eqProcName.Substring(0, index);
            var procNameV2 = eqProcName.Substring(index + 6);


        }
        static public void ReplaceInFile(string filePath, string searchText, string replaceText)
        {
            StreamReader reader = new StreamReader(filePath);
            StreamWriter writer = new StreamWriter("RS" + filePath);
            string line;
            while ((line = reader.ReadLine()) != null)
            {
                line = Regex.Replace(line, searchText, replaceText);
                writer.WriteLine(line);
            }
            reader.Close();
            writer.Close();
        }
        public static int RunVerificationTask(VerificationTask vt, Program prog, out bool crashed, bool wrapper = true)
        {
            crashed = false;

            var attList = new List<Object>(1) { Expr.Literal(1) };

            //save attributes
            var sqkLeft = vt.Left.Attributes;
            var sqkpLeft = vt.Left.Proc.Attributes;
            var sqkRight = vt.Right.Attributes;
            var sqkpRight = vt.Right.Proc.Attributes;

            //save postconditions
            var leftPosts = vt.Left.Proc.Ensures;
            var rightPosts = vt.Right.Proc.Ensures;

            //The ensures must have been removed at the time of stripContracts
            //The recursive case is handled by RVT option anyway.
            //vt.Left.Proc.Ensures = new List<Ensures>();
            //vt.Right.Proc.Ensures = new List<Ensures>();

            //inline procedures under analysis
            vt.Left.Attributes
              = Util.MkInlinedAttribute(attList);
            vt.Left.Proc.Attributes = vt.Left.Attributes;

            vt.Right.Attributes
              = Util.MkInlinedAttribute(attList);
            vt.Right.Proc.Attributes = vt.Right.Attributes;

            //RUN INLINER OVER EQ FUNCTION
            vt.Left.OriginalBlocks = vt.Left.Blocks;
            vt.Left.OriginalLocVars = vt.Left.LocVars;
            vt.Right.OriginalBlocks = vt.Right.Blocks;
            vt.Right.OriginalLocVars = vt.Right.LocVars;

            // inline diff_inline procedures
            IEnumerable<Declaration> procImplPIter = prog.TopLevelDeclarations.Where(x => x is Implementation);
            foreach (Implementation currentProcImpl in procImplPIter)
            {
                if (currentProcImpl.Name.Contains("_Diff_Inline"))
                {
                    currentProcImpl.Attributes = Util.MkInlinedAttribute(attList);
                    currentProcImpl.Proc.Attributes = Util.MkInlinedAttribute(attList);

                    //RUN INLINER OVER EQ FUNCTION
                    currentProcImpl.OriginalBlocks = currentProcImpl.Blocks;
                    currentProcImpl.OriginalLocVars = currentProcImpl.LocVars;
                }
            }

            // prog = EQ program
            // vt.Eq = EQ_f_f' procedure with f, f' having {inline} tags

            SDiffCounterexamples SErrors = null;
            Implementation newEq = null;
            Program newProg = null;
            Dictionary<string, Declaration> newDict = null;


            Log.Out(Log.Verifier, "Verifying " + vt.Eq.Name);
            if (Options.TraceVerify)
            {
                Log.Out(Log.Normal, "Ready to verify:");
                Log.LogEmit(Log.Normal, prog.Emit);
            }

            // To print the EQ files in 
            Util.DumpBplAST(prog, vt.Eq.Name + "_out.bpl");
            //RS: Uncomment this

            /*if (wrapper)
            {
                prog.RemoveTopLevelDeclaration(vt.Eq);
                prog.RemoveTopLevelDeclaration(vt.Eq.Proc);
            }*/
            prog = null;
            ReplaceInFile(vt.Eq.Name + "_out.bpl", "@", "_");
            if (!wrapper)
            {
                prog = BoogieUtils.ParseProgram("RS" + vt.Eq.Name + "_out.bpl");

                if (prog == null)
                {
                    Log.Out(Log.Verifier, "Parse Error!!! in   " + vt.Eq.Name);
                    return 1;
                }
                if (BoogieUtils.ResolveAndTypeCheckThrow(prog, Options.MergedProgramOutputFile, BoogieUtils.BoogieOptions))
                    return 1;

                newEq = vt.Eq;
                newProg = prog;

                var vcgen = InitializeVC(newProg);
                //SDiff.Boogie.Process.ResolveAndTypeCheck(newProg, "");
                newDict = SDiff.Boogie.Process.BuildProgramDictionary(newProg.TopLevelDeclarations.ToList());

                //RS: Uncomment this
                newEq = (Implementation)newDict.Get(vt.Eq.Name + "$IMPL");

                vt.Result = VerifyImplementation(vcgen, newEq, newProg, out SErrors);
                vt.Counterexamples = SErrors;

                switch (vt.Result)
                {
                    case VerificationResult.Error:
                        Log.Out(Log.Verifier, "Result: Error");
                        break;
                    case VerificationResult.Verified:
                        Log.Out(Log.Verifier, "Result: Verified");
                        break;
                    case VerificationResult.OutOfMemory:
                        Log.Out(Log.Verifier, "Result: OutOfMemory");
                        break;
                    case VerificationResult.TimeOut:
                        Log.Out(Log.Verifier, "Result: TimeOut");
                        break;
                    default:
                        Log.Out(Log.Verifier, "Result: Unhandled");
                        crashed = true;
                        break;
                }
                vcgen.Close();
            }
            //restore postconditions IN THE OLD IN-MEMORY PROGRAM
            vt.Left.Proc.Ensures = leftPosts;
            vt.Right.Proc.Ensures = rightPosts;

            //remove the inline annotation IN THE OLD IN-MEMORY PROGRAM
            vt.Left.Attributes = sqkLeft;
            vt.Left.Proc.Attributes = sqkpLeft;
            vt.Right.Attributes = sqkRight;
            vt.Right.Proc.Attributes = sqkpRight;

            //remove the inline annotation in the Diff_Inline Procedures
            foreach (Implementation currentProcImpl in procImplPIter)
            {
                if (currentProcImpl.Name.Contains("_Diff_Inline"))
                {
                    currentProcImpl.Attributes = null;
                    currentProcImpl.Proc.Attributes = null;
                }
            }
            if (!wrapper)
            {

                if (vt.Result != VerificationResult.Error) return 0; //even timeouts/unhandled, as we see timeouts with 1 error, 0 model

                //process counterexamples OVER THE NEW IN-MEMORY PROGRAM
                var outputVars = new List<Variable>();
                foreach (var v in vt.DesiredOutputVars)
                    outputVars.Add(newDict.Get(v.Name + "$VAR") as Variable);

                var globals = new List<Variable>();
                foreach (IdentifierExpr ie in newEq.Proc.Modifies)
                    globals.Add(ie.Decl);


                if (SErrors != null && SErrors.Count > 0) //change as now SErrors can be nonnull, yet Count == 0. Sometimes model.Count < SErrror!!
                {
                    //somewhat misnamed...
                    if (Options.DumpBeforeVerifying)
                    {
                        Log.Out(Log.SymEx, "Dumping procedure under verification");
                        newEq.Emit(Log.LogWriter, 0);
                    }
                    if (Options.DoSymEx)
                    {
                        var vtLeftProcImpl = (Implementation)Util.getDeclarationByName(vt.Left.Name + "_Diff_Inline", procImplPIter);
                        var vtRightProcImpl = (Implementation)Util.getDeclarationByName(vt.Right.Name + "_Diff_Inline", procImplPIter);

                        if (Options.PreciseDifferentialInline)
                        {
                            List<Declaration> consts = prog.TopLevelDeclarations.Where(x => x is Constant).ToList();
                            ProcessCounterexamplesWOSymbolicOut(
                                SErrors, globals, vt.Eq.LocVars, vtLeftProcImpl, vtRightProcImpl, consts, [SErrors[0].Cex.Model]);
                        }
                        else
                        {
                            ProcessCounterexamples(SErrors, globals, outputVars, newProg, vtLeftProcImpl, vtRightProcImpl);
                        }
                    }
                }

                return (SErrors == null ? 0 : SErrors.Count);
            }
            return 0;
        }

    }

}
