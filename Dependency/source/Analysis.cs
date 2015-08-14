using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Text.RegularExpressions;
using Microsoft.Boogie;
using Microsoft.Boogie.GraphUtil;
using System.Collections;
using System.Diagnostics;
using SymDiffUtils;
using Dependency.source;

namespace Dependency
{
    class Analysis
    {
        static private class CmdLineOptsNames
        {
            public const string semanticDep = "/semanticDependency";
            public const string stats = "/stats";
            public const string prune = "/prune";
            public const string both = "/both";
            public const string dataOnly = "/dataOnly";
            public const string taint = "/taint";
            public const string debug = "/break";
            public const string refine = "/refine";
            public const string readSet = "/readSet";
            public const string noMinUnsatCore = "/noMinUnsatCore";
            public const string timeout = "/timeout";
            public const string abstractNonTainted = "/abstractNonTainted"; //generate a program with non-tainted parts abstracted
            public const string splitMapsWithAliasAnalysis = "/splitMapsWithAliasAnalysis";
            public const string stripValueIs = "/stripValueIs";
            public const string annotateDependencies = "/annotateDependencies";
            public const string refinedStmtTaintAnalysis = "/refinedStmtTaintAnalysis";
            public const string dacMerged = "/dacMerged";
            public const string depTainted = "/depTainted";
            public const string dumpTaint = "/dumpTaint";
            public const string inlineDepth = "/inlineDepthDependency";
        }

        static public bool DataOnly = false;
        static public bool BothDependencies = false;
        static public bool Prune = false;
        static public bool PrintStats = false;
        static public bool Refine = false;
        public static bool SemanticDep = false;
        public static bool ReadSet = false;
        static public int StackBound = 3;
        static public bool noMinUnsatCore = false;
        static public int Timeout = 300;
        static public bool AbstractNonTainted = false;
        static public bool AnnotateDependencies = false;
        static public bool SplitMapsWithAliasAnalysis = false;
        static public bool StripValueIs = false;
        static public bool RefinedStmtTaintAnalysis = false;
        static public bool ConservativeTaint = false;
        static public string DacMerged;
        static public string DependencyTaint;
        static public bool DumpTaint = true;
        static public int InlineDepth = 0; //depth to which we inline before performing any analysis

        static private List<Tuple<string, string, int>> changeLog = new List<Tuple<string, string, int>>();
        static private List<Tuple<string, string, int>> taintLog = new List<Tuple<string, string, int>>();
        static private List<Tuple<string, string, int, string, Dependencies>> dependenciesLog = new List<Tuple<string, string, int, string, Dependencies>>();
        static private List<Tuple<string, string, int, string>> taintedModSetLog = new List<Tuple<string, string, int, string>>();
        static private List<Tuple<string, string, Procedure, Variable, VarSet>> statsLog = new List<Tuple<string, string, Procedure, Variable, VarSet>>();
        static private string statsFile;

        

        static private Program program;

        static private Stopwatch sw;
        public static DacBasedSimplification DacSimplifier;

        static int Main(string[] args)

