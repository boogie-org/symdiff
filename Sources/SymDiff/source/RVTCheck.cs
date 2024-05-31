using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Boogie;
using SDiff;
using SymDiffUtils;
using Util = SymDiffUtils.Util;


namespace RVT
{
    class RVTCheck
    {

        //Each function irrespective of the side will have a unique index. 
        //Each function should alreayd have a unique name because of the prefix. 
        public static Dictionary<string, int> fnNameToIndex1, fnNameToIndex2;
        public static Dictionary<int, string> fnIndexToName1, fnIndexToName2;

        //create fn Map over indices
        public static Dictionary<int, int> fnMapIndexDict;

        //Keep local copies of global call graph, merged program etc.
        public static SDiff.CallGraph cg;
        public static Program mergedProgram;
        public static Config cfg;
        public static Dictionary<string, string> funs;

        public static Dictionary<string, Duple<Duple<Procedure, Implementation>,
                                               List<Variable>>> eqProcsCreated;


        /// <summary>
        /// The entry point of the RVT decomposition method
        /// </summary>
        /// <param name="cg1"></param>
        /// <param name="cg2"></param>
        /// <param name="cgP"></param>
        /// <param name="cfgP"></param>
        /// <param name="mergedProgramP"></param>
        /// <param name="fnMap"></param>
        public static void RVTMain(SDiff.CallGraph cg1, SDiff.CallGraph cg2, SDiff.CallGraph cgP,
            Config cfgP, Program mergedProgramP,
            Dictionary<string, string> fnMap)
        {

            cg = cgP;
            mergedProgram = mergedProgramP;
            cfg = cfgP;
            funs = new Dictionary<string, string>(fnMap);
            eqProcsCreated = new Dictionary<string, Duple<Duple<Procedure, Implementation>, List<Variable>>>();

            //compute the cg sizes 
            int cg1size, cg2size;

            var cg1Nodes = cg1.GetNodes();
            var cg2Nodes = cg2.GetNodes();

            cg1size = cg1Nodes.Count();
            cg2size = cg2Nodes.Count();

            //create the mapping from fn --> index
            fnNameToIndex1 = new Dictionary<string, int>();
            fnIndexToName1 = new Dictionary<int, string>();
            fnNameToIndex2 = new Dictionary<string, int>();
            fnIndexToName2 = new Dictionary<int, string>();
            int count = 0;
            string[] s1 = new string[cg1Nodes.Count()], s2 = new string[cg1Nodes.Count + cg2Nodes.Count()];
            foreach (var cgNode in cg1Nodes)
            {
                var fnName = cgNode.Proc.Name;
                fnNameToIndex1.Add(fnName, count);
                fnIndexToName1.Add(count, fnName);
                s1[count] = RemoveVersionPrefix(fnName);
                count++;
            }

            //We want the indices to be distinct

            foreach (var cgNode in cg2Nodes)
            {
                var fnName = cgNode.Proc.Name;
                fnNameToIndex2.Add(fnName, count);
                fnIndexToName2.Add(count, fnName);
                s2[count] = RemoveVersionPrefix(fnName);
                count++;
            }

            //create the edge list
            List<Tuple<int, int>> edgeList1, edgeList2;
            edgeList1 = new List<Tuple<int, int>>();
            edgeList2 = new List<Tuple<int, int>>();

            foreach (var cgNode in cg1Nodes)
            {
                var src = cgNode.Proc.Name;
                var srcIdx = fnNameToIndex1[src];

                var callees = cgNode.Callees;
                foreach (var callee in callees)
                {
                    var dest = callee.Proc.Name;
                    var destIdx = fnNameToIndex1[dest];
                    var edge = new Tuple<int, int>(srcIdx, destIdx);
                    edgeList1.Add(edge);
                }
            }

            foreach (var cgNode in cg2Nodes)
            {
                var src = cgNode.Proc.Name;
                var srcIdx = fnNameToIndex2[src];

                var callees = cgNode.Callees;
                foreach (var callee in callees)
                {
                    var dest = callee.Proc.Name;
                    var destIdx = fnNameToIndex2[dest];
                    var edge = new Tuple<int, int>(srcIdx, destIdx);
                    edgeList2.Add(edge);
                }
            }
            

            //call the Decomposer
            List<int> synEq = new List<int>();

            List<Tuple<int, int>> fnMapIndex = new List<Tuple<int, int>>();
            fnMapIndexDict = new Dictionary<int, int>();
            List<int> empty1 = new List<int>(), empty2 = new List<int>();
            foreach (var fnPair in fnMap)
            {
                var left = fnNameToIndex1[fnPair.Key];
                var right = fnNameToIndex2[fnPair.Value];
                var lr = new Tuple<int, int>(left, right);

                //Add the same uninterpreted function by default
                Procedure leftP = cg.NodeOfName(fnPair.Key).Proc;
                Procedure rightP = cg.NodeOfName(fnPair.Value).Proc;
                InjectUIFsOnBothProcs(leftP, rightP);               
                if (RVTCreateEQProcs(left, ref synEq, ref empty1, ref empty2))
                {
                    //add the mapping if the eq generation succeeded
                    //HACK!!! should be filtered from the list given to RVT
                    fnMapIndex.Add(lr);
                    fnMapIndexDict.Add(left, right);
                }
            }


            // marking functions that were originated from loops (these will be marked differently in the dotty graphs)
            List<int> loop_functions_1, loop_functions_2;
            loop_functions_1 = new List<int>();
            loop_functions_2 = new List<int>();
            
            foreach (var cgNode in cg1Nodes)
            {
                string src = cgNode.Proc.Name;
                if (src.Contains(Options.LoopStringIdentifier)) loop_functions_1.Add(fnNameToIndex1[src]);
            }
            
            foreach (var cgNode in cg2Nodes)
            {
                string src = cgNode.Proc.Name;
                if (src.Contains(Options.LoopStringIdentifier)) loop_functions_2.Add(fnNameToIndex2[src]);
            }
            //RunRVTDecomposer(cg1size, cg2size, edgeList1, edgeList2, fnMapIndex, synEq);

            DECOMPOSE_CS.RVT_Decompose.Decompose_main(cg1size, cg1size + cg2size, edgeList1, edgeList2, loop_functions_1, loop_functions_2, fnMapIndex, synEq, empty1, empty2, s1, s2);

        }

