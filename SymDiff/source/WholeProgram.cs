using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Diagnostics;
using Microsoft.Boogie;
using B = SDiff.Boogie;

using SymDiffUtils;

//there is massive duplication here in case it turns out that the allinone approach (even with dumping at every verify) is not useful

namespace SDiff
{
    public class AllInOneDriver
    {
        //All these static variables are initialized in AllInOneMain
        private static string v1name, v2name;
        static Stopwatch totClock;
        static string p1Prefix, p2Prefix;
        static Config cfg;

        //RS: flags recorded here and then discarded
        //TODO: move to Options
        static bool dumpEq;
        static bool wrapper;

        static bool inlineWhenMissing;
        static bool deactivateHacks;
        static bool onlyAnalyzeRootsOfCallGraphsForInlineAll = true; //default true

        //Parsing routines
        public static HashSet<string> ParseProcedureListFromFile(string fname)
        {
            StreamReader in_s;
            try
            {
                in_s = new StreamReader(fname);
            }
            catch (Exception e)
            {
                Log.Out(Log.Error, "Unknown error during loading file: " + fname);
                Log.Out(Log.Error, e.ToString());
                return new HashSet<string>();
            }

            string l;
            HashSet<string> funcs = new HashSet<string>();
            while (!in_s.EndOfStream)
            {
                l = in_s.ReadLine().Trim();
                if (l.StartsWith("#")) //comment
                    continue;
                funcs.Add(l);
            }
            return funcs;
        }
        private static void AllInOneUsage(){
          Console.WriteLine("Usage: SymDiff -allInOne a.bpl b.bpl ab.cfg [options]");
          Console.WriteLine("\t ab.cfg          output of \"SymDiff -inferConfig a.bpl b.bpl\"");
          Console.WriteLine("\t -break          break into the debugger\"");
          //          Console.WriteLine("\t -di             enable differential inlining");
          Console.WriteLine("\n[Options for different modes of checking]");
          Console.WriteLine("\t -nonmodular     inline callees");
          Console.WriteLine("\t -recursionDepth:k     inline procedures upto k depth");
          Console.WriteLine("\t -localcheck     only checks the syntactically changed procedures");
          Console.WriteLine("\t -rvt            Godlin & Strichman's method for dealing with recursion (not tested well)");
          Console.WriteLine("\t -returnAsOnlyOutput     only considers retuns as the output of a procedure (input is all globals read + params)");
          Console.WriteLine("\t -outvar:\"<name>\"  only compares output variables with substring <name> (needs -splitOutputEqualities). Can specify multiple -outvar:\"x\" -outvar:\"y\"");


          Console.WriteLine("\n[Options for the configuration]");
          Console.WriteLine("\t -timeout:n      sets the timeout to n seconds");
          Console.WriteLine("\t -boogieOpts:s   passes the string s to Boogie");
          Console.WriteLine("\t -cex:k          limits the number of cex per method to k (default 5)");
          Console.WriteLine("\t -splitOutputEqualities splits each output equality per procedure (max 100)");
          Console.WriteLine("\t -synEq:<file>   <file> contains a list of procedure names that are trusted syntactically equivalent");
          Console.WriteLine("\t -wrapper        run boogie in a separate process (to avoid memory bottleneck)");
          Console.WriteLine("\t -freeContracts  treat single program contracts (requires, ensures) into free (requires,ensures)");


          Console.WriteLine("\n[Options for mutual summaryies and DAC]");
          Console.WriteLine("\t -usemutual      \n\t\tuse the CADE'13/FSE'13 mutual summaries (paired with -useMutualSummmariesAsAxioms) with an additional file \"ms_symdiff_file.bpl\"");
          Console.WriteLine("\t -asserts        \n\t\tperforms differential assertion checking (wrt assertions present)");
          Console.WriteLine("\t -useMutualSummmariesAsAxioms \n\t\tuse the mutual summaries (CADE'13) when -usemutual is specified (default FSE'13 encoding even without -asserts)");
          Console.WriteLine("\t -checkEquivWithDependencies \n\t\tuse the FSE'13 encoding for checking equivalence with candidates given by dependency analysis");
          Console.WriteLine("\t -dontUseHoudiniForMS \n\t\tomit the use of Houdini/AbsHoudini to infer candidate annotations with -usemutual");
          Console.WriteLine("\t -useAbstractHoudiniInference \n\t\tuse AbstractHoudini to infer candidate annotations with -usemutual");
          Console.WriteLine("\t -checkMutualPrecondNonTerminating \n\t\tenable checking of mutual preconditions in the presence of non-terminating programs with -usemutual");
          Console.WriteLine("\t -dontTypeCheckMergedProg           \n\t\tskips typechecking in memory of the mergedProgSingle.bpl (doesn't typecheck due to ms_symdiff_file.bpl)");
          Console.WriteLine("\t -dacEncodingLinear                 \n\t\t(with DAC FSE'13 encoding) only pairs ith callsites of a procedure from two programs when creating merged program (linear in number of callsites)");
          Console.WriteLine("\t -dacConsiderChangedProcOnly         \n\t\t(with DAC FSE'13 encoding) only considers those MS_f1_f2 procedures for inference where at least f1/f2 is marked syntacticChanged (by dependency)");

            
          Console.WriteLine("\n[Options specific to evaluating differential assertion checking (not generally useful)]");
          Console.WriteLine("\t -oneproc        only check one version (works with -asserts)");
          Console.WriteLine("\t -main           just run on EQ_main_main (not well-tested)");
          Console.WriteLine("\t -bogusmodular   unsound modular checker which treats callees as equivalent");
          //Console.WriteLine("-deactivatehacks");
          //Console.WriteLine("    Do not inline functions which are present in one and not the other");
          //Console.WriteLine("\t -sound          assume functions can change OK (with -asserts only)");

        }
        private static bool ParseArgs(string[] args0) {
            List<string> argsList = args0.ToList();


            Options.nonModularMode = argsList.Remove("-nonmodular");
            Options.localcheck = argsList.Remove("-localcheck");
            Options.oneproc = argsList.Remove("-oneproc");

            //DAC related
            Options.checkAssertsOnly = argsList.Remove("-asserts");
            Options.justMain = argsList.Remove("-justmain"); //run Boogie only on main (rest are skip)
            dumpEq = argsList.Remove("-dumpeq");
            wrapper = argsList.Remove("-wrapper");

            //mutual summary related
            Options.mutualSummaryMode = argsList.Remove("-usemutual");
            Options.useMutualSummariesAsAxioms = argsList.Remove("-useMutualSummariesAsAxioms");
            Options.dontUseHoudiniForMS = argsList.Remove("-dontUseHoudiniForMS");
            Options.useAbstractHoudiniInference = argsList.Remove("-useAbstractHoudiniInference");
            Options.checkMutualPrecondNonTerminating = argsList.Remove("-checkMutualPrecondNonTerminating");
            Options.freeContracts = argsList.Remove("-freeContracts");
            Options.checkEquivWithDependencies = argsList.Remove("-checkEquivWithDependencies");
            Options.dontTypeCheckMergedProg = argsList.Remove("-dontTypeCheckMergedProg");
            Options.callCorralOnMergedProgram = argsList.Remove("-callCorralOnMergedProgram");
            Options.invokeHoudiniDirectlyOnMergedBpl = argsList.Remove("-invokeHoudiniDirectlyOnMergedBpl");
            Options.dacEncoding = argsList.Remove("-dacEncodingLinear") ? Options.DAC_ENCODING_OPT.DAC_LINEAR : Options.DAC_ENCODING_OPT.DAC_NORMAL;
            Options.dacConsiderChangedProcOnly = argsList.Remove("-dacConsiderChangedProcOnly") ? true : false; 

            //taint related
            Options.refinedStmtTaint = argsList.Remove("-refinedStmtTaintAnalysis");

            inlineWhenMissing = argsList.Remove("-inlineWhenMissing");
            deactivateHacks = argsList.Remove("-deactivatehacks");
            Options.OnlyConsiderReturnAsOutput = argsList.Remove("-returnAsOnlyOutput");
            argsList.RemoveAll(x => x == "-break" || x == "/break");
            var args = argsList.ToArray(); //want to remove the options above

            //Process the rest of the options
            for (int i = 3; i < args.Length; ++i) { 
                if (args[i] == null) continue;
                if ((args[i].Equals("-di")) || (args[i].Equals("/di")))
                {
                    Options.DifferentialInline = true; // Enabling or not Differential Inline
                    throw new Exception("di option deprecated");
                }
                else if ((args[i].Equals("-rvt")) || (args[i].Equals("/rvt")))
                    Options.RVTOption = true; // Enabling RVT
                else if ((args[i].Equals("-psd")) || (args[i].Equals("/psd")))
                    Options.PropagateSingleDifference = true; // Enabling or not Propagate Single Difference
                else if ((args[i].Equals("-pce")) || (args[i].Equals("/pce")))
                    Options.PreciseDifferentialInline = true; // Enabling or not Propagate Counter Examples
                else if ((args[i].Equals("-enumpaths")) || (args[i].Equals("/enumpaths")))
                    Options.EnumerateAllPaths = true; // enumerate all pairs of paths reaching assert(False)                    
                else if (args[i].Contains("-notrace") || args[i].Contains("/notrace"))
                    Options.DoSymEx = false; //save the time for doing symex along each path
                else if (args[i].Contains("-cex:") || args[i].Contains("/cex:"))
                {
                    string s = args[i].Substring(5).Trim();
                    int t = 0;
                    if (Int32.TryParse(s, out t))
                        Options.NumCex = t;
                    if (t <= 0)
                    {
                        Console.WriteLine("Illegal argument of /cex:n");
                        return false;
                    }
                }
                else if (args[i].Contains("-timeout:") || args[i].Contains("/timeout:"))
                {
                    string s = args[i].Substring(9).Trim(); //REALLY BAD CODE
                    int t = 0;
                    if (Int32.TryParse(s, out t))
                        Options.Timeout = t;
                    if (t <= 0)
                    {
                        Console.WriteLine("Illegal argument of /timeout:n");
                        return false;
                    }
                }
                else if (args[i].Contains("-recursionDepth:") || args[i].Contains("/recursionDepth:"))
                {
                    string s = args[i].Substring("-recursionDepth:".Length).Trim();
                    int t = 0;
                    if (Int32.TryParse(s, out t))
                        Options.inlineAllRecursionDepth = t;
                    if (t <= 0)
                    {
                        Console.WriteLine("Illegal argument of /recursionDepth:n");
                        return false;
                    }
                    Console.WriteLine("Recursion Depth = {0}", Options.inlineAllRecursionDepth);
                }
                else if (args[i].Contains("-boogieOpt:") || args[i].Contains("/boogieOpt:"))
                {
                    Options.BoogieUserOpts += " " + args[i].Substring(11).Trim();
                }
                else if (args[i].Contains("-outvar:") || args[i].Contains("/outvar:"))
                {
                    Options.OutputVars.Add(args[i].Substring("-outvar:".Length).Trim());
                }
                else if (args[i].Contains("-taint:") || args[i].Contains("/taint:"))
                {
                    Options.changeListFile = (args[i].Substring("-taint:".Length).Trim());

                }
                else if (args[i].Contains("-synEq:") || args[i].Contains("/synEq:"))
                {
                    var fname = args[i].Substring(7).Trim();
                    Options.syntacticEqProcs = ParseProcedureListFromFile(fname);
                    foreach (var s in Options.syntacticEqProcs)
                        Console.WriteLine("Added " + s + " to syntacticEqProcs");
                }
                else if (args[i].Contains("-splitOutputEqualities") || args[i].Contains("/splitOutputEqualities"))
                    Options.splitOutputEqualities = true;
                else
                {
                    throw new Exception("Unexpected option " + args[i]);
                }
            }
            /////////////////////////////////////
            //consistency checks over the options
            /////////////////////////////////////
            if (Options.RVTOption) {
                Console.WriteLine("RVT mode, diff-inline turned off");
                Options.DifferentialInline = false;
            }
            if (Options.DifferentialInline && Options.InlineWhenFail) {
                Console.WriteLine("Optioin InlineWhenFail is set with DifferentialInline...only set one");
                return false;
            }
            if (Options.OnlyConsiderReturnAsOutput && !Options.localcheck)
            {
                Console.WriteLine("Optioin -returnAsOnlyOutput currently only supported with -localcheck");
                return false;
            }
            ////////////////////////////// 
            // Set the derived options
            //////////////////////////////
            if (Options.localcheck || Options.nonModularMode) Options.PropagateEquivs = false;
            return true;
        }
        private static int ParseCmdLine(string[] args)
        {
            if (args.Length < 3) { AllInOneUsage(); return 1; }
            v1name = args[0];
            v2name = args[1];
            p1Prefix = v1name.Replace(".bpl", "");
            p2Prefix = v2name.Replace(".bpl", "");
            if (!v1name.EndsWith(".bpl"))
            {
                Log.Out(Log.Error, "Expecting inputs files with .bpl, got " + v1name);
                return 1;
            }
            if (!v2name.EndsWith(".bpl"))
            {
                Log.Out(Log.Error, "Expecting inputs files with .bpl, got " + v2name);
                return 1;
            }
            if (v1name.Equals(v2name))
            {
                Log.Out(Log.Error, "Programs must have different filenames");
                return 1;
            }
            if (p1Prefix.Contains("."))
            {
                Log.Out(Log.Error, "Input files dont have . in them except .bpl, got " + v1name);
                return 1;
            }
            if (p2Prefix.Contains("."))
            {
                Log.Out(Log.Error, "Input files dont have . in them except .bpl, got " + v2name);
                return 1;
            }
            if (!ParseArgs(args)) return 1;
            Log.Out(Log.Normal, "Parsing config file");
            try
            {
                cfg = new Config(args[2]);
            }
            catch
            {
                Console.WriteLine("Failed to parse config file");
                return 1;
            }
            return 0;
        }
        