        {
            if (args.Length < 1)
            {
                Usage();
                return -1;
            }

            sw = new Stopwatch();
            sw.Start();

            CommandLineOptions.Install(new CommandLineOptions());
            CommandLineOptions.Clo.RunningBoogieFromCommandLine = true;
            var boogieOptions = "/typeEncoding:m -timeLimit:20 -removeEmptyBlocks:0 /printModel:1 /printModelToFile:model.dmp /printInstrumented "; // /errorLimit:1";
            //IMPORTANT: need the next to avoid crash while creating prover
            CommandLineOptions.Clo.Parse(boogieOptions.Split(' '));
            //IMPORTANT: need these three to make use of UNSAT cores!!
            CommandLineOptions.Clo.UseUnsatCoreForContractInfer = true; //ROHIT
            CommandLineOptions.Clo.ContractInfer = true; //ROHIT
            CommandLineOptions.Clo.ExplainHoudini = true; 

            #region Command line parsing 
            statsFile = args[0] + ".csv";

            string changeList = null;
            args.Where(x => x.StartsWith(CmdLineOptsNames.taint + ":"))
                .Iter(s => changeList = s.Split(':')[1]);
            
            args.Where(x => x.StartsWith(CmdLineOptsNames.dacMerged + ":"))
                .Iter(s => DacMerged = s.Split(':')[1]);

            args.Where(x => x.StartsWith(CmdLineOptsNames.depTainted + ":"))
                .Iter(s => DependencyTaint = s.Split(':')[1]);

            ConservativeTaint = changeList == null;

            DumpTaint = args.Any(x => x.ToLower() == CmdLineOptsNames.dumpTaint.ToLower());
            DataOnly = args.Any(x => x.ToLower() == CmdLineOptsNames.dataOnly.ToLower());
            BothDependencies = args.Any(x => x.ToLower() == CmdLineOptsNames.both.ToLower()) && !DataOnly;

            PrintStats = args.Any(x => x.ToLower() == CmdLineOptsNames.stats.ToLower() || x.StartsWith(CmdLineOptsNames.stats + ":"));
            args.Where(x => x.StartsWith(CmdLineOptsNames.stats + ":"))
                .Iter(s => statsFile = s.Split(':')[1]);

            SemanticDep = args.Any(x => x.Contains(CmdLineOptsNames.semanticDep));

            Refine = args.Any(x => x == CmdLineOptsNames.refine || x.StartsWith(CmdLineOptsNames.refine + ":"));
            args.Where(x => x.StartsWith(CmdLineOptsNames.refine + ":"))
                .Iter(s => StackBound = int.Parse(s.Split(':')[1]));

            args.Where(x => x.StartsWith(CmdLineOptsNames.timeout + ":"))
                .Iter(s => Timeout = int.Parse(s.Split(':')[1]));

            args.Where(x => x.StartsWith(CmdLineOptsNames.inlineDepth + ":"))
                .Iter(s => InlineDepth = int.Parse(s.Split(':')[1]));


            SplitMapsWithAliasAnalysis = args.Any(x => x.StartsWith(CmdLineOptsNames.splitMapsWithAliasAnalysis));

            // refined must have pruned dependencies
            Prune = Refine || args.Any(x => x.ToLower() == CmdLineOptsNames.prune.ToLower());

            if (StackBound < 2)
                throw new Exception("Argument k to /refine:k has to be > 1");

            ReadSet = args.Any(x => x.ToLower() == CmdLineOptsNames.readSet.ToLower());

            noMinUnsatCore = args.Any(x => x.ToLower() == CmdLineOptsNames.noMinUnsatCore.ToLower());

            AbstractNonTainted = args.Any(x => x.ToLower() == CmdLineOptsNames.abstractNonTainted.ToLower());

            AnnotateDependencies = args.Any(x => x.ToLower() == CmdLineOptsNames.annotateDependencies.ToLower());            

            StripValueIs = args.Any(x => x.ToLower() == CmdLineOptsNames.stripValueIs.ToLower());

            RefinedStmtTaintAnalysis = args.Any(x => x.ToLower() == CmdLineOptsNames.refinedStmtTaintAnalysis.ToLower());

            if (args.Any(x => x.ToLower() == CmdLineOptsNames.debug.ToLower()))
                Debugger.Launch();
            #endregion 


            var filename = args[0];
            if (!Utils.ParseProgram(filename, out program))
            {
                Usage();
                return -1;
            }

            #region Cleanups

            Debug.Assert(program.Resolve() == 0 && program.Typecheck() == 0, "Initial program has errors.");
            //first thing is to prune based on callgraph, if receiving a change list
            if (changeList != null)
            {
                changeLog = PopulateChangeLog(changeList, program);
                HashSet<Procedure> changedProcs = new HashSet<Procedure>();
                foreach (var tuple  in changeLog)
                {
                    changedProcs.Add(program.FindProcedure(tuple.Item2));
                }
                //add an attribute to identify the changedProcs for later analysis
                changedProcs.Iter(p => p.AddAttribute("syntacticChangedProc", new string[] {}));
                program = new CallGraphBasedPruning(program, changedProcs).PruneProgram();
                Debug.Assert(program.Resolve() == 0 &&  program.Typecheck() == 0, "After Callgraph pruning the program has errors.");
            }
            //second thing is to remove Stubs
            program = new source.ProcessStubs(program).EliminateStubs();            

            //cleanup assume value_is, as we are not printing a trace now
            //Dont cleanup value_is without this flag, SymDiff gets confused as it expects value_is for models
            if (StripValueIs)
                (new Utils.RemoveValueIsAssumes()).Visit(program);
            // create explicit variables for conditionals
            if (changeList != null) //only do this for taint analysis
                (new Utils.AddExplicitConditionalVars()).Visit(program);
            //remove some HAVOC generated methods (should be in preprocess)
            //program.RemoveTopLevelDeclarations(x => (x is Procedure && ((Procedure)x).Name.Contains("HAVOC_memset")));
            //program.RemoveTopLevelDeclarations(x => (x is Implementation && ((Implementation)x).Name.Contains("HAVOC_memset")));
            //remove any forall axiom
            if (SplitMapsWithAliasAnalysis)
            {
                Console.WriteLine("Cleanup:Removing all background quantified axioms");
                program.RemoveTopLevelDeclarations(x => (x is Axiom && ((Axiom)x).Expr is ForallExpr));
                //rewrite map update M := M [x := y] --> M[x] := y
                (new Utils.RewriteSingletonMapUdates()).Visit(program);
            }
            #endregion 

            //inline before proceeding
            if (InlineDepth > 0)
            {
                new DependencyInliner(program, InlineDepth).InlineImplementations();
            }

            if (SplitMapsWithAliasAnalysis)
            {
                var s = new SplitHeapUsingAliasAnalysis(program, filename);
                program = s.Run(); //the program is overwritten, no more use of 
                return 0;
            }

            CallGraphHelper.WriteCallGraph(filename + ".cg", CallGraphHelper.ComputeCallGraph(program));
            Dictionary<string, HashSet<int>> sourceLines = new Dictionary<string, HashSet<int>>();
            program.Implementations.Iter(i => i.Blocks.Iter(b =>
            {
                var sourceFile = Utils.AttributeUtils.GetSourceFile(b);
                if (sourceFile != null)
                {
                    if (!sourceLines.ContainsKey(sourceFile))
                        sourceLines[sourceFile] = new HashSet<int>();
                    Utils.AttributeUtils.GetSourceLines(b).Iter(x => sourceLines[sourceFile].Add(x));
                }
            }));

            // remove redundant cmds
            //program.Implementations.Iter(i => i.Blocks.Iter(b => b.Cmds.RemoveAll(c => c is AssertCmd)));

            Analysis.DacSimplifier = new DacBasedSimplification(program, null);
            if (DacMerged != null)
            {
                Program mergedProgram;
                Utils.ParseProgram(DacMerged, out mergedProgram);
                Analysis.DacSimplifier = new DacBasedSimplification(program, mergedProgram);
                mergedProgram.Resolve();
                mergedProgram.Typecheck();
                DacSimplifier.Start();
            }


            RunAnalysis(filename, program);

            
            #region Display and Log

            DumpTaintedLinesToCsv(taintLog, string.IsNullOrEmpty(DacMerged) ? "tainted.csv" : "tainted.dac.csv");

            Utils.DisplayHtmlHelper displayHtml;
            if(DependencyTaint != null)
            {
                List<Tuple<string, string, int>> dependencyTaintedLines = Utils.StatisticsHelper.ReadCSVOutput(DependencyTaint);
                displayHtml = new Utils.DisplayHtmlHelper(changeLog, taintLog, dependenciesLog, taintedModSetLog, dependencyTaintedLines);
            }
            else
            {
                displayHtml = new Utils.DisplayHtmlHelper(changeLog, taintLog, dependenciesLog, taintedModSetLog);
            }
            displayHtml.GenerateHtmlOutput();

            if (PrintStats)
            {
                Utils.StatisticsHelper.GenerateCSVOutput(statsFile, statsLog);
                Console.WriteLine("Statistics generated in " + statsFile);
            }

            if (DumpTaint)
            {
                Utils.StatisticsHelper.GenerateCSVOutput(args[0] + ".taint", taintLog);
            }

            Dictionary<string,HashSet<int>> oldSourceLines = new Dictionary<string,HashSet<int>>(sourceLines);
            sourceLines.Clear();
            program.Implementations.Iter(i => i.Blocks.Iter(b =>
            {
                var sourceFile = Utils.AttributeUtils.GetSourceFile(b);
                if (sourceFile != null)
                {
                    if (!sourceLines.ContainsKey(sourceFile))
                        sourceLines[sourceFile] = new HashSet<int>();
                    //sourceLines[sourceFile].Add(Utils.AttributeUtils.GetSourceLine(b));
                    Utils.AttributeUtils.GetSourceLines(b).Iter(x => sourceLines[sourceFile].Add(x));
                }
            }));
            if (changeList != null)
            {
                // print number of tainted lines
                var taintedLines = taintLog.GroupBy(t => t.Item3);
                Console.WriteLine("#Orig lines, #Tainted lines, #Lines after abstractNonTainted: {0}, {1}, {2}",
                    oldSourceLines.Sum(fl => fl.Value.Count),
                    taintedLines.Count(), 
                    sourceLines.Sum(fl => fl.Value.Count));
                if (taintedLines.Count() == 0)
                    Utils.PrintError("WARNING: Result may be inaccurate as the #tainted lines is 0");
            }
            #endregion
            sw.Stop();
            return 0;
        }