        private static string RemoveVersionPrefix(string fnName)
        {
            int indx = fnName.IndexOf(".");
            System.Diagnostics.Debug.Assert(0 <= indx && indx < fnName.Count(), "String name without a version prefix");
            return fnName.Substring(indx + 1);

        }

        private static void InjectUIFsOnBothProcs(Procedure leftP, Procedure rightP)
        {
            ////create uifs, grabs the readset from callgraph
            ////same uif for both versions   
            ////injects them as postcondition
            var newDecls = new List<Declaration>();
            if (SDiff.Boogie.Process.InjectUninterpreted(leftP, rightP, cfg, cg, newDecls))
                Log.Out(Log.Error, "Failed to add postconditions to " + leftP.Name + " and " + rightP.Name);
            mergedProgram.AddTopLevelDeclarations(newDecls);
        }



        /// <summary>
        /// Create the EQ_f_f' procedure statically (eagerly) to avoid generating it again and again
        /// </summary>
        /// <param name="f"></param>
        /// Outputs the list of synEq functions for stubs that have no bodies on both sides
        private static bool RVTCreateEQProcs(int f, ref List<int> synEq, ref List<int> empty1, ref List<int> empty2)
        {
            //name of the function
            string fname = fnIndexToName1[f];

            var n1 = cg.NodeOfName(fname);
            var n2Name = funs.Get(n1.Name);

            if (n2Name == null)
            {
                Log.Out(Log.Error, "Could not find mapping for " + n1.Name);
                Log.Out(Log.Error, "Dumping config...");
                Log.Out(Log.Error, cfg.ToString());
                return false;
            }

            var n2 = cg.NodeOfName(n2Name);
            if (n2 == null)
            {
                Log.Out(Log.Error, "ERROR: Could not find " + n2Name + " in ARGS[1]");
                return false;
            }

            if (n1.Proc == null || n2.Proc == null)
            {
                Log.Out(Log.Error, "Missing procedure for " + n1.Name + " or " + n2.Name + ": skipping...");
                return false;
            }

            //TODO: currently return false for corner cases...FIX this carefully

            if (n1.Name.EndsWith("nondet_choice"))
            {
                Log.Out(Log.Normal, "skipping nondet_choice");
                return false;
            }

            if (n1.Impl == null && n2.Impl == null)
            {
                Log.Out(Log.Normal, "No implementation for " + n1.Name + ": skipping...");
                synEq.Add(f);
                empty1.Add(f);
                empty2.Add(fnNameToIndex2[n2.Name]);
                return true;
            }

            if (n1.Impl == null)
            {
                Log.Out(Log.Error, "!Missing implementation for " + n1.Name);
                empty1.Add(f);
                return false;
            }

            if (n2.Impl == null)
            {
                Log.Out(Log.Error, "!Missing implementation for " + n2.Name);
                empty2.Add(fnNameToIndex2[n2.Name]);
                return false;
            }

            var ignores = new HashSet<Variable>(n1.IgnoreSet);
            ignores.UnionWith(n2.IgnoreSet);

            // Creates EQ_f_f' function
            List<Variable> outputVars;
            string eqpName = Transform.mkEqProcName(n1.Name, n2.Name);

            Duple<Procedure, Implementation> eqp;
            eqp = Transform.EqualityReduction(n1.Impl, n2.Impl, cfg.FindProcedure(n1.Name, n2.Name), ignores, out outputVars);

            // if any visible output
            //VerificationTask vt;
            if (eqp != null)
            {
                mergedProgram.AddTopLevelDeclarations(outputVars.Map(x => x as Declaration));
                mergedProgram.AddTopLevelDeclaration(eqp.fst);
                mergedProgram.AddTopLevelDeclaration(eqp.snd);
            }

            //declare the uninterpreted funcs/canonical set of constants  in merged program
            //mergedProgram.AddTopLevelDeclarations(newDecls);
            var canonicalConst = SDiff.Boogie.ConstantFactory.Get().Constants.Map(x => x as Declaration);
            mergedProgram.AddTopLevelDeclarations(canonicalConst);


            //Log.Out(Log.Normal, "Resolving and Typechecking again..");
            if (BoogieUtils.ResolveAndTypeCheckThrow(mergedProgram, Options.MergedProgramOutputFile))
            {
                Log.LogEmit(Log.Normal, mergedProgram.Emit);
                return false;
            }

            if (Options.TraceVerify)
            {
                Log.Out(Log.Normal, "merged program with ufs etc");
                Log.LogEmit(Log.Normal, mergedProgram.Emit);
            }

            // callgraph has changed because EQ programs are added 
            Log.Out(Log.Normal, "Building callgraphs and computing read and write sets");
            cg = CallGraph.Make(mergedProgram);
            ReadWriteSetDecorator.DoDecorate(cg); //start from scratch to fill in the read/write sets
            var mergedProgramNewDecl = new Program();
            mergedProgram.AddTopLevelDeclarations(mergedProgramNewDecl.TopLevelDeclarations);
            mergedProgram.TopLevelDeclarations = SDiff.Boogie.Process.RemoveDuplicateDeclarations(mergedProgram.TopLevelDeclarations.ToList());

            Duple<Duple<Procedure, Implementation>, List<Variable>> tmp = new Duple<Duple<Procedure, Implementation>, List<Variable>>(eqp, outputVars);
            eqProcsCreated.Add(eqpName, tmp);
            
            
            return true;

        }