        //Preprocessing, renaming and restructuring two programs
        private static Program RestructureProgram(Program p) {
            // Type declarations
            IEnumerable<Declaration> typeDeclsP = p.TopLevelDeclarations.Where(x => x is TypeCtorDecl || x is TypeSynonymDecl);
            // global declarations
            IEnumerable<Declaration> globDeclsP = p.TopLevelDeclarations.Where(x => x is GlobalVariable);
            // constant declarations
            IEnumerable<Declaration> consDeclsP = p.TopLevelDeclarations.Where(x => x is Constant);
            // functions declarations
            IEnumerable<Declaration> funcDeclsP = p.TopLevelDeclarations.Where(x => x is Function);
            // axioms declarations
            IEnumerable<Declaration> axiomDeclsP = p.TopLevelDeclarations.Where(x => x is Axiom);
            // procedure declarations
            IEnumerable<Declaration> procDeclsP = p.TopLevelDeclarations.Where(x => x is Procedure);
            // procedure implementations
            IEnumerable<Declaration> procImpP = p.TopLevelDeclarations.Where(x => x is Implementation);
            // restructuring the order of declarations
            Program p1 = new Program();
            p1.AddTopLevelDeclarations(typeDeclsP);
            p1.AddTopLevelDeclarations(globDeclsP);
            p1.AddTopLevelDeclarations(consDeclsP);
            p1.AddTopLevelDeclarations(funcDeclsP);
            p1.AddTopLevelDeclarations(axiomDeclsP);
            p1.AddTopLevelDeclarations(procDeclsP);
            p1.AddTopLevelDeclarations(procImpP);
            return p1;
        }
        private static int CreateMergedProgram(Program p1, Program p2, 
            List<Declaration> t2s, List<Declaration> g2s, List<Declaration> c2s, 
            List<Declaration> f1s, List<Declaration> f2s,
            bool mergeGlobals, 
            ref Program mergedProgram)
        {
            mergedProgram.TopLevelDeclarations =
                p2.TopLevelDeclarations.Where(x => !(x is TypeCtorDecl || x is TypeSynonymDecl));
            mergedProgram.AddTopLevelDeclarations(
              p1.TopLevelDeclarations.Where(x => !(x is TypeCtorDecl || x is TypeSynonymDecl)));
            mergedProgram.AddTopLevelDeclarations(t2s); //[SKL]: why are we adding t2s
            mergedProgram.TopLevelDeclarations = Boogie.Process.RemoveDuplicateDeclarations(mergedProgram.TopLevelDeclarations.ToList());
            //RemoveDuplicateDatatypeFunctions(ref mergedProgram.TopLevelDeclarations.ToList()); //new: since we are not renaming datatypes
            //Program mergedProgram = new Program();
            //mergedProgram.TopLevelDeclarations = p2.TopLevelDeclarations.Append(p1.TopLevelDeclarations.ToList());
            Log.Out(Log.Normal, "Resolving and typechecking");
            if (SDiff.Boogie.Process.ResolveAndTypeCheckThrow(mergedProgram, Options.MergedProgramOutputFile))
                return 1;

            //--------------- renaming starts ----------------------------------
            //normalization:
            // we need to establish the correspondence between the two programs in terms of their constants, functions
            // and globals. we'll use the config to map between the two.

            //merge/rename the global variables and constants
            VariableRenamer vRenamer = null;
            if (mergeGlobals) //the default behavior where only copy of globals (v2.G) is retained in the merged program
                vRenamer = new VariableRenamer(cfg.GlobalMap.Append(cfg.ConstMap), g2s.Append(c2s).Map(x => x as Variable));
            else //both v1.G and v2.G are present 
                vRenamer = new VariableRenamer(cfg.ConstMap, c2s.Map(x => x as Variable));
            mergedProgram = vRenamer.VisitProgram(mergedProgram);
            //merge/rename the functions
            //RS: Why do we need this?
            var f12s = f2s.Append(f1s);
            RemoveDuplicateDatatypeFunctions(ref f12s); //to account for datatypes not renamed
            var origFunList = f12s.Map(x => x as Function);
            IEnumerable<Declaration> FunctionList = mergedProgram.TopLevelDeclarations.Where(x => x is Function);
            var FunctionNameList = FunctionList.ToList().Map(x => x.ToString());
            var newFuncs = new HashSet<Declaration>();
            //find mismatched functions (not procedure)
            foreach (Function fun in FunctionList)
            {
                string funNameProgNameStripped = fun.Name.Replace(p1Prefix + ".", "");
                if (fun.Name.Contains(p1Prefix) && (!FunctionNameList.Contains(p2Prefix + "." + funNameProgNameStripped)))
                {
                    var newFunc = new Function(new Token(), p2Prefix + "." + funNameProgNameStripped, fun.InParams, fun.OutParams[0]);
                    newFuncs.Add(newFunc);
                    origFunList.Add(newFunc);
                    Log.Out(Log.Normal, "HACK in " + funNameProgNameStripped);
                }
            }
            mergedProgram.AddTopLevelDeclarations(newFuncs);
            List<Declaration> newFunctionList = mergedProgram.TopLevelDeclarations.Where(x => x is Function).ToList();
            var fRenamer = new FunctionRenamer(cfg.FunctionMap, origFunList);
            mergedProgram = fRenamer.VisitProgram(mergedProgram);
            mergedProgram.TopLevelDeclarations = SDiff.Boogie.Process.RemoveDuplicateDeclarations(mergedProgram.TopLevelDeclarations.ToList());
            var mergedGlobals = mergedProgram.TopLevelDeclarations.Where(x => x is GlobalVariable);
            //moved this out of DifferntialInline
            RenameModelConstsInProcImpl(mergedProgram.TopLevelDeclarations.Where(x => x is Implementation && x.ToString().StartsWith(p1Prefix)).ToList(), 
                mergedProgram.TopLevelDeclarations.Where(x => x is Constant).ToList(), p1Prefix, p2Prefix);
            //--------------- renaming ends ----------------------------------

            Util.DumpBplAST(mergedProgram, p1Prefix + p2Prefix + "_temp.bpl");
            mergedProgram = SDiff.Boogie.Process.ParseProgram(p1Prefix + p2Prefix + "_temp.bpl");
            Log.Out(Log.Normal, "Resolving and typechecking");
            //we now have a single AST that contains all of the elements of each of the individual ASTs
            if (SDiff.Boogie.Process.ResolveAndTypeCheckThrow(mergedProgram, Options.MergedProgramOutputFile))
                return 1;
            return 0;
        }
        public static void RenameModelConstsInProcImpl(List<Declaration> procImpl, List<Declaration> consts, string p1Prefix, string p2Prefix)
        {
            foreach (Implementation imp1 in procImpl)
            {
                foreach (Block b1 in imp1.Blocks)
                {
                    foreach (Object sq in b1.Cmds)
                    {
                        if (sq is AssumeCmd)
                        {
                            AssumeCmd ccmd = (AssumeCmd)sq;
                            if (ccmd.Expr is NAryExpr)
                            {
                                NAryExpr expr = (NAryExpr)ccmd.Expr;
                                //foreach (var v in expr.Args)
                                foreach (var v in expr.Args)
                                {
                                    if (v is IdentifierExpr)
                                    {
                                        IdentifierExpr ieV = (IdentifierExpr)v;
                                        if (Util.hasConst(ieV.Name, consts))
                                        {
                                            ieV.Name = ieV.Name.Replace(p2Prefix, p1Prefix);
                                            Variable variableReplace = (Constant) Util.getDeclarationByName(ieV.Name, consts);
                                            ieV.Decl = variableReplace;
                                            ieV.Decl.TypedIdent.Name = ieV.Name.Replace(p2Prefix, p1Prefix);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        public static void RenameSymbolsByVersion(ref Program p, List<Declaration> gs, List<Declaration> cs, List<Declaration> fs, string vname)
        {
            //strip_path(...) is string v1.foo.bpl --> foo.bpl  
            var namespacer1 = new PrefixRenamer(Util.strip_suffix(Util.strip_path(vname)), gs.Append(cs), fs);
            p = namespacer1.VisitProgram(p);
            //This is needed to tell Boogie to print the instrumented program (inlined version)
            Boogie.Process.InitializeBoogie("/printInstrumented");
            Util.DumpBplAST(p, vname.Replace(".bpl", "_temp.bpl"));
            p = SDiff.Boogie.Process.ParseProgram(vname.Replace(".bpl", "_temp.bpl"));
            if (Options.TraceVerify)
            {
                Log.Out(Log.Normal, "Pre-merged program:");
                Log.LogEmit(Log.Normal, p.Emit);
            }
        }

        private static void RemoveDuplicateDatatypeFunctions(ref List<Declaration> decls)
        {
            var visitedFuncs = new List<string>(); //not using a set to keep the same order
            var tmp = decls;
            decls = new List<Declaration>();
            foreach (var d in tmp)
            {
                if (d is Function)
                {
                    if (Util.IsDataTypeFunction((Function)d) && visitedFuncs.Contains(((Function)d).Name)) continue;
                    visitedFuncs.Add(((Function)d).Name);
                }
                decls.Add(d);
            }
        }
        private static int CreateModSets(Program p1, Program p2, Program mergedProgram, out CallGraph cg1, out CallGraph cg2, out CallGraph cg)
        {
            Log.Out(Log.Normal, "Building callgraphs and computing read and write sets");
            //build callgraphs, r/w sets
            cg1 = CallGraph.Make(p1);
            cg2 = CallGraph.Make(p2);
            cg = CallGraph.Make(mergedProgram);

            // fills up the read/write sets into a field in the callgraph
            ReadWriteSetDecorator.DoDecorate(cg); //expensive for nonmodular
            Log.Out(Log.Normal, "Writing writesets as modifies clauses");
            SDiff.Boogie.Process.SetModifies(mergedProgram.TopLevelDeclarations.ToList(), cg);
            Log.Out(Log.Normal, "Resolving and Typechecking again..");
            if (SDiff.Boogie.Process.ResolveAndTypeCheckThrow(mergedProgram, Options.MergedProgramOutputFile))
                return 1;
            if (Options.TraceVerify)
            {
                Log.Out(Log.Normal, "Merged program w/o Eqs:");
                Log.LogEmit(Log.Normal, mergedProgram.Emit);
            }
            return 0;
        }

        //DAC logic
        private static int TurnAssertsIntoOK(string[] args, Program p1, Program p2, List<Declaration> g1s, List<Declaration> g2s)
        {
            InsertOK(1, p1, args); //does not include preconditions (when inlined)
            InsertOK(2, p2, args);
            InsertConstantsOK(v1name.Replace(".bpl", ""), p1, 1);
            InsertConstantsOK(v2name.Replace(".bpl", ""), p2, 2);
            cfg.AddGlobal(new HDuple<string>(p1Prefix + ".OK", p2Prefix + ".OK"));
            g1s.Add(new GlobalVariable(new Token(), new TypedIdent(new Token(), p1Prefix + ".OK", BasicType.Bool)));
            g2s.Add(new GlobalVariable(new Token(), new TypedIdent(new Token(), p2Prefix + ".OK", BasicType.Bool)));
            //just making sure
            if (SDiff.Boogie.Process.ResolveProgram(p1, v1name) || SDiff.Boogie.Process.ResolveProgram(p2, v2name))
                return 1;
            return 0; //this denotes success
        }
        private static void InsertOkChecks(Program mergedProgram, CallGraphNode n1, CallGraphNode n2, Duple<Procedure, Implementation> eqp)
        {
            var BoolType = new BasicType(SimpleType.Bool);
            var varOK1 = Expr.Ident(p1Prefix + ".OK", BoolType);

            List<Cmd> temp = new List<Cmd>();
            if (Options.oneproc)
            {   //initialize to true
                var varOK = Expr.Ident(p2Prefix + ".OK", BoolType);
                temp.Add(new AssumeCmd(new Token(), Expr.Iff(varOK, Expr.True)));
            }

            foreach (Requires req in n2.Impl.Proc.Requires)
                temp.Add(new AssumeCmd(new Token(), req.Condition));

            List<Requires> n1req = n1.Impl.Proc.Requires;
            var PreHolds = new LocalVariable(new Token(), new TypedIdent(new Token(), "PreHolds", BoolType));
            //check (PreHolds=>OK_1)=>OK_2
            eqp.snd.LocVars.Add(PreHolds);
            temp.Add(Cmd.SimpleAssign(new Token(), new IdentifierExpr(new Token(), PreHolds), Expr.True));
            foreach (Requires req in n1req)
            {
                temp.Add(Cmd.SimpleAssign(new Token(), new IdentifierExpr(new Token(), PreHolds), Expr.And(Expr.Ident(PreHolds), req.Condition)));
            }
            temp.AddRange(eqp.snd.Blocks[0].Cmds);
            eqp.snd.Blocks[0].Cmds = temp;
            var ensuresOK = new List<Ensures>();
            //ensuresOK.Add(new Ensures(false, Expr.Imp(varOK1, varOK2)));
            eqp.fst.Ensures = ensuresOK;

            Block info = eqp.snd.Blocks[eqp.snd.Blocks.Count - 1];
            string OK1var = "Output_of_" + n1.Name + "_" + p2Prefix + ".OK";
            //FindOK1var(info.Cmds,p1Prefix);
            if (OK1var != "")
            {
                Expr TempExpr;
                if (Options.oneproc)
                    TempExpr = Expr.True;
                else
                    TempExpr = Expr.Ident(OK1var, BoolType);
                var Antecedent = Expr.Imp(Expr.Ident(PreHolds), TempExpr);
                info.Cmds.Add(new AssertCmd(new Token(), Expr.Imp(Antecedent, Expr.Ident(p2Prefix + ".OK", BasicType.Bool))));
            }
        }
        private static void PerformOKInference(string pPrefix, Program p)
        {
            var impls = p.TopLevelDeclarations.Where(x => x is Implementation);
            string lname = pPrefix + ".OK";

            //For each procedure q in Procs(p)
            //  add ensures(ok <==> old(ok))
            foreach (Implementation impl in impls)
            {
                var proc = impl.Proc;
                if (proc == null) continue;
                proc.Ensures.Add(new Ensures(false, Expr.Iff(Expr.Ident(lname, BasicType.Bool), new OldExpr(new Token(), Expr.Ident(lname, BasicType.Bool)))));
            }

            CallGraph cg = CallGraph.Make(p);

            var boogieOptions = "-z3multipleErrors -typeEncoding:m -timeLimit:" + Options.Timeout + " -removeEmptyBlocks:0" + " -printModel:1 -printModelToFile:model.dmp " + Options.BoogieUserOpts;
            Boogie.Process.InitializeBoogie(boogieOptions);

            var vcgen = BoogieVerify.InitializeVC(p);

            //For each procedure q in CG(p) in topological order
            foreach (var q in cg.GetPostOrder()) //the order is topological for non-recursive programs
            {
                Implementation n = q.Impl;
                if (n == null) continue;


                //  check the procedure using Boogie
                //  find if there is an error
                VC.VCGen.Outcome outcome;

                try
                {
                    List<Counterexample> errors;
                    outcome = vcgen.VerifyImplementation(n, /*p,*/ out errors);
                }
                catch (Exception e)
                {
                    Log.Out(Log.Error, "Unknown error somewhere in verification: ");
                    Log.Out(Log.Error, e.ToString());
                    outcome = VC.VCGen.Outcome.Inconclusive;
                }

                bool removeOKEnsures = false;

                switch (outcome)
                {
                    case VC.VCGen.Outcome.Errors:
                    case VC.VCGen.Outcome.Inconclusive:
                    case VC.VCGen.Outcome.OutOfMemory:
                    case VC.VCGen.Outcome.TimedOut:
                        removeOKEnsures = true; //TODO: make sure its the OK ensures
                        break;
                }

                if (removeOKEnsures)
                {
                    //lookup the procedure that shares the same name
                    var pr = n.Proc;

                    //remove the ensures about OK
                    Debug.Assert(pr.Ensures.Count > 0);
                    //pr.Ensures.Truncate(pr.Ensures.Count - 1);
                    pr.Ensures.RemoveAt(pr.Ensures.Capacity - 1);
                }

            }





        }
        private static void AddOKEnsures(string p1Prefix, string p2Prefix, bool mergeGlobals, List<Declaration> list)
        {
            foreach (Procedure proc in list)
            {
                string lname = p2Prefix + ".OK";
                if (!mergeGlobals) //when using mutual summaries
                {
                    lname = proc.Name.StartsWith(p1Prefix + ".") ? p1Prefix + ".OK" : lname;
                }
                proc.Ensures.Add(new Ensures(true, Expr.Imp(Expr.Ident(lname, BasicType.Bool), new OldExpr(new Token(), Expr.Ident(lname, BasicType.Bool)))));
                //else (removing the case of "sound" for DAC 
                //proc.Ensures.Add(new Ensures(true, Expr.Iff(Expr.Ident(lname, BasicType.Bool), new OldExpr(new Token(), Expr.Ident(lname, BasicType.Bool)))));
            }
        }
        private static void InsertConstantsOK(string filenamePrefix, Program Prog, int n)
        {
            CodeCopier codeCopier = new CodeCopier();
            String OKstr = filenamePrefix + ".OK";// +n;
            AddIteAxiom(filenamePrefix, Prog.TopLevelDeclarations.ToList());

            //skip if the prog does not contain any valueis
            if (Prog.TopLevelDeclarations.Where(x => (x is Function && 
                                                        x.ToString().Contains(filenamePrefix + ".value_is"))).Count() == 0)
                return;
            int cnum = Util.FindStartNum(Prog);
            IEnumerable<Declaration> impls = Prog.TopLevelDeclarations.Where(x => x is Implementation);
            List<Declaration> decls = new List<Declaration>();
            foreach (Implementation impl in impls)
            {
                var newBlocks = new List<Block>();
                var blocks = impl.Blocks;
                foreach (Block block in blocks)
                {
                    Block newBlock;
                    var cmds = block.Cmds;
                    List<Cmd> newCmds = new List<Cmd>();
                    AssumeCmd newAssumeCmd = null;
                    foreach (Cmd cmd in cmds)
                    {
                        AssertCmd assertCmd = cmd as AssertCmd;
                        AssumeCmd assumeCmd = cmd as AssumeCmd;
                        if (assertCmd == null || assertCmd.Attributes == null)
                        {
                            newCmds.Add(codeCopier.CopyCmd(cmd));
                        }
                        else
                        {
                            newCmds.Add(codeCopier.CopyCmd(cmd));
                            if (!assertCmd.Attributes.Key.Contains("sourcefile"))
                                continue;
                            if (!assertCmd.Attributes.Next.Key.Contains("sourceline"))
                                continue;

                            List<Variable> vars = new List<Variable>();
                            var exprs = new List<Expr>();
                            vars.Add(new Formal(new Token(), new TypedIdent(new Token(), "c", BasicType.Int), true));
                            vars.Add(new Formal(new Token(), new TypedIdent(new Token(), "e", BasicType.Int), true));

                            exprs.Add(Expr.Ident(filenamePrefix + ".__ctobpl_const_" + cnum, BasicType.Int));
                            exprs.Add(getCallIte(Expr.Ident(OKstr, BasicType.Bool), Expr.Literal(1), Expr.Literal(0), filenamePrefix + "."));


                            var f = new FunctionCall(new Function(new Token(), filenamePrefix + ".value_is", vars, new Formal(new Token(), new TypedIdent(new Token(), "ret", BasicType.Bool), false)));
                            newAssumeCmd = new AssumeCmd(new Token(), new NAryExpr(new Token(), f, exprs));
                            //newCmds.Add(codeCopier.CopyCmd(newAssumeCmd));

                            var newConstDecl = new Constant(new Token(), new TypedIdent(new Token(), "__ctobpl_const_" + cnum, BasicType.Int), true);
                            newConstDecl.AddAttribute("sourceLine", assertCmd.Attributes.Next.Params[0]);
                            newConstDecl.AddAttribute("sourceFile", assertCmd.Attributes.Params[0]);
                            newConstDecl.AddAttribute("model_const", "OK"/*+n*/);
                            decls.Add(newConstDecl);

                            cnum++;
                        }

                    }
                    if (newAssumeCmd != null)
                        newCmds.Add(codeCopier.CopyCmd(newAssumeCmd));

                    newBlock = new Block(block.tok, block.Label, newCmds, block.TransferCmd);
                    newBlocks.Add(newBlock);
                }
                impl.Blocks = newBlocks;
            }
            Prog.AddTopLevelDeclarations(decls); //Prog.TopLevelDeclarations.InsertRange(1, decls);

        }
        private static string FindOK1var(List<Cmd> cmdSeq, string p1prefix)
        {
            string retval = "";
            char[] seps = { ' ', '=', '<' };
            foreach (Cmd cmd in cmdSeq)
            {
                AssignCmd assignCmd = cmd as AssignCmd;
                if (assignCmd != null)
                {
                    int i = 0;
                    //foreach (var rhs in assignCmd.Rhss)
                    //{
                    string stringCmd = assignCmd.ToString();
                    if (stringCmd.Contains("Output_of_" + p1prefix) && stringCmd.Contains("OK") && stringCmd.Contains(":="))
                        retval = stringCmd.Split(seps)[0];
                    i++;
                    //}
                }
            }
            return retval;
        }
        private static void InsertOK(int n, Program p, string[] args)
        {
            String OKstr = "OK" /*+ n*/;
            Token token = new Token();
            token.val = OKstr;
            token.filename = args[n - 1];

            //inserting global declaration of OK
            TypedIdent tid = new TypedIdent(new Token(), OKstr, new BasicType(SimpleType.Bool));
            GlobalVariable gok = new GlobalVariable(token, tid);
            p.AddTopLevelDeclaration(gok); // p.TopLevelDeclarations.Insert(0, gok);
            /*if (sound)
            {
                foreach (Procedure proc in p.TopLevelDeclarations.Where(x => x is Procedure))
                {
                    if(!proc.Name.Contains("HAVOC") && !proc.Name.Contains("havoc"))
                        proc.Modifies.Add(Expr.Ident(/*args[n-1].Replace("bpl","OK"),BasicType.Bool*/
            /*gok));
}
}*/
            InsertOKProcs(OKstr, p, args[n - 1]);
        }
        private static void InsertOKProcs(string OKstr, Program p, string filename)
        {
            OKstr = filename.Replace(".bpl", "") + "." + OKstr;
            CodeCopier codeCopier = new CodeCopier();
            IEnumerable<Declaration> impls = p.TopLevelDeclarations.Where(x => x is Implementation);
            foreach (Implementation impl in impls)
            {
                var newBlocks = new List<Block>();
                var blocks = impl.Blocks;
                foreach (Block block in blocks)
                {
                    Block newBlock;
                    var cmds = block.Cmds;
                    List<Cmd> newCmds = new List<Cmd>();
                    foreach (Cmd cmd in cmds)
                    {
                        AssertCmd assertCmd = cmd as AssertCmd;
                        if (assertCmd == null)
                        {
                            newCmds.Add(codeCopier.CopyCmd(cmd));
                        }
                        else
                        {
                            //HACK to get rid of IO stuff
                            if (assertCmd.Expr.ToString().Contains("iob_func"))
                                continue;
                            Token token = new Token();
                            token.val = ":=";
                            token.filename = filename;
                            Expr pred = Expr.And(Expr.Ident(OKstr, new BasicType(SimpleType.Bool)), assertCmd.Expr);
                            AssignCmd assignToOK = Cmd.SimpleAssign(token, new IdentifierExpr(new Token(), OKstr, new BasicType(SimpleType.Bool)), pred);
                            newCmds.Add(codeCopier.CopyCmd(assignToOK));
                            newCmds.Add(codeCopier.CopyCmd(cmd));
                        }
                    }
                    newBlock = new Block(block.tok, block.Label, newCmds, block.TransferCmd);
                    newBlocks.Add(newBlock);
                }
                impl.Blocks = newBlocks;
            }
        }

        //Differential inlining
        public static List<Declaration> GetNewDeclAndImplOfDiffInlineProc(Program p, List<string> calleesList, String fileName1, String fileName2)
        {
            // procedure declarations just for iteration
            IEnumerable<Declaration> procDeclsPIter = p.TopLevelDeclarations.Where(x => x is Procedure);
            IEnumerable<Declaration> procImplPIter = p.TopLevelDeclarations.Where(x => x is Implementation);
            // result declarations
            List<Declaration> procDeclsPlusDiffInlineProcs = p.TopLevelDeclarations.Where(x => x is Procedure).ToList();
            TransferCmd dmyTransferCmd = new ReturnCmd(Token.NoToken);

            foreach (Declaration currentProcDeclP in procDeclsPIter)
            {
                Procedure proc = (Procedure)currentProcDeclP;

                if (calleesList.Contains(proc.Name))
                {
                    Implementation procImpl = (Implementation) Util.getDeclarationByName(proc.Name, procImplPIter);
                    if (procImpl != null)
                    {
                        var newProc = new Procedure(proc.tok, proc.Name + "_Diff_Inline", proc.TypeParameters, proc.InParams, proc.OutParams, proc.Requires, proc.Modifies, proc.Ensures);
                        newProc.Modifies = proc.Modifies;
                        procDeclsPlusDiffInlineProcs.Add(newProc); //HT[proc] := newProc;
                        CallCmd ccmdThen = null;
                        CallCmd ccmdElse = null;
                        var inParams = new List<Expr>();
                        var outParams = new List<IdentifierExpr>();

                        foreach (Variable v in procImpl.InParams)
                        {
                            inParams.Add(new IdentifierExpr(v.tok, v));
                        }
                        foreach (Variable v in procImpl.OutParams)
                        {
                            outParams.Add(new IdentifierExpr(v.tok, v));
                        }

                        ccmdThen = new CallCmd(procImpl.tok, procImpl.Name, inParams, outParams);
                        ccmdThen.Proc = proc;
                        if (procImpl.Name.Contains(fileName1))
                        {
                            var newProcName = procImpl.Name.Replace(fileName1, fileName2);
                            ccmdElse = new CallCmd(procImpl.tok, newProcName, inParams, outParams);
                            ccmdElse.Proc = (Procedure) Util.getDeclarationByName(newProcName, procDeclsPIter);
                        }
                        else
                        {
                            ccmdElse = new CallCmd(procImpl.tok, procImpl.Name, inParams, outParams);
                            ccmdElse.Proc = proc;
                        }

                        // generate a local var for diff conditions
                        var locVars = new List<Variable>();
                        //var variable = new LocalVariable(Token.NoToken, new TypedIdent(Token.NoToken, "diffConditions", Microsoft.Boogie.Type.Bool));
                        //var idExprVariable = new IdentifierExpr(Token.NoToken, variable);
                        //locVars.Add(variable);

                        // First block
                        List<Cmd> entryCmd = new List<Cmd>();
                        var labelEntry = new GotoCmd(Token.NoToken, new List<String>() { "THEN", "ELSE" });
                        //labelEntry.labelTargets = new List<Block>();
                        labelEntry.labelNames = new List<string>();
                        labelEntry.labelNames.Add("THEN");
                        labelEntry.labelNames.Add("ELSE");
                        //labelEntry.labelTargets.Add("THEN");
                        //labelEntry.labelTargets.Add("ELSE");
                        Block entryBl = new Block(Token.NoToken, "ENTRY", entryCmd, labelEntry);

                        // Second block
                        List<Cmd> bodyThen = new List<Cmd>();
                        bodyThen.Add(new AssumeCmd(Token.NoToken, Expr.True));
                        bodyThen.Add(ccmdThen);
                        var labelThen = new GotoCmd(Token.NoToken, new List<String>() { "DONE" });
                        //labelThen.labelTargets = new List<Block>();
                        labelThen.labelNames = new List<string>();
                        labelEntry.labelNames.Add("DONE");
                        //labelThen.labelTargets.Add("DONE");
                        Block thenBl = new Block(Token.NoToken, "THEN", bodyThen, labelThen);

                        // Third block
                        var labelElse = new GotoCmd(Token.NoToken, new List<String>() { "DONE" });
                        //labelElse.labelTargets = new List<Block>();
                        labelElse.labelNames = new List<string>();
                        labelElse.labelNames.Add("DONE");
                        //labelElse.labelTargets.Add("DONE");
                        List<Cmd> bodyElse = new List<Cmd>();
                        bodyElse.Add(new AssumeCmd(Token.NoToken, Expr.False));
                        bodyElse.Add(ccmdElse);
                        Block elseBl = new Block(Token.NoToken, "ELSE", bodyElse, labelElse);

                        // Forth block
                        Block doneBl = new Block(Token.NoToken, "DONE", new List<Cmd>(), dmyTransferCmd);

                        // Join all blocks
                        var listBlock = new List<Block>();
                        listBlock.Add(entryBl);
                        listBlock.Add(thenBl);
                        listBlock.Add(elseBl);
                        listBlock.Add(doneBl);

                        var newImpl = new Implementation(procImpl.tok, procImpl.Name + "_Diff_Inline", procImpl.TypeParameters, procImpl.InParams, procImpl.OutParams, locVars, listBlock);
                        newImpl.Proc = newProc;
                        procDeclsPlusDiffInlineProcs.Add(newImpl);
                    }
                }
            }

            return procDeclsPlusDiffInlineProcs;
        }
        public static void DiffInlineRenameCalleesInProcImpl(List<Declaration> procDecls, List<Declaration> procImpl)
        {
            foreach (Implementation imp1 in procImpl)
            {
                foreach (Block b1 in imp1.Blocks)
                {
                    foreach (Object sq in b1.Cmds)
                    {
                        if (sq is CallCmd)
                        {
                            CallCmd ccmd = (CallCmd)sq;
                            if ((!ccmd.Proc.Name.Contains("_Diff_Inline")) && (!imp1.Name.Contains("_Diff_Inline")) && (!imp1.Name.StartsWith("EQ_"))) //HT.find(cmd.Proc)
                            {
                                var procName = ccmd.Proc.Name + "_Diff_Inline"; //HT[cmd.Proc].Name;
                                var procFinded = (Procedure) Util.getDeclarationByName(procName, procDecls); //ccmd.Proc := newProc;
                                if (procFinded != null)
                                {
                                    int indexOfOriginalCmd = b1.Cmds.IndexOf(ccmd);
                                    ccmd = new CallCmd(ccmd.tok, procName, ccmd.Ins, ccmd.Outs);
                                    ccmd.Proc = procFinded;
                                    b1.Cmds[indexOfOriginalCmd] = ccmd;
                                }
                            }
                        }
                    }
                }
            }
        }

        //Mutual summary logic (moved to MutualSummary.cs)

        //Basic EQ checking
        private static List<string> GetInequalProcsFromDumpEqFiles()
        {
            List<string> InequalProc = null;
            if (Options.checkAssertsOnly && !Options.oneproc && !Options.nonModularMode)
            {
                try
                {
                    InequalProc = System.IO.File.ReadAllLines(".\\dump_" + v1name.Replace(".bpl", "") + "_" + v2name.Replace(".bpl", "") + ".txt").ToList<string>();
                    if (InequalProc.Count == 0)
                        InequalProc = null;
                }
                catch (FileNotFoundException)
                {
                    InequalProc = null;
                }
            }
            return InequalProc;
        }
        //TODO: refactor this method
        //The roots_cgi are passed because under /nonmodular, the impls are already inlined
        private static int CreateAndVerifyEqProcs(CallGraph cg1, CallGraph cg2, CallGraph cg,
            IEnumerable<CallGraphNode> roots_cg1, IEnumerable<CallGraphNode> roots_cg2,
            Dictionary<string, string> funs,
            Program mergedProgram,
            StreamWriter dumpfile, List<string> InequalProc)
        {

            int TotalProcCount, TotalNumCex, TotalNumFailed, TotalNumCrashed;
            TotalNumCex = TotalNumCrashed = TotalNumFailed = TotalProcCount = 0;
            var verificationTasks = new List<VerificationTask>();
            var newDecls = new List<Declaration>();
            var mergedProgramNewDecl = new Program();
            //mergedProgramNewDecl.TopLevelDeclarations = mergedProgram.TopLevelDeclarations;

            foreach (var n in cg1.GetPostOrder())
            { //the order is topological for non-recursive programs            
                //we're iterating over a topo sort of the first program, but we actually want to
                //visit the combined callgraph
                var n1 = cg.NodeOfName(n.Name);
                var n2Name = funs.Get(n1.Name);
                if (n2Name == null)
                {
                    Log.Out(Log.Normal, "Could not find the procedure " + n1.Name + " in the config file....skipping");
                    continue;
                }
                var n2 = cg.NodeOfName(n2Name);
                if (n2 == null)
                {
                    Log.Out(Log.Error, "ERROR: Could not find the match " + n2Name + " in " + v2name);
                    continue;
                }
                if (n1.Proc == null || n2.Proc == null)
                {
                    Log.Out(Log.Normal, "Missing procedure for " + n1.Name + " or " + n2.Name + ": skipping...");
                    continue;
                }
                //create uifs, grabs the readset from callgraph
                //same uif for both versions   
                //injects them as postcondition
                if (SDiff.Boogie.Process.InjectUninterpreted(n1.Proc, n2.Proc, cfg, cg, newDecls, Options.checkAssertsOnly))
                    Log.Out(Log.Error, "Failed to add postconditions to " + n1.Name + " and " + n2.Name);
                mergedProgram.AddTopLevelDeclarations(newDecls);
                newDecls = new List<Declaration>(); //do not add duplicate declarations
                if (n1.Name.EndsWith("nondet_choice"))
                {
                    Log.Out(Log.Normal, "skipping nondet_choice");
                    continue;
                }
                if (Options.UnsoundRecursion && n1.IsSinglyRecursive())
                {
                    Log.Out(Log.Normal, n1.Name + " is recursive. skipping..");
                    continue;
                }
                if (n1.Impl == null && n2.Impl == null)
                {
                    Log.Out(Log.Normal, "No implementation for " + n1.Name + ": skipping...");
                    continue;
                }
                if (n1.Impl == null)
                {
                    Log.Out(Log.Error, "!Missing implementation for " + n1.Name + "..trying to map it to the other\n");
                    n1.Proc.Ensures = n2.Proc.Ensures;
                    n1.Proc.InParams = n2.Proc.InParams;
                    n1.Proc.Modifies = n2.Proc.Modifies;
                    n1.Proc.OutParams = n2.Proc.OutParams;
                    n1.Proc.Requires = n2.Proc.Requires;
                    n1.Proc.TypeParameters = n2.Proc.TypeParameters;
                    continue;
                }
                if (n2.Impl == null)
                {
                    Log.Out(Log.Error, "!Missing implementation for " + n2.Name + "..trying to map it to the other\n");
                    n2.Proc.Ensures = n1.Proc.Ensures;
                    n2.Proc.InParams = n1.Proc.InParams;
                    n2.Proc.Modifies = n1.Proc.Modifies;
                    n2.Proc.OutParams = n1.Proc.OutParams;
                    n2.Proc.Requires = n1.Proc.Requires;
                    n2.Proc.TypeParameters = n1.Proc.TypeParameters;
                    continue;
                }
                if (!Options.oneproc && InequalProc != null && !InequalProc.Contains(n1.Impl.Name.Replace(p1Prefix + ".", "")) && !deactivateHacks)
                {
                    Log.Out(Log.Verifier, "Not checking " + n1.Impl.Name + " as it is semantically equivalent to old");
                    continue;
                }
                //skip if the procedure belongs to the syntactically equal list
                if (Options.syntacticEqProcs.Contains(n1.Impl.Name.Replace(p1Prefix + ".", "")))
                {
                    Log.Out(Log.Normal, "Syntactically equivalent:: Skipping procedure " + n1.Impl.Name.Replace(p1Prefix + ".", "") + "...");
                    continue;
                }
                //[SKL]: What is going on here?
                var ignores = new HashSet<Variable>(n1.IgnoreSet);
                ignores.UnionWith(n2.IgnoreSet);

                if (Options.nonModularMode)
                {
                    //only analyze methods that are roots
                    //trouble is that all the calls have been inlined
                    //Console.WriteLine("Root1 = {0}", roots_cg1.MapConcat(x => x.Name, ", "));
                    //Console.WriteLine("Root2 = {0}", roots_cg2.MapConcat(x => x.Name, ", "));
                    bool foundRoot = false;
                    //don't compare by names as the names in roots_cgi doesn't have prefixes
                    foreach (var r in roots_cg1)
                    {
                        if (foundRoot) break;
                        if (r.Name == Util.TrimPrefixWithDot(n1.Name, p1Prefix))
                            foreach (var s in roots_cg2)
                                if (s.Name == Util.TrimPrefixWithDot(n2.Name, p2Prefix))
                                {
                                    foundRoot = true; 
                                    break;
                                }
                    }
                    if (!foundRoot && onlyAnalyzeRootsOfCallGraphsForInlineAll)
                    {
                        Log.Out(Log.Normal, "nonmodular mode: Skipping non-root nodes " + n1.Name + ", " + n2.Name);
                        continue;
                    }
                }

                // Creates EQ_f_f' function
                List<Variable> outputVars;
                var eqp =
                  Transform.EqualityReduction(n1.Impl, n2.Impl, cfg.FindProcedure(n1.Name, n2.Name), ignores, out outputVars);

                //RS: adding OK1=true, OK2=true, and OK1=>OK2
                if (Options.checkAssertsOnly)
                    InsertOkChecks(mergedProgram, n1, n2, eqp);

                // if any visible output
                if (eqp != null)
                {
                    mergedProgram.AddTopLevelDeclarations(outputVars.Map(x => x as Declaration));
                    mergedProgram.AddTopLevelDeclaration(eqp.fst);
                    mergedProgram.AddTopLevelDeclaration(eqp.snd);
                    //says which EQ to verify
                    verificationTasks.Add(new VerificationTask(eqp.snd, n1.Impl, n2.Impl, outputVars));
                }
                else
                {
                    //it may be that these functions have no comparable effect. if so, don't generate a verification task
                    //we'll split their uninterpreted functions, but otherwise don't generate a verification task
                    var vt = new VerificationTask(null, n1.Impl, n2.Impl);
                    vt.Result = VerificationResult.Error;
                    SDiff.Boogie.Process.RewriteUninterpretedOnDiseq(vt, SDiff.Boogie.Process.BuildProgramDictionary(mergedProgram.TopLevelDeclarations.ToList()));
                }

                if (verificationTasks.Count > 0)
                { //Should be either {0,1}
                    if (verificationTasks.Count > 1)
                    {
                        Log.Out(Log.Error, "RS: something went wrong in restoring");
                        return 1;
                    }
                    //declare the uninterpreted funcs/canonical set of constants  in merged program

                    var canonicalConst = SDiff.Boogie.ConstantFactory.Get().Constants.Map(x => x as Declaration);
                    mergedProgram.AddTopLevelDeclarations(canonicalConst);

                    Log.Out(Log.Normal, "Resolving and Typechecking again..");
                    if (SDiff.Boogie.Process.ResolveAndTypeCheckThrow(mergedProgram, Options.MergedProgramOutputFile))
                    {
                        Log.LogEmit(Log.Normal, mergedProgram.Emit);
                        return 1;
                    }

                    if (Options.TraceVerify)
                    {
                        Log.Out(Log.Normal, "merged program with ufs etc");
                        Log.LogEmit(Log.Normal, mergedProgram.Emit);
                    }

                    // callgraph has changed because EQ programs are added 
                    //commenting with the hope that the callgraph doesn't need EQ procs (2/23/13)
                    //Log.Out(Log.Normal, "Building callgraphs and computing read and write sets");
                    //cg = CallGraph.Make(mergedProgram); //SKL: this might make it slow
                    //ReadWriteSetDecorator.DoDecorate(cg); //start from scratch to fill in the read/write sets
                    mergedProgram.AddTopLevelDeclarations(mergedProgramNewDecl.TopLevelDeclarations.ToList());
                    mergedProgram.TopLevelDeclarations = SDiff.Boogie.Process.RemoveDuplicateDeclarations(mergedProgram.TopLevelDeclarations.ToList());

                    var boogieOptions = Options.GetBoogieOptions();
                    Boogie.Process.InitializeBoogie(boogieOptions);
                    //VC.ConditionGeneration vcgen = BoogieVerify.InitializeVC(mergedProgram);

                    // dictionary of all program AST objects by name
                    var progDict = SDiff.Boogie.Process.BuildProgramDictionary(mergedProgram.TopLevelDeclarations.ToList());

                    Log.Out(Log.Verifier, "Preparing to verify " + verificationTasks.Count + " pairs");

                    long maxElapsed = 0;
                    int numCex = 0;
                    int curCex = 0;
                    int numFailed = 0;
                    int numCrashed = 0;
                    HashSet<string> failedProcs = new HashSet<string>();

                    bool crashed;
                    List<string> failedImpls = new List<string>(); //implementations that have cex
                    foreach (var vt in verificationTasks) //Executes exactly once
                    {
                        if (Options.justMain && !vt.Eq.Name.Contains("main"))
                            continue;
                        var time = Stopwatch.StartNew();

                        // this is required to add inline attributes to foo/foo' in the merged program  
                        // calls verify and then enumerates all counterexamples
                        // vt records the status and the counterexamples 

                        if (Options.refinedStmtTaint)
                        {
                            Debug.Assert(Options.nonModularMode, "RefinedStmtTaint is currently enabled only with nonModular mode");
                            Debug.Assert(Options.splitOutputEqualities, "RefinedStmtTaint is currently enabled only with nonModular mode");
                            //ensure single root. roots_cgi containts roots without implementations as well
                            var implRoots_cg1 = roots_cg1.Where(x => x.Impl != null);
                            var implRoots_cg2 = roots_cg2.Where(x => x.Impl != null);
                            Debug.Assert(implRoots_cg1.Count() == 1 && implRoots_cg2.Count() == 1, "RefinedStmtTaint is currently enabled with only a single root");
                            //just take control and return 
                            var stmtTaint = new SymDiff.SemanticTaint.RefinedStmtTaint(mergedProgram, vt.Eq, vt.Left, vt.Right);
                            return stmtTaint.PerformTaintAnalysis();
                        }

                        //RS: this is only file processing (if wrapper is true)
                        curCex = BoogieVerify.RunVerificationTask(vt, null, mergedProgram, /*failedProcs,*/ out crashed, wrapper);
                        if (wrapper)
                            ExecuteWithWrapper(ref curCex, ref numCrashed, vt);
                        if (Options.PropagateEquivs)
                        {
                            SDiff.Boogie.Process.RewriteUninterpretedOnDiseq(vt, progDict, InequalProc);
                            if (Options.InlineWhenFail)
                            {
                                failedProcs.Add(vt.Left.Proc.Name);
                                failedProcs.Add(vt.Right.Proc.Name);
                            }
                        }
                        time.Stop();
                        if (maxElapsed < time.ElapsedMilliseconds)
                            maxElapsed = time.ElapsedMilliseconds;
                        Log.Out(Log.Time, time.ElapsedMilliseconds + "ms");
                        if (curCex > 0)
                        {
                            numFailed++;
                            numCex += curCex;
                            failedImpls.Add(vt.Left.Name);
                        }
                    }

                    //totClock.Stop();
                    TotalProcCount += verificationTasks.Count;
                    Log.Out(Log.Summary, "Checked " + verificationTasks.Count + " procedures.");
                    Log.Out(Log.Summary, "Max elapsed: " + maxElapsed + "ms");
                    TotalNumCex += numCex;
                    Log.Out(Log.Summary, "Total Counterexamples: " + numCex);
                    TotalNumFailed += numFailed;
                    Log.Out(Log.Summary, "Number of failed verifies: " + numFailed);
                    TotalNumCrashed += numCrashed;
                    Log.Out(Log.Summary, "Number of verifier failures: " + numCrashed);
                    foreach (var impl in failedImpls)
                    {
                        Log.Out(Log.Normal, "Failed proc with counterexample: " + impl);
                        if (dumpEq)
                        {
                            dumpfile.WriteLine(impl.Split('.')[1]);
                        }
                    }
                    Log.Out(Log.MSummary, "\t" + verificationTasks.Count + "\t" +
                                                 maxElapsed + "\t" +
                                                 numCex + "\t" +
                                                 numFailed + "\t" +
                                                 numCrashed + "\t" +
                                                 totClock.ElapsedMilliseconds + "\t" +
                                                 BadGlobalState.MaxUFArgs + "\t");
                    //Do not know whether this works
                    //(BadGlobalState.SumUFArgs / BadGlobalState.NumUFs));
                    mergedProgram.RemoveTopLevelDeclaration(eqp.fst);
                    mergedProgram.RemoveTopLevelDeclaration(eqp.snd);
                    mergedProgram.RemoveTopLevelDeclarations(x => canonicalConst.Contains(x));
                    //mergedProgram.RemoveTopLevelDeclarations(x => newDecls.Contains(x));
                    mergedProgram.RemoveTopLevelDeclarations(x => mergedProgramNewDecl.TopLevelDeclarations.Contains(x));
                    verificationTasks = new List<VerificationTask>();
                }
                //RS: restore states
                newDecls = new List<Declaration>();
            }
            //Overall statistics
            Log.Out(Log.Final, "(#Procs, #Cex, #NotEq, #Crash, #Time) = (" +
                TotalProcCount + "," +
                TotalNumCex + "," +
                TotalNumFailed + "," +
                TotalNumCrashed + "," +
                totClock.ElapsedMilliseconds +
                ")");

            if (dumpEq)
                dumpfile.Close();
            return 0;
        }


        private static void ExecuteWithWrapper(ref int curCex, ref int numCrashed, VerificationTask vt)
        {
            ProcessStartInfo procInfo = new ProcessStartInfo();
            //System.Diagnostics.Process proc = new System.Diagnostics.Process();
            procInfo.UseShellExecute = false;
            procInfo.FileName = @"BoogieWrapper.exe";

            procInfo.Arguments = "RS" + vt.Eq.Name + "_out.bpl" + " " + vt.Eq.Name + " " + vt.Left.Name + " " + vt.Right.Name;
            procInfo.WindowStyle = ProcessWindowStyle.Hidden;
            procInfo.RedirectStandardOutput = true;
            Process proc = new Process();
            proc.StartInfo = procInfo;
            proc.EnableRaisingEvents = false;
            Log.Out(Log.Verifier, "BoogieWrapper called on " + vt.Eq.Name + " with " + procInfo.Arguments);
            proc.Start();
            string output = proc.StandardOutput.ReadToEnd();
            Log.Out(Log.Normal, output);
            proc.WaitForExit();
            //if (proc.WaitForExit(5000))
            curCex = proc.ExitCode;
            //else
            //  curCex = -1;
            Log.Out(Log.Verifier, "BoogieWrapper says " + curCex + " for " + vt.Eq.Name);
            if (curCex < 0)
                numCrashed++;
            if (curCex == 0)
                vt.Result = VerificationResult.Verified;
            if (curCex < 0)
            {
                switch (curCex)
                {
                    case -1: vt.Result = vt.Result = VerificationResult.TBA; break;
                    case -2: vt.Result = VerificationResult.OutOfMemory; break;
                    case -3: vt.Result = VerificationResult.TimeOut; break;
                    default: vt.Result = VerificationResult.Unknown; break;
                }
            }
            if (curCex > 0)
                vt.Result = VerificationResult.Error;
        }

        //ITE logic
        private static void AddIteAxiom(string fnp,List<Declaration> Decls)
        {
            fnp += ".";
            var decl = new Function(new Token(), "ite", getVarsIte(), new Formal(new Token(), new TypedIdent(new Token(), "ret", BasicType.Int), false));
            
            var thenExpr = new NAryExpr(new Token(), new BinaryOperator(new Token(), BinaryOperator.Opcode.Imp), getThenArgSeq(fnp));
            var axiomThen = new Axiom(new Token(), new ForallExpr(new Token(), getVarsIte(), thenExpr));

            var elseExpr = new NAryExpr(new Token(), new BinaryOperator(new Token(), BinaryOperator.Opcode.Imp), getElseArgSeq(fnp));
            var axiomElse = new Axiom(new Token(), new ForallExpr(new Token(), getVarsIte(), elseExpr));


            Decls.Insert(0, axiomThen);
            Decls.Insert(0, axiomElse);
            Decls.Insert(0, decl);
                
        }
        private static List<Expr> getThenArgSeq(string fnp)
        {
            var antExprSeq = new List<Expr>();
            antExprSeq.Add(new IdentifierExpr(new Token(), new BoundVariable(new Token(), new TypedIdent(new Token(), "b", BasicType.Bool))));
            antExprSeq.Add(Expr.Literal(true));

            var thenAntecedent = new NAryExpr(new Token(), new BinaryOperator(new Token(), BinaryOperator.Opcode.Eq), antExprSeq);
                
            var iteCall = getCallIte(
                new IdentifierExpr(new Token(), new BoundVariable(new Token(), new TypedIdent(new Token(), "b", BasicType.Bool))),
                new IdentifierExpr(new Token(),new  BoundVariable(new Token(), new TypedIdent(new Token(), "x", BasicType.Int))),
                new IdentifierExpr(new Token(), new BoundVariable(new Token(), new TypedIdent(new Token(), "y", BasicType.Int))),
                fnp);
            var thenConsequent = Expr.Eq(iteCall, new IdentifierExpr(new Token(), new BoundVariable(new Token(), new TypedIdent(new Token(), "x", BasicType.Int))));
 
            var thenArgSeq = new List<Expr>();
            thenArgSeq.Add(thenAntecedent);
            thenArgSeq.Add(thenConsequent);
            return thenArgSeq;
        }
        private static List<Expr> getElseArgSeq(string fnp)
        {
            var antExprSeq = new List<Expr>();
            antExprSeq.Add(new IdentifierExpr(new Token(), new BoundVariable(new Token(), new TypedIdent(new Token(), "b", BasicType.Bool))));
            antExprSeq.Add(Expr.Literal(false));

            var elseAntecedent = new NAryExpr(new Token(), new BinaryOperator(new Token(), BinaryOperator.Opcode.Eq), antExprSeq);

            var iteCall = getCallIte(
                new IdentifierExpr(new Token(), new BoundVariable(new Token(), new TypedIdent(new Token(), "b", BasicType.Bool))),
                new IdentifierExpr(new Token(), new BoundVariable(new Token(), new TypedIdent(new Token(), "x", BasicType.Int))),
                new IdentifierExpr(new Token(), new BoundVariable(new Token(), new TypedIdent(new Token(), "y", BasicType.Int))),
                fnp);
            var elseConsequent = Expr.Eq(iteCall, new IdentifierExpr(new Token(), new BoundVariable(new Token(), new TypedIdent(new Token(), "y", BasicType.Int))));

            var elseArgSeq = new List<Expr>();
            elseArgSeq.Add(elseAntecedent);
            elseArgSeq.Add(elseConsequent);
            return elseArgSeq;
        }
        private static List<Variable> getVarsIte()
        {
            List<Variable> varsIte = new List<Variable>();
            varsIte.Add(new Formal(new Token(), new TypedIdent(new Token(), "b", BasicType.Bool), true));
            varsIte.Add(new Formal(new Token(), new TypedIdent(new Token(), "x", BasicType.Int), true));
            varsIte.Add(new Formal(new Token(), new TypedIdent(new Token(), "y", BasicType.Int), true));
            return varsIte;
        }
        private static NAryExpr getCallIte(Expr b, Expr x, Expr y, string iteStr="")
        {
            List<Expr> exprsIte = new List<Expr>();
            var ite = new FunctionCall(new Function(new Token(), iteStr+"ite", getVarsIte(), new Formal(new Token(), new TypedIdent(new Token(), "ret", BasicType.Int), false)));
            exprsIte.Add(b);
            exprsIte.Add(x);
            exprsIte.Add(y);
            var callIte = new NAryExpr(new Token(), ite, exprsIte);
            return callIte;
        }

        public static int AllInOneMain(string[] args)
        {
            totClock = Stopwatch.StartNew();
            ///////////////////////////////////////////////////
            // Command line parsing
            ///////////////////////////////////////////////////
            if (ParseCmdLine(args) == 1) throw new Exception("Parsing failed");
            List<string> InequalProc = GetInequalProcsFromDumpEqFiles(); //RS
            //////////////////////////////
            // Parse the two programs
            //////////////////////////////
            //Creates two Boogie Program objects  
            Boogie.Process.InitializeBoogie(Options.BoogieUserOpts); //Why do we initialize before parsing?
            Log.Out(Log.Normal, "Parsing programs");
            Program p1, p2;
            if ((p1 = SDiff.Boogie.Process.ParseProgram(v1name)) == null) return 1;
            if ((p2 = SDiff.Boogie.Process.ParseProgram(v2name)) == null) return 1;
            // Reorganizing the topleveldeclarations of the two versions of bpl programs - hemr
            p1 = RestructureProgram(p1);
            p2 = RestructureProgram(p2);

            /////////////////////////////////////////////////////////////////////////////////////
            // Some modification of p1, p2
            /////////////////////////////////////////////////////////////////////////////////////
            //Before the first time we resolve the programs, we have to unify the two program's declared types.
            // to do this, we're going to directly copy the types from p2 into p1. obviously this only works if p1's types
            // are otherwise the same as p2's
            //TODO: use a type mapping instead
            //collect type decls
            IEnumerable<Declaration>
              t2s = p2.TopLevelDeclarations.Where(x => x is TypeCtorDecl || x is TypeSynonymDecl);
            p1.TopLevelDeclarations = p1.TopLevelDeclarations.Where(x => !(x is TypeCtorDecl) && !(x is TypeSynonymDecl));
            p1.AddTopLevelDeclarations(t2s);
            //the types of the two programs are unified even before Resolve
            //collect globals, constants, functions, and axioms
            //Filter : 'a list -> ('a -> bool) -> 'a list
            Boogie.Process.ResolveAndTypeCheckThrow(p1, v1name);
            Boogie.Process.ResolveAndTypeCheckThrow(p2, v2name);

            //new: remove unused global upfront (exception later)
            //var g1Uses = GetUsedVariables(p1).GetUseSetForProgram();
            //var g2Uses = GetUsedVariables(p2).GetUseSetForProgram();
            //p1.RemoveTopLevelDeclarations(x =>
            //    (x is GlobalVariable &&
            //    !g1Uses.Contains(x)));
            //p2.RemoveTopLevelDeclarations(x =>
            //    (x is GlobalVariable &&
            //    !g2Uses.Contains(x)));                

            IEnumerable<Declaration>
              g1s = p1.TopLevelDeclarations.Where(x => x is GlobalVariable),
              g2s = p2.TopLevelDeclarations.Where(x => x is GlobalVariable);
            IEnumerable  <Declaration>
              c1s = p1.TopLevelDeclarations.Where(x => x is Constant),
              c2s = p2.TopLevelDeclarations.Where(x => x is Constant);
            IEnumerable<Declaration>
              f1s = p1.TopLevelDeclarations.Where(x => x is Function),
              f2s = p2.TopLevelDeclarations.Where(x => x is Function);

            //function arguments have a bothersome habit of being unnamed, so we give them arbitrary names
            //note that configuration inference has to give them the same names (arg_0 ... arg_n, out_ret)
            // modifies each f \in f1s, f2s by giving names to unnamed args
            f1s.Iter(x => B.U.NameFunctionArgs((Function)x));
            f2s.Iter(x => B.U.NameFunctionArgs((Function)x));

            //resolve the programs: creating a well-formed AST of the program     
            //Major side effects:
            //   resolves the strings representation into objects 
            //   types, variables, procedure calls, procedure symbols in expr, 
            if (SDiff.Boogie.Process.ResolveProgram(p1, v1name) || SDiff.Boogie.Process.ResolveProgram(p2, v2name))
                return 1;
            //typecheck the programs
            //Main side effect: would inline calls with {inline} attribute
            if (SDiff.Boogie.Process.TypecheckProgram(p1, v1name) || SDiff.Boogie.Process.TypecheckProgram(p2, v2name))
                return 1;
            /////////////////////////////////////////////////////////////////////////////////////
            // Some modification of p1, p2 ends
            /////////////////////////////////////////////////////////////////////////////////////

            //just present to test invoking Houdini directly
            if (Options.invokeHoudiniDirectlyOnMergedBpl)
            {
                MutualSummary.PerformHoudiniInferece(); //invokes houdini in previously generated mergedProgSingle.bpl
                return 0;
            }

            /////////////////////////////////////////////////////////
            //// Inlining logic starts
            ////////////////////////////////////////////////////////
            //inline the procedures with inline attribute
            //Problem is that impl.Proc is not defined here
            IEnumerable<CallGraphNode> roots_cg1 = null, roots_cg2 = null;
            if (Options.nonModularMode)
            {
                //special hack: the asserts from ensures + inlining are not visited during StripContracts later
                if (!Options.checkAssertsOnly)
                    StripContracts(p1, p2); //asserts/ensures don't matter for equivalence

                CallGraph cg1_temp = CallGraph.Make(p1);
                CallGraph cg2_temp = CallGraph.Make(p2);
                roots_cg1 = cg1_temp.Roots;
                roots_cg2 = cg2_temp.Roots;
                //RS: Inline to create one big procedure
                Util.InlineEverything(p1, Options.inlineAllRecursionDepth); //just adds the attributes, does not inline yet
                Util.InlineEverything(p2, Options.inlineAllRecursionDepth);
            }
            else
            {
                Util.InlineProg(p1);
                Util.InlineProg(p2);
            }
            if (inlineWhenMissing)
            {
                var pdict1 = SDiff.Boogie.Process.BuildProgramDictionary(p1.TopLevelDeclarations.ToList());
                var pdict2 = SDiff.Boogie.Process.BuildProgramDictionary(p2.TopLevelDeclarations.ToList());
                Util.InlineMissingImplementations(p1, p2, pdict1, pdict2);
                Util.InlineMissingImplementations(p2, p1, pdict2, pdict1);
            }
            //RS: resolve and typecheck
            if (SDiff.Boogie.Process.ResolveProgram(p1, v1name) || SDiff.Boogie.Process.ResolveProgram(p2, v2name))
                return 1;
            if (SDiff.Boogie.Process.TypecheckProgram(p1, v1name) || SDiff.Boogie.Process.TypecheckProgram(p2, v2name))
                return 1;
            /////////////////////////////////////////////////////////
            //// Inlining logic ends
            ////////////////////////////////////////////////////////

            ////////////////////////////////////////////////////////
            // Turn asserts into OK starts
            ////////////////////////////////////////////////////////
            //RS: InsertOK(n,pn,args) introduces OK_n=OK_n && P in pn(=args[n-1])
            if (Options.checkAssertsOnly)
            {
                if (TurnAssertsIntoOK(args, p1, p2, g1s.ToList(), g2s.ToList()) == 1)
                    return 1;
            }
            ////////////////////////////////////////////////////////
            // Turn asserts into OK ends
            ////////////////////////////////////////////////////////

            //////////////////////////////////////////////////////////
            // Strip/Free contracts
            //////////////////////////////////////////////////////////
            // only "assume" are left, assert p --> assert true, others are removed
             StripContracts(p1, p2); 
            //RS: Make sure that every requires and ensures is free (does not touch assert)
            Util.MakeContractsFree(p1);
            Util.MakeContractsFree(p2);
            //just making sure
            if (SDiff.Boogie.Process.ResolveProgram(p1, v1name) || SDiff.Boogie.Process.ResolveProgram(p2, v2name))
                return 1;
            //////////////////////////////////////////////////////////
            // Strip/Free contracts ends
            //////////////////////////////////////////////////////////

            //////////////////////////////////////////////////////////
            // Renaming logic starts
            //////////////////////////////////////////////////////////            
            //now we'll uniquely rename everything by prefixing with the filename root
            //has the side effect of dumping->reading from the disk (TODO: remove)
            Log.Out(Log.Normal, "Namespacing ASTs");
            RenameSymbolsByVersion(ref p1, g1s.ToList(), c1s.ToList(), f1s.ToList(), v1name);
            RenameSymbolsByVersion(ref p2, g2s.ToList(), c2s.ToList(), f2s.ToList(), v2name);
            //////////////////////////////////////////////////////////
            // Renaming logic ends
            //////////////////////////////////////////////////////////            


            //////////////////////////////////////////////////////////
            // Creation of the merged program starts
            //////////////////////////////////////////////////////////                        
            //get rid of this
            Program mergedProgram = new Program();
            var mergeGlobals = !Options.mutualSummaryMode; //when using mutual summary, keep globals separate 
            //has the side effect of dumping->reading from the disk (TODO: remove)
            if (CreateMergedProgram(p1, p2, t2s.ToList(), g2s.ToList(), c2s.ToList(), f1s.ToList(), f2s.ToList(), mergeGlobals, ref mergedProgram) == 1)
                return 1;

            if (Options.DifferentialInline)
            { //Add the diff_inline procedures
                var calleesMergedProgram = Util.getCalleesList(mergedProgram.TopLevelDeclarations.Where(x => x is Implementation).ToList());
                mergedProgram.AddTopLevelDeclarations(GetNewDeclAndImplOfDiffInlineProc(mergedProgram, calleesMergedProgram, v1name.Replace(".bpl", ""), v2name.Replace(".bpl", "")));
                DiffInlineRenameCalleesInProcImpl(mergedProgram.TopLevelDeclarations.Where(x => x is Procedure).ToList(), 
                    mergedProgram.TopLevelDeclarations.Where(x => x is Implementation).ToList());
                mergedProgram.TopLevelDeclarations = SDiff.Boogie.Process.RemoveDuplicateDeclarations(mergedProgram.TopLevelDeclarations.ToList());
            }
            if (Options.checkAssertsOnly) //RS ADD OK Ensures
                AddOKEnsures(p1Prefix, p2Prefix, mergeGlobals, mergedProgram.TopLevelDeclarations.Where(x => x is Procedure).ToList());
            //////////////////////////////////////////////////////////
            // Creation of the merged program end
            //////////////////////////////////////////////////////////                        


            ///////////////////////////////////////////////////////////
            //mutual summaries mode
            ///////////////////////////////////////////////////////////
            if (Options.mutualSummaryMode)
            {
                var houdiniOpt = Options.dontUseHoudiniForMS ? Options.INFER_OPT.NO_INFER :
                    !Options.useAbstractHoudiniInference ? Options.INFER_OPT.HOUDINI : 
                    Options.INFER_OPT.ABS_HOUDINI; 

                MutualSummary.Start(p1, p2, mergedProgram, p1Prefix, p2Prefix, cfg,
                    Options.checkAssertsOnly, Options.useMutualSummariesAsAxioms, 
                    houdiniOpt, 
                    Options.checkMutualPrecondNonTerminating,
                    Options.freeContracts, Options.dontTypeCheckMergedProg,
                    Options.dacEncoding,
                    Options.callCorralOnMergedProgram);
                return 0;
            }
            ///////////////////////////////////////////////////////////
            //mutual summaries mode ends
            ///////////////////////////////////////////////////////////

            //////////////////////////////////////////////////////////
            // Creation of the mod set starts
            //////////////////////////////////////////////////////////                        
            CallGraph cg, cg1, cg2;
            if (CreateModSets(p1, p2, mergedProgram, out cg1, out cg2, out cg) == 1)
                return 1;
            //////////////////////////////////////////////////////////
            // Creation of the mod set ends
            //////////////////////////////////////////////////////////  

            //////////////////////////////////////////////////////////
            // RVT Option starts
            /////////////////////////////////////////////////////////
            if (Options.RVTOption)
            { //check for the RVT option
                mergedProgram.TopLevelDeclarations = SDiff.Boogie.Process.RemoveDuplicateDeclarations(mergedProgram.TopLevelDeclarations.ToList());
                RVT.RVTCheck.RVTMain(cg1, cg2, cg, cfg, mergedProgram, cfg.GetProcedureDictionary());
                return 0;
            }
            //////////////////////////////////////////////////////////
            // RVT Option ends
            /////////////////////////////////////////////////////////

            ////////////////////////////////////////////////////////////
            // Normal SymDiff Flow: Create the mutual procedures for equalities and verify
            ////////////////////////////////////////////////////////////
            Log.Out(Log.Normal, "Adding instrumented equality functions to program and generating verification tasks");
            //assume callgraphs are isomorphic and cfg contains one such isomorphism
            StreamWriter dumpfile = dumpEq ? new StreamWriter(".\\dump_" + p1Prefix + "_" + p2Prefix + ".txt") : null;
            return CreateAndVerifyEqProcs(cg1, cg2, cg, roots_cg1, roots_cg2, cfg.GetProcedureDictionary(), mergedProgram, dumpfile, InequalProc);
            ////////////////////////////////////////////////////////////
            // Normal SymDiff Flow: Create the mutual procedures for equalities and verify
            ////////////////////////////////////////////////////////////
        }

        private static void StripContracts(Program p1, Program p2)
        {
            if (Options.StripContracts)
            {
                //TODO: asserts from inlined body are not visited in the Visitor (so they still stay in /nonmodular)
                var contractStripper = new StripContractsAndAttributes(Options.freeContracts);
                contractStripper.asserts = Options.checkAssertsOnly;
                contractStripper.VisitProgram(p1);
                contractStripper.VisitProgram(p2);
            }
        }

    }


}
        