        private static void DumpTaintedLinesToCsv(List<Tuple<string, string, int>> taintLog, string fn)
        {
            using (var file = new StreamWriter(fn))
            {
                // remove duplicates
                var set = new HashSet<Tuple<string, string, int>>(taintLog);
                foreach (var tup in set)
                {
                    file.WriteLine("{0}, {1}, {2}", tup.Item2, tup.Item3, tup.Item1);
                }
            }
        }

        public static List<Tuple<string,string, int>> PopulateChangeLog(string changelist, Program program)
        {
            var myChangeLog = new List<Tuple<string, string, int>>();
            if (changelist == null)
                return myChangeLog;
            StreamReader reader = File.OpenText(changelist);
            string line;
            while ((line = reader.ReadLine()) != null)
            {
                try  
                {
                    string[] items = line.Split(',');
                    string procName = items[0].Trim(), procFile = null;
                    // locate the source file for the procedure
                    var impl = program.Implementations.Single(i => i.Name == procName);
                    impl.Blocks.Find(b => b.Cmds.Count > 0 && b.Cmds[0] is AssertCmd && (procFile = Utils.AttributeUtils.GetSourceFile(b)) != null);
                    myChangeLog.Add(Tuple.Create(procFile, procName, int.Parse(items[1])));
                }
                catch (Exception)
                {
                    Utils.PrintError(string.Format("Warning: Ignoring misformed/empty line in {0}: {1}",changelist,line));
                    continue;
                }
            }
            return myChangeLog;
        }