        /// <summary>
        /// Checks if two version of f are equivalnt
        /// Every procedure that is not inlined will be replaced by their specs (even unreachable ones)
        /// </summary>
        /// <param name="f"></param> the index of the fn
        /// <param name="inlinedFns1"></param> list of fns in side1 to inline
        /// <param name="inlinedFns2"></param> list of fns in side2 to inline
        ///  <param name="is_recursive"></param> whether f is recursive (or part of mutual recursion). Should be used for determining whether we can do differential inlining.
        /// <returns></returns> 
        public static bool RVTCheckEq(int f, HashSet<int> inlinedFns1, HashSet<int> inlinedFns2, bool is_recursive)
        {
            //name of the function
            string n1Name = fnIndexToName1[f];
            var n1 = cg.NodeOfName(n1Name);
            var n2Name = funs.Get(n1.Name);

            if (n1Name == null || n2Name == null)
                return false;
            var n2 = cg.NodeOfName(n2Name);

            Console.Write("Checking (" + n1.Name + ", " + n2.Name + ").");
            if (is_recursive) Console.WriteLine(" These are recursive."); else Console.WriteLine(" These are non recursive.");

            string eqpName = Transform.mkEqProcName(n1.Name, n2.Name);

            Duple<Procedure, Implementation> eqp = null;
            List<Variable> outputVars = new List<Variable>();
            if (eqProcsCreated.ContainsKey(eqpName))
            {
                var tmp = eqProcsCreated[eqpName];
                eqp = tmp.fst;
                outputVars = tmp.snd;
            }
            else
            {
                return false;
            }

            // if any visible output
            VerificationTask vt;
            if (eqp != null)
            {
                vt = new VerificationTask(eqp.snd, n1.Impl, n2.Impl, outputVars);
            }
            //it may be that these functions have no comparable effect. if so, don't generate a verification task
            else //we'll split their uninterpreted functions, but otherwise don't generate a verification task
            {
                vt = new VerificationTask(null, n1.Impl, n2.Impl);
                vt.Result = SDiff.VerificationResult.Error;
                SDiff.Boogie.Process.RewriteUninterpretedOnDiseq(vt, SDiff.Boogie.Process.BuildProgramDictionary(mergedProgram.TopLevelDeclarations.ToList()));
            }


            //The inline:spec inlines a procedure with {:inline 1} 1 times and then uses the spec for deeper calls
            var boogieOptions = "-proverOpt:MULTI_TRACES -monomorphize -timeLimit:" + Options.Timeout + " -removeEmptyBlocks:0 -inline:spec " + Options.BoogieUserOpts;

            SDiff.Boogie.Process.InitializeBoogie(boogieOptions);
            //VC.ConditionGeneration vcgen = BoogieVerify.InitializeVC(mergedProgram);

            // dictionary of all program AST objects by name
            SDiff.Boogie.Process.BuildProgramDictionary(mergedProgram.TopLevelDeclarations.ToList());


            // Call RVTRunVerification Task
            bool crashed;
            var result = 1;
            
            if (eqp!=null) result = RVTRunVerificationTask(vt, null, mergedProgram, inlinedFns1, inlinedFns2, out crashed);
            
            return (result == 1);
        }