        static public void PopulateDependencyLog(Implementation impl, Dependencies deps, string which)
        {
            if (impl == null) return; //if this is a stub
            var proc = impl.Proc;
            string sourcefile = Utils.AttributeUtils.GetImplSourceFile(impl);
            //var sourceLines = impl.Blocks.Where(b => b.Cmds.Count > 0 && b.Cmds[0] is AssertCmd).Select(b => Utils.AttributeUtils.GetSourceLine(b));
            var sourceLines = new HashSet<int>();
            impl.Blocks.Iter(b => Utils.AttributeUtils.GetSourceLines(b).Iter(l => sourceLines.Add(l)));
            if (sourceLines.Count() == 0)
                return;
            int lastSourceLine = sourceLines.Max();

            string depStr = "<b> " + which + " for " + proc.Name + "(): (Size = " + deps.Sum(d => d.Value.Count) + ")</b> ";
            dependenciesLog.Add(new Tuple<string, string, int, string, Dependencies>(sourcefile, proc.Name, lastSourceLine, depStr, deps));
            if (changeLog.Count > 0)
            {
                string taintedModSetStr = "{ ";
                deps.Iter(d => taintedModSetStr += (Utils.VariableUtils.IsTainted(d.Value) ? (Utils.DisplayHtmlHelper.TaintMarkerPre + d.Key + Utils.DisplayHtmlHelper.TaintMarkerPost) : d.Key.ToString()) + ", ");
                taintedModSetStr += " }";
                taintedModSetLog.Add(new Tuple<string, string, int, string>(sourcefile, proc.Name, lastSourceLine, taintedModSetStr));
            }

        }

        static public void PopulateTaintLog(Implementation node, IEnumerable<Block> taintedBlocks)
        {
            string sourcefile = Utils.AttributeUtils.GetImplSourceFile(node);
            foreach (var block in taintedBlocks.Where(x => node.Blocks.Contains(x)))
            {
                //int sourceline = Utils.AttributeUtils.GetSourceLine(block);
                //if (sourceline >= 0)
                //    taintLog.Add(new Tuple<string, string, int>(sourcefile, node.Proc.Name, sourceline));
                var sourceLines = Utils.AttributeUtils.GetSourceLines(block);
                if (sourceLines.Count() > 0)
                    taintLog.AddRange(sourceLines.Select(l => new Tuple<string, string, int>(sourcefile, node.Proc.Name, l)));
            }
        }

        public static void PopulateStatsLog(string type, Implementation impl, Variable key, VarSet value)
        {
            statsLog.Add(new Tuple<string, string, Procedure, Variable, VarSet>(type, Utils.AttributeUtils.GetImplSourceFile(impl), impl.Proc, key, value));
        }

        private static void RunAnalysis(string filename, Program program)
        {
            var dataDepVisitor = new DependencyVisitor(filename, program, changeLog, Timeout, Prune, true);
            var dataDeps = dataDepVisitor.ProcDependencies;
            
            if (Refine || BothDependencies || DataOnly) {
                RunDependencyAnalysis(program, dataDepVisitor, Utils.StatisticsHelper.DataOnly, DataOnly);
                if (DataOnly)
                    return;
            }

            dataDepVisitor.worklist.stateSpace.Clear(); // helping the garbage collector
            GC.Collect();

            var allDepVisitor = new DependencyVisitor(filename, program, changeLog, Timeout, Prune, DataOnly);
            var allDeps = allDepVisitor.ProcDependencies;

            if (Refine || !ReadSet)
                RunDependencyAnalysis(program, allDepVisitor, Utils.StatisticsHelper.DataAndControl, !ReadSet); // !ReadSet in the case we want to compute taint using the read set as the baseline dependency

            //// test SB deps
            //Random rnd = new Random();
            //foreach (var impl in program.Implementations)
            //{
            //    Console.WriteLine("Deps[" + impl + "] = " + allDeps[impl.Proc]);
            //    Console.WriteLine("Superblock = " + Utils.DependenciesUtils.SuperBlockDependencies(impl.Blocks, allDepVisitor.worklist.stateSpace[impl.Blocks.Last().TransferCmd], allDeps));
            //    int start = rnd.Next(0, impl.Blocks.Count);
            //    int num = rnd.Next(1, impl.Blocks.Count - start);
            //    var superBlock = impl.Blocks.GetRange(start, num);
            //    var exitBlock = superBlock.Last();
            //    if (!allDepVisitor.worklist.stateSpace.ContainsKey(exitBlock.TransferCmd))
            //    {
            //        Console.WriteLine("Block " + impl.Blocks[start + num] + " not in statspace");
            //        Debug.Assert(false);
            //    }
            //    var deps = Utils.DependenciesUtils.SuperBlockDependencies(superBlock, allDepVisitor.worklist.stateSpace[exitBlock.TransferCmd], allDeps);
            //    Console.Write("Deps for [");
            //    impl.Blocks.GetRange(start, num).Iter(b => Console.Write(b + ","));
            //    Console.Write("]:");
            //    Console.WriteLine(deps);
            //}

            allDepVisitor.worklist.stateSpace.Clear(); // helping the garbage collector
            GC.Collect();

            #region Control+Data dependencies must contain the Data dependencies
            Debug.Assert(dataDeps.All(pd => { 
                var proc = pd.Key; var ddeps = pd.Value; var adeps = allDeps[proc];
                return ddeps.Keys.All(v => {
                    if (!adeps.Keys.Contains(v)) {
                        Console.WriteLine("{2}: {0} not contained in {1}",v,adeps.ToString(),proc);
                        return false;
                    }
                    if (!adeps[v].IsSupersetOf(ddeps[v])) {
                        Console.WriteLine("{3}: {0} not superset of {1} for {2}", adeps.ToString(), ddeps.ToString(), v, proc);
                        return false;
                    }
                    return true;
                });          
            }));
            #endregion


            //output dependency in a bpl file
            if (AnnotateDependencies)
            {
                
                Utils.DependenciesUtils.PruneProcDependencies(program, allDeps); //for now we prune it                
                (new DependencyWriter(program, allDeps, allDepVisitor.procEntryTDTaint, allDepVisitor.procExitTDTaint)).Visit(program);
                var depFileName = filename + "_w_dep.bpl";
                Utils.PrintProgram(program, depFileName);
                Console.WriteLine("Adding dependencies to program to {0}", depFileName);
                return;
            }

            ProcReadSetVisitor rsVisitor = new ProcReadSetVisitor();
            if (ReadSet)
            {
                RunReadSetAnalysis(program, rsVisitor, new DependencyVisitor(filename, program, changeLog, Timeout, Prune, DataOnly));
                #region ReadSet must contain the Control+Data dependencies
                Debug.Assert(rsVisitor.ProcReadSet.All(prs =>
                {
                    var proc = prs.Key; var readSet = prs.Value;
                    if (!allDeps.ContainsKey(proc)) return true;
                    var deps = allDeps[proc];
                    return deps.Keys.All(v => {
                        if (!(readSet.Contains(v) && readSet.IsSupersetOf(deps[v])))
                        {
                            Console.WriteLine("Failed for " + v + " in proc " + proc);
                            Console.WriteLine("RS:");
                            readSet.Iter(r => Console.WriteLine(" " + r));
                            Console.WriteLine("Deps[" + v +"]:");
                            deps[v].Iter(r => Console.WriteLine(" " + r));

                            return false;
                        }
                        return true;
                    });
                }));
                #endregion
            }


            if (Refine)
                RunRefinedDepAnalysis(filename, program, dataDeps, allDeps);

            // TODO: create tainted blocks and block dependencies
            if (AbstractNonTainted)
            {
                throw new NotImplementedException("AbstractNonTainted is not tested currently");
                Utils.DependenciesUtils.PruneProcDependencies(program, allDeps); //for now we prune it
                var antc = new AbstractNonTaintProgram(program, allDeps, null, null);
                antc.AbstractNonTaintedImplementations();
                var absFilename = filename + ".taintAbstract.bpl";
                Utils.PrintProgram(program, absFilename);
                Console.WriteLine("Printing non-taint abstracted program to {0}", absFilename);
            }            

            //Refined statement taint
            if (RefinedStmtTaintAnalysis)
            {
                //TODO: pass the modified set of methods
                (new RefinedStmtTaintInstrumentation(program, new HashSet<Implementation>())).Instrument();
                var outFile = filename.Replace(".bpl", "") + "_stmtTaintInstr.bpl";
                Utils.PrintProgram(program, outFile);
                Console.WriteLine("Printing stmt taint instrumented program to {0}", outFile);
            }
        }