        public static int RVTRunVerificationTask(SDiff.VerificationTask vt, VC.ConditionGeneration vcgen, Program prog,
            HashSet<int> inlinedFns1, HashSet<int> inlinedFns2, out bool crashed)
        {

            Log.Out(Log.Verifier, "Verifying " + vt.Eq.Name);

            crashed = false;


            var attList = new List<Object>(1);
            attList.Add(Expr.Literal(1));

            //save attributes
            var sqkLeft = vt.Left.Attributes;
            var sqkpLeft = vt.Left.Proc.Attributes;
            var sqkRight = vt.Right.Attributes;
            var sqkpRight = vt.Right.Proc.Attributes;

            //save postconditions
            var leftPosts = vt.Left.Proc.Ensures;
            var rightPosts = vt.Right.Proc.Ensures;

            //Keep the postconditions correpsonding to the 
            //free ensures (out == uf_Foo(inp))
            //vt.Left.Proc.Ensures = new List<Ensures>();
            //vt.Right.Proc.Ensures = new List<Ensures>();

            //inline procedures under analysis
            vt.Left.Attributes
              = Util.MkInlinedAttribute(attList);
            vt.Left.Proc.Attributes = vt.Left.Attributes;

            vt.Right.Attributes
              = Util.MkInlinedAttribute(attList);
            vt.Right.Proc.Attributes = vt.Right.Attributes;

            vt.Left.OriginalBlocks = vt.Left.Blocks;
            vt.Left.OriginalLocVars = vt.Left.LocVars;
            vt.Right.OriginalBlocks = vt.Right.Blocks;
            vt.Right.OriginalLocVars = vt.Right.LocVars;


            IEnumerable <Declaration> procImplPIter = prog.TopLevelDeclarations.Where(x => x is Implementation);

            List<Implementation> inlinedImpls = new List<Implementation>();
            foreach (Implementation currentProcImpl in procImplPIter)
            {
                bool match = false;
                int indx = -1;
                if (fnNameToIndex1.ContainsKey(currentProcImpl.Proc.Name))
                {
                    match = true;
                    indx = fnNameToIndex1[currentProcImpl.Proc.Name];
                }
                else if (fnNameToIndex2.ContainsKey(currentProcImpl.Proc.Name))
                {
                    match = true;
                    indx = fnNameToIndex2[currentProcImpl.Proc.Name];
                }

                //Inline if present in 
                if (match && (inlinedFns1.Contains(indx) || inlinedFns2.Contains(indx)))
                {
                    inlinedImpls.Add(currentProcImpl);
                    currentProcImpl.Attributes = Util.MkInlinedAttribute(attList);
                    currentProcImpl.Proc.Attributes = Util.MkInlinedAttribute(attList);

                    //RUN INLINER OVER EQ FUNCTION
                    currentProcImpl.OriginalBlocks = currentProcImpl.Blocks;
                    currentProcImpl.OriginalLocVars = currentProcImpl.LocVars;
                }
            }

            //RUN INLINER OVER EQ FUNCTION
            // prog = EQ program
            // vt.Eq = EQ_f_f' procedure with f, f' having {inline} tags
            Inliner.ProcessImplementation(prog, vt.Eq);

            if (Options.TraceVerify)
            {
                Log.Out(Log.Normal, "Ready to verify:");
                Log.LogEmit(Log.Normal, prog.Emit);
            }

            // To print the EQ files in 

            Util.DumpBplAST(prog, vt.Eq.Name + "_out.bpl");
            // prog = SDiff.Boogie.Process.ParseProgram(vt.Eq.Name + "_out.bpl");

            if (BoogieUtils.ResolveAndTypeCheckThrow(prog, Options.MergedProgramOutputFile))
                return 1;

            Implementation newEq = vt.Eq;
            var newProg = prog;

            vcgen = BoogieVerify.InitializeVC(newProg);
            //SDiff.Boogie.Process.ResolveAndTypeCheck(newProg, "");
            var newDict = SDiff.Boogie.Process.BuildProgramDictionary(newProg.TopLevelDeclarations.ToList());
            //newEq = (Implementation)newDict.Get(vt.Eq.Name + "$IMPL");



            SDiffCounterexamples SErrors;
            List<Model> errModelList;


            //Clear up the state since it might call the same procedure twice



            vt.Result = BoogieVerify.VerifyImplementation(vcgen, newEq, newProg, out SErrors, out errModelList);

            switch (vt.Result)
            {
                case SDiff.VerificationResult.Error:
                    Log.Out(Log.Verifier, "Result: Error");
                    break;
                case SDiff.VerificationResult.Verified:
                    Log.Out(Log.Verifier, "Result: Verified");
                    break;
                default:
                    Log.Out(Log.Verifier, "Result: Unhandled");
                    crashed = true;
                    break;
            }

            //restore postconditions IN THE OLD IN-MEMORY PROGRAM
            vt.Left.Proc.Ensures = leftPosts;
            vt.Right.Proc.Ensures = rightPosts;

            //remove the inline annotation IN THE OLD IN-MEMORY PROGRAM
            vt.Left.Attributes = sqkLeft;
            vt.Left.Proc.Attributes = sqkpLeft;
            vt.Right.Attributes = sqkRight;
            vt.Right.Proc.Attributes = sqkpRight;

            //remove the inline annotation in the Inlined Procedures
            foreach (Implementation currentProcImpl in procImplPIter)
            {
                if (inlinedImpls.Contains(currentProcImpl))
                {
                    currentProcImpl.Attributes = null;
                    currentProcImpl.Proc.Attributes = null;
                }
            }

            if (vt.Result == SDiff.VerificationResult.Verified)
                return 1;
            else
                return 0;
        }


    }



}