        private static void RunDependencyAnalysis(Program program, DependencyVisitor visitor, string kind, bool printTaint = false)
        {
            visitor.Visit(program);
            var deps = visitor.ProcDependencies;

            if (printTaint && changeLog.Count > 0)
            {
                // extract taint from dependencies and print
                var taintedBlocks = Utils.ExtractTaint(visitor);
                program.Implementations.Iter(impl => PopulateTaintLog(impl, taintedBlocks));
            }

            if (Prune)
                Utils.DependenciesUtils.PruneProcDependencies(program, deps);

            program.Implementations.Iter(impl => PopulateDependencyLog(impl, deps[impl.Proc], kind));

            //if (changeLog.Count > 0)
                // remove the special taint var
                //deps.Values.Iter(dep => dep.Values.Iter(d => { d.Remove(Utils.VariableUtils.BottomUpTaintVar); d.Remove(Utils.VariableUtils.TopDownTaintVar); }));

            if (PrintStats)
                program.Implementations.Iter(impl => deps[impl.Proc].Iter(dep => PopulateStatsLog(kind, impl, dep.Key, dep.Value)));
        }

        private static void RunRefinedDepAnalysis(string filename, Program program, Dictionary<Procedure, Dependencies> lowerBound, Dictionary<Procedure, Dependencies> upperBound)
        {
            //turn asserts/requires/ensures to free counterparts (assume/free req/free ens)
            //removing it from dependncy main path, as it screws up later analysis that just needs the dependency
            Utils.StripContracts(program);

            // remove the special taint var
            lowerBound.Values.Iter(dep => dep.Values.Iter(d => { d.Remove(Utils.VariableUtils.BottomUpTaintVar); d.Remove(Utils.VariableUtils.TopDownTaintVar); }));
            upperBound.Values.Iter(dep => dep.Values.Iter(d => { d.Remove(Utils.VariableUtils.BottomUpTaintVar); d.Remove(Utils.VariableUtils.TopDownTaintVar); }));

            var refineDepsWL = new RefineDependencyWL(filename, program, lowerBound, upperBound, StackBound);
            Utils.LogStopwatch(sw, "Initial analysis", Analysis.Timeout);
            refineDepsWL.RunFixedPoint(sw);
            Utils.LogStopwatch(sw, "After refined dependency analysis", Analysis.Timeout);
            // print
            refineDepsWL.currDependencies.Iter(pd => PopulateDependencyLog(program.Implementations.SingleOrDefault(i => i.Proc.Name == pd.Key.Name), pd.Value, Utils.StatisticsHelper.Refined));

            // stats
            refineDepsWL.currDependencies.Iter(pd =>
            {
                var impl = program.Implementations.SingleOrDefault(i => i.Proc.Name == pd.Key.Name);
                if (impl != null)
                    pd.Value.Iter(dep => PopulateStatsLog(Utils.StatisticsHelper.Refined, impl, dep.Key, dep.Value));
            });

            //taint 
            if (changeLog.Count > 0)
            {
                DependencyVisitor visitor = new DependencyVisitor(filename, program, changeLog, Timeout);
                visitor.ProcDependencies = refineDepsWL.currDependencies;
                visitor.Visit(program); // reminder: taint is essentially a dependecy analysis
                // extract taint from dependencies and print
                program.Implementations.Iter(impl => PopulateTaintLog(impl, Utils.ExtractTaint(visitor)));
            }
        }

        private static void RunReadSetAnalysis(Program program, ProcReadSetVisitor rsVisitor, DependencyVisitor depVisitor = null)
        {
            rsVisitor.Visit(program);
            // prune
            if (Prune)
                rsVisitor.ProcReadSet.Keys.Iter(p => Utils.VariableUtils.PruneLocals(program.Implementations.SingleOrDefault(i => i.Proc.Name == p.Name), rsVisitor.ProcReadSet[p]));

            // create a dependency set \foreach r \in ReadSet: r <- ReadSet
            Dictionary<Procedure,Dependencies> rsProcDeps = new Dictionary<Procedure,Dependencies>();
            rsVisitor.ProcReadSet.Keys.Iter(p => { rsProcDeps[p] = new Dependencies(); rsVisitor.ProcReadSet[p].Iter(r => rsProcDeps[p][r] = rsVisitor.ProcReadSet[p]); });

            // print
            program.Implementations.Iter(impl => PopulateDependencyLog(impl, rsProcDeps[impl.Proc], Utils.StatisticsHelper.ReadSet));

            // taint
            if (changeLog.Count > 0)
            {
                depVisitor.ProcDependencies = rsProcDeps;
                depVisitor.Visit(program); // reminder: taint is essentially a dependecy analysis
                // extract taint from dependencies and print
                program.Implementations.Iter(impl => PopulateTaintLog(impl, Utils.ExtractTaint(depVisitor)));
                // remove the special taint var
                rsProcDeps.Values.Iter(dep => dep.Values.Iter(d => { d.Remove(Utils.VariableUtils.BottomUpTaintVar); d.Remove(Utils.VariableUtils.TopDownTaintVar); }));
            }

            // stats
            if (PrintStats)
                rsVisitor.ProcReadSet.Iter(prs =>
                {
                    var proc = prs.Key; var readSet = prs.Value;
                    var impl = program.Implementations.SingleOrDefault(i => i.Proc.Name == proc.Name);
                    if (impl != null) // conservatively each output\global is dependent on all of the readset
                        readSet.Where(v => v is GlobalVariable || proc.OutParams.Contains(v)).Iter(v => PopulateStatsLog(Utils.StatisticsHelper.ReadSet, impl, v, readSet));
                });

        }



        private static void Usage()
        {
            int length = 25;
            string execName = System.Diagnostics.Process.GetCurrentProcess().MainModule.ModuleName;
            Console.WriteLine("Lightweight inter-procedural dependency\\taint analysis for change impact");
            Console.WriteLine("Usage: " + execName + " <filename.bpl> [flags]");
            Console.WriteLine((CmdLineOptsNames.taint + ":changelist.txt").PadRight(length,' ') + " - produce taint for all lines marked as changed in changelist.txt (hides dependencies in html)");
            Console.WriteLine(CmdLineOptsNames.dataOnly.PadRight(length,' ') + " - compute data dependnecies\\taint only (no control)");
            Console.WriteLine(CmdLineOptsNames.both.PadRight(length,' ') + " - compute both data & control dependencies for showing in HTML");
            Console.WriteLine(CmdLineOptsNames.prune.PadRight(length,' ') + " - show only in\\out\\global dependencies (no locals)");
            Console.WriteLine((CmdLineOptsNames.stats + "[:statsfile.csv]").PadRight(length,' ') +  " - print dependecies statistics in CSV format [to a specified file]");
            Console.WriteLine(CmdLineOptsNames.readSet.PadRight(length, ' ') + " - compute a naive read set (for comparison purposes)");
            Console.WriteLine((CmdLineOptsNames.refine + "[:<int>]").PadRight(length, ' ') + " - refine dependencies [with inlining up to stack bound]");
        }


    }
}
