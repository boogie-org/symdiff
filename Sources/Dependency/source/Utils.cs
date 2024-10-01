﻿﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Boogie;
using Microsoft.Boogie.GraphUtil;
using System.IO;
using System.Diagnostics;
using System.Threading;
using Microsoft.Boogie.VCExprAST;
using VC;
using Microsoft.BaseTypes;
using BType = Microsoft.Boogie.Type;
using Dependency;
using SymDiffUtils;

namespace Dependency
{
    class Utils
    {
        public static void PrintError(string fname)
        {
            Console.WriteLine(fname);
            Console.Error.WriteLine(fname);
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
            errCount = prog.Resolve(BoogieUtils.BoogieOptions);
            if (errCount > 0)
            {
                Console.WriteLine("WARNING: {0} name resolution errors in {1}", errCount, fname);
                return false;
            }
            ModSetCollector c = new ModSetCollector(BoogieUtils.BoogieOptions);
            c.DoModSetAnalysis(prog);
            errCount = prog.Typecheck(BoogieUtils.BoogieOptions);
            if (errCount > 0)
            {
                Console.WriteLine("WARNING: {0} type checking errors in {1}", errCount, fname);
                return false;
            }
            return true;
        }

        public static void LogStopwatch(Stopwatch sw, string s, int timeout)
        {
            var t = sw.ElapsedMilliseconds/1000;
            Console.WriteLine("[STATS]: Time after {0} is {1} secs", s, t);
            if (t > timeout)
                throw new Exception(string.Format("Timeout exceeded after {0} seconds", t));
        }

        public static void ExecuteBinary(string binaryName, string arguments)
        {
            try
            {
                ProcessStartInfo procInfo = new ProcessStartInfo();
                procInfo.UseShellExecute = false;
                procInfo.FileName = binaryName;
                procInfo.Arguments = arguments;
                procInfo.WindowStyle = ProcessWindowStyle.Hidden;
                procInfo.RedirectStandardOutput = true;
                Process proc = new Process();
                proc.StartInfo = procInfo;
                proc.EnableRaisingEvents = false;
                proc.Start();
                string output = "";
                output = proc.StandardOutput.ReadToEnd();
                proc.WaitForExit();
                Console.WriteLine("\tEND Executing {0} {1}", binaryName, arguments);
            }
            catch (Exception e)
            {
                Console.WriteLine("\tEND Executing {0} {1} with Exceptin {2}", binaryName, arguments, e.Message);
            }
        }

        public static void StripContracts(Program prog)
        {
            //make any asserts/requires/ensures free on the entire program (as procedures get inlined)
            prog.TopLevelDeclarations.OfType<Procedure>().ForEach
                (proc =>
                {
                    proc.Requires = proc.Requires.Select(x => new Requires(true, x.Condition)).ToList();
                    proc.Ensures = proc.Ensures.Select(x => new Ensures(true, x.Condition)).ToList();
                });
            (new Utils.RemoveAsserts()).Visit(prog);
        }

        public static void PrintProgram(Program prog, string filename)
        {
            var tuo = new TokenTextWriter(filename, true, BoogieUtils.BoogieOptions);
            prog.Emit(tuo);
            tuo.Close();
        }

        public static class DeclUtils
        {
            static int retCnt = 0;
            public static Function MkOrGetFunc(Program prog, string name, BType retType, List<BType> inTypes)
            {
                var fns = prog.TopLevelDeclarations.OfType<Function>().Where(x => x.Name == name);
                if (fns.Count() != 0)
                    return fns.FirstOrDefault();
                Function func = new Function(
                    Token.NoToken,
                    name,
                    inTypes.Select(t => (Variable)Utils.DeclUtils.MkFormal(t)).ToList(),
                    Utils.DeclUtils.MkFormal(retType));
                prog.AddTopLevelDeclaration(func);
                return func;
            }
            public static NAryExpr MkFuncApp(Function f, List<Expr> args)
            {
                return new NAryExpr(new Token(), new FunctionCall(f), args);
            }
            public static Formal MkFormal(BType t)
            {
                return new Formal(Token.NoToken, new TypedIdent(Token.NoToken, "ret" + retCnt++, t), false);
            }
            public static Variable MkGlobalVariable(Program prog, string name, BType type)
            {
                var g = new GlobalVariable(Token.NoToken, new TypedIdent(Token.NoToken, name, type));
                prog.AddTopLevelDeclaration(g);
                return g;
            }
            public static Variable MkLocalVariable(Program prog, Implementation impl, string name, BType btype)
            {
                var l = new LocalVariable(Token.NoToken, new TypedIdent(Token.NoToken, name, btype));
                impl.LocVars.Add(l);
                return l;
            }

        }

        public static class AttributeUtils
        {
            public const int WholeProcChangeAttributeVal = -1;
            public static List<object> GetAttributeVals(QKeyValue attributes, string key)
            {
                for (QKeyValue attr = attributes; attr != null; attr = attr.Next)
                    if (attr.Key == key)
                        return (List<object>) attr.Params;

                return new List<object>();
            }

            static public string GetSourceFile(Block block)
            {
                if (block.cmds == null)
                {
                    return null;
                }
                string file = null;
                foreach (var cmd in block.cmds)
                {

                    if (cmd is AssertCmd)
                    {
                        var assert = cmd as AssertCmd;
                        if (assert == null)
                        {
                            continue;
                        }
                        // TODO: magic strings
                        file = QKeyValue.FindStringAttribute(assert.Attributes, "sourceFile");
                        file = file == null ? QKeyValue.FindStringAttribute(assert.Attributes, "sourcefile") : file;
                        if (file != null)
                        {
                            break;
                        }
                    }
                }
                
                if (file == "unknown") return null;
                return file;
            }

            //static public int GetSourceLine(Block block)
            //{
            //    AssertCmd cmd = (block.Cmds != null && block.Cmds.Count > 0) ? block.Cmds[0] as AssertCmd : null;
            //    if (cmd == null) return -1;
            //    // TODO: magic strings
            //    var line = QKeyValue.FindIntAttribute(cmd.Attributes, "sourceLine", -1);
            //    if (line == -1) line = QKeyValue.FindIntAttribute(cmd.Attributes, "sourceline", -1);
            //    return line;
            //}

            /// <summary>
            /// Returns the list of sourcelines in a block
            /// </summary>
            /// <param name="block"></param>
            /// <returns></returns>
            static public HashSet<int> GetSourceLines(Block block)
            {
                var lines = new HashSet<int>();
                if (block.cmds == null)
                {
                    return lines;
                }
                foreach(AssertCmd cmd in block.Cmds.Where(x => x is AssertCmd))
                {
                    var line = QKeyValue.FindIntAttribute(cmd.Attributes, "sourceLine", -1);
                    if (line == -1) line = QKeyValue.FindIntAttribute(cmd.Attributes, "sourceline", -1);
                    if (line != -1) lines.Add(line);
                }
                return lines;
            }


            // returns the source line adhering to the end of the implementaition
            static public string GetImplSourceFile(Implementation node)
            {
                string sourcefile = null;
                foreach (var b in node.Blocks)
                {
                    sourcefile = GetSourceFile(b);
                    if (sourcefile != null) // TODO: magic string
                        break;
                }
                return sourcefile;
            }
        }

        public static class DependenciesUtils
        {

            public static void AddCalleeDependencySpecs(Program prog, Procedure p, Dependencies dep)
            {
                //return;
                foreach (Variable o in dep.Keys)
                {
                    if (o is LocalVariable) continue; //the dependency contains locals
                    if (p.InParams.Contains(o)) continue; //sometimes in params also show up
                    //var oDeps = dep[o].Select(x => (Variable) new Formal(Token.NoToken, x.TypedIdent, false)).ToList();
                    if (dep[o].Where(x => x.Name == Utils.VariableUtils.NonDetVar.Name).Count() != 0) continue;
                    var fnName = "AbstractNonTaint__" + p.Name + "_" + o.Name;
                    Function oFunc = Utils.DeclUtils.MkOrGetFunc(prog, fnName, o.TypedIdent.Type, dep[o].Select(x => x.TypedIdent.Type).ToList());
                    var fExpr = Utils.DeclUtils.MkFuncApp(oFunc, dep[o].Select(x => (Expr)Expr.Ident(x)).ToList());
                    var ens = Expr.Eq(Expr.Ident(o),
                        new OldExpr(Token.NoToken, fExpr));
                    p.Ensures.Add(new Ensures(true, ens));
                }
            }

            public static Dictionary<Procedure, Dependencies> BaseDependencies(Program program)
            {
                Dictionary<Procedure, Dependencies> result = new Dictionary<Procedure, Dependencies>();
                foreach (var proc in program.TopLevelDeclarations.OfType<Procedure>())
                {
                    result[proc] = new Dependencies();
                    proc.Modifies.ForEach(m => result[proc][m.Decl] = new VarSet());
                }
                return result;
            }

            public static void JoinProcDependencies(Dictionary<Procedure, Dependencies> lhs, Dictionary<Procedure, Dependencies> rhs)
            {
                lhs.Keys.ForEach(p => { if (rhs.ContainsKey(p)) lhs[p].JoinWith(rhs[p]); });
                rhs.Keys.ForEach(p => { if (!lhs.ContainsKey(p)) lhs[p] = rhs[p]; });
            }

            public static void PruneProcDependencies(Program program, Dictionary<Procedure, Dependencies> procDependencies)
            {
                procDependencies.ForEach(pd => { var impl = program.Implementations.SingleOrDefault(i => i.Proc == pd.Key); if (impl != null) pd.Value.Prune(impl); });
            }


            //public static Dependencies SuperBlockDependencies(AbstractedTaint.SuperBlock superBlock, Dependencies exitBlockDeps, Dictionary<Procedure, Dependencies> procDependencies)
            //{
            //    var result = new Dependencies();
            //    var rsVisitor = new SimpleReadSetVisitor(procDependencies);
            //    var msVisitor = new SimpleModSetVisitor(procDependencies);

            //    // extract read & mod set from blocks
            //    rsVisitor.Visit(superBlock.StartBlock); msVisitor.Visit(superBlock.StartBlock);
            //    superBlock.AllBlocks.ForEach(b => { rsVisitor.Visit(b); msVisitor.Visit(b); });

            //    //Console.WriteLine("exitBlockDeps = " + exitBlockDeps);
            //    //Console.WriteLine("readSet = ");
            //    //rsVisitor.ReadSet.Print();
            //    //Console.WriteLine("modSet = ");
            //    //msVisitor.ModSet.Print();

            //    // create the superblock dependencies using the exit block
            //    exitBlockDeps.Where(d => msVisitor.ModSet.Contains(d.Key))
            //                 .ForEach(d => result[d.Key] = new HashSet<Variable>(d.Value.Intersect(rsVisitor.ReadSet)));

            //    return result;
            //}
        }


        public static HashSet<Block> ComputeChangedBlocks(Program program, List<Tuple<string, string, int>> changeLog)
        {
            var result = new HashSet<Block>();
            foreach (var changesPerFile in changeLog.GroupBy(t => t.Item1))
            {
                foreach (var changesPerProc in changesPerFile.GroupBy(t => t.Item2))
                {
                    // Maybe in the future add an attribute to extracted procedures containing the name of the original procedure
                    foreach (var impl in program.Implementations
                        .Where(i => i.Proc.Name.Equals(changesPerProc.Key) || 
                            i.Proc.Name.StartsWith(changesPerProc.Key + "_loop_"))) // dealing with loops which are procs with name <orig_proc>_loop_head etc.
                    {
                        // If we are doing coarse diff, then we are only relying that the diff can find the exact changed procedure
                        if (Analysis.CoarseDiff)
                        {
                            // For coarse diff we're adding all basic blocks from the syntactically changed procedures.
                            impl.Blocks.ForEach(bb => result.Add(bb));
                        }
                        else
                        {
                            if (changesPerProc.FirstOrDefault(t => t.Item3 == Utils.AttributeUtils.WholeProcChangeAttributeVal) == null)
                            {
                                foreach (var procChange in changesPerProc)
                                {
                                    // add in the block pertaining to the changed line
                                    //impl.Blocks.Where(b => Utils.AttributeUtils.GetSourceLine(b) == procChange.Item3)
                                    //                    .ForEach(b => result.Add(b));
                                    impl.Blocks
                                        .Where(b => Utils.AttributeUtils.GetSourceLines(b).Contains(procChange.Item3))
                                        .ForEach(b => result.Add(b));
                                }
                            }
                        }
                    }
                }
            }
            if (!Analysis.CoarseDiff)
            {
                CheckResult(result, changeLog);
            }
            return result;
        }

        private static void CheckResult(HashSet<Block> result, List<Tuple<string, string, int>> changeLog)
        {
            bool unableToMap = false;
            foreach (var item in changeLog)
            {
                if (!result.Any(b => Utils.AttributeUtils.GetSourceFile(b).Equals(item.Item1) && Utils.AttributeUtils.GetSourceLines(b).Contains(item.Item3)))
                {
                    Console.WriteLine("[Error:] Could not map changed line {0} in file {1} in procedure {2} to basic block", item.Item3, item.Item1, item.Item2);
                    unableToMap = true;
                }
            }
            if (unableToMap)
            {
                //Environment.Exit(-13);
            }
        }

        public static HashSet<Procedure> ComputeChangedProcs(Program program, List<Tuple<string, string, int>> changeLog)
        {
            var result = new HashSet<Procedure>();
            foreach (var changesPerFile in changeLog.GroupBy(t => t.Item1))
            {
                foreach (var changesPerProc in changesPerFile.GroupBy(t => t.Item2))
                {
                    var impl = program.Implementations.FirstOrDefault(i => i.Proc.Name == changesPerProc.Key);
                    if (changesPerProc.FirstOrDefault(t => t.Item3 == Utils.AttributeUtils.WholeProcChangeAttributeVal) != null)
                        result.Add(impl.Proc); // whole procedure changed
                }
            }
            return result;
        }

        public static Dictionary<Absy, Implementation> ComputeNodeToImpl(Program program)
        {
            Dictionary<Absy, Implementation> result = new Dictionary<Absy, Implementation>();
            program.Implementations.ForEach(impl => impl.Blocks.ForEach(b => { b.Cmds.ForEach(c => result[c] = impl); result[b.TransferCmd] = impl; }));
            return result;
        }

        public static void ComputeDominators(Program program, Implementation impl, Dictionary<Block, HashSet<Block>> dominatedBy)
        {
            // reverse the control dependence mapping (easier for the algorithm)
            foreach (var cd in program.ProcessLoops(BoogieUtils.BoogieOptions, impl).ControlDependence())
            {
                foreach (var controlled in cd.Value)
                {
                    if (!dominatedBy.ContainsKey(controlled))
                        dominatedBy[controlled] = new HashSet<Block>();
                    dominatedBy[controlled].Add(cd.Key);
                }
            }
            // TODO: there's no need for this since the dependencies of the immediate dominator should contain all predecessors
            //       but somehow including this makes the analysis faster (?!)
            bool done;
            do
            {
                done = true;
                var newDominatedBy = new Dictionary<Block, HashSet<Block>>();
                foreach (var dom in dominatedBy)
                {
                    var dominators = dom.Value;
                    var newDominators = new HashSet<Block>();
                    newDominators.UnionWith(dominators);
                    foreach (var block in dominators)
                    {   // each block is also dominated by the the dominators of its dominators   
                        if (dominatedBy.Keys.Contains(block))
                            newDominators.UnionWith(dominatedBy[block]);
                    }
                    newDominatedBy[dom.Key] = newDominators;
                    if (newDominators.Count > dominators.Count)
                        done = false;
                }
                if (!done)
                    newDominatedBy.ForEach(dom => dominatedBy[dom.Key].UnionWith(dom.Value));
            } while (!done);
            //*/

        }

        public static HashSet<Block> ExtractTaint(DependencyVisitor visitor)
        {
            var worklist = visitor.worklist;
            var result = new HashSet<Block>();
            foreach (var stmt in worklist.stateSpace.Keys)
	        {
                var block = visitor.worklist.cmdBlocks[stmt];
                var deps = worklist.stateSpace[stmt];
                if (visitor.branchCondVars.ContainsKey(block) &&
                    visitor.branchCondVars[block].Any(v => deps.ContainsKey(v) && VariableUtils.IsTainted(deps[v])))
                        result.Add(block);
                else if (VariableUtils.ExtractVars(stmt).Any(v => deps.ContainsKey(v) && VariableUtils.IsTainted(deps[v])))
                    result.Add(block);
	        }
            return result;
        }


        public static class VariableUtils
        {
            public static GlobalVariable NonDetVar = new GlobalVariable(Token.NoToken, new TypedIdent(Token.NoToken, "*", Microsoft.Boogie.Type.Int));
            public static GlobalVariable BottomUpTaintVar = new GlobalVariable(Token.NoToken, new TypedIdent(Token.NoToken, "^", Microsoft.Boogie.Type.Int));
            public static GlobalVariable TopDownTaintVar = new GlobalVariable(Token.NoToken, new TypedIdent(Token.NoToken, "~", Microsoft.Boogie.Type.Int));

            private class VariableExtractor : StandardVisitor
            {
                public VarSet Vars = new VarSet();
                public override Variable VisitVariable(Variable node)
                {
                    Vars.Add(node);
                    return node;
                }
            }
            private static VariableExtractor varExtractor = new VariableExtractor();
            
            public static HashSet<Variable> ExtractVars(Absy node)
            {
                varExtractor.Vars = new VarSet();
                varExtractor.Visit(node);
                return varExtractor.Vars;
            }

            public static void PruneLocals(Implementation impl, VarSet vars)
            {
                if (impl == null) 
                    return;
                vars.RemoveWhere(v => !(v is GlobalVariable || impl.InParams.Contains(v) || impl.OutParams.Contains(v))
                || impl.Proc.InParams.Contains(v) || impl.Proc.OutParams.Contains(v));
            }

            // add in the Procedure's inputs\outputs that adhere to the Implementation inputs\outputs in vars
            public static void FixFormals(Implementation impl, VarSet vars)
            {
                if (impl == null)
                {// stubs
                    Debug.Assert(false, string.Format("Stubs not expected...did you run dependency.exe?"));
                    return;
                }
                var formals = new VarSet();
                // inputs
                formals.UnionWith(Utils.VariableUtils.ImplInputsToProcInputs(impl, vars));
                // outputs
                vars.ForEach(v => { if (impl.OutParams.Contains(v)) formals.Add(ImplOutputToProcOutput(impl, v)); });
                vars.UnionWith(formals);
            }

            public static VarSet ImplInputsToProcInputs(Implementation impl, VarSet vars)
            {
                var result = new VarSet();
                foreach (var v in vars)
                {
                    if (impl.InParams.Contains(v))
                    {// replace Implemetation inputs with Procedure inputs
                        result.Add(impl.Proc.InParams[impl.InParams.IndexOf(v)]);
                    }
                    else if (v is GlobalVariable || impl.Proc.InParams.Contains(v))
                    {
                        result.Add(v);
                    }
                }
                return result;
            }
            public static Variable ImplOutputToProcOutput(Implementation node, Variable v)
            {
                var index = node.OutParams.IndexOf(v);
                if (index >= 0) // replace Implemetation outputs with Procedure outputs
                    return node.Proc.OutParams[index];
                else
                    return v; // leave non-outputs as is
            }


            public static bool IsTainted(VarSet vars)
            {
                return vars.Contains(BottomUpTaintVar) || vars.Contains(TopDownTaintVar);
            }
        }

        public static class StatisticsHelper
        {
            public const string ReadSet = "Read Set";
            public const string DataAndControl = "Data And Control";
            public const string Refined = "Refined";
            public const string DataOnly = "Data Only";
            public static void GenerateCSVOutput(string outFileName, List<Tuple<string, string, Procedure, Variable, VarSet>> statsLog)
            {
                TextWriter output = new StreamWriter(outFileName);
                output.WriteLine("Note: Only variables that do not have * on all kinds of analyses are aggregated");
                output.WriteLine("Filename, Procedure, {0}, {1}, {2}, {3}", ReadSet, DataAndControl, Refined, DataOnly);

                var statsPerFile = statsLog.GroupBy(t => t.Item2);
                foreach (var ft in statsPerFile)
                {
                    var statsPerProc = ft.GroupBy(t => t.Item3);
                    foreach (var pt in statsPerProc)
                    {
                        Dictionary<string, int> vals = new Dictionary<string, int>();
                        vals[ReadSet] = vals[DataAndControl] = vals[Refined] = vals[DataOnly] = 0;
                        var statsPerVar = pt.GroupBy(t => t.Item4);
                        foreach (var statsOfVar in statsPerVar)
                        {
                            var statsOfRefined = statsOfVar.Where(t => t.Item1 == Refined);
                            Debug.Assert(statsOfRefined.Count() <= 1);
                            // if the refined dataset is non deterministic or no refined run exists:
                            if ((statsOfRefined.Count() == 0) ||
                                (statsOfRefined.Count() > 0 && statsOfRefined.All(t => !t.Item5.Contains(Utils.VariableUtils.NonDetVar))))
                                statsOfVar.ForEach(t => vals[t.Item1] += t.Item5.Count);
                        }
                        output.WriteLine("{0},{1},{2},{3},{4},{5}", ft.Key, pt.Key, vals[ReadSet], vals[DataAndControl], vals[Refined], vals[DataOnly]);
                    }
                }
                
                output.Close();
            }

            public static void GenerateCSVOutput(string outFileName, List<Tuple<string, Procedure, Dependencies>> procDependencies)
            {
                TextWriter output = new StreamWriter(outFileName);
                output.WriteLine("Filename, Procedure, Overall, Num Globals, Sum Globals, Inputs(Globals), Num Outputs, Sum Outputs, Inputs(Outputs)");
                // for each tuple, grouped by filename
                foreach (var depsInFile in procDependencies.GroupBy(x => x.Item1))
                {
                    foreach (var pd in depsInFile)
                    {
                        var overall = pd.Item3.Sum(x => x.Value.Count); // overall size of dependencies (\Sigma_{v} Deps(v))
                        var numGlobals = pd.Item3.Where(x => x.Key is GlobalVariable).Count();
                        var sumGlobals = pd.Item3.Where(x => x.Key is GlobalVariable).Sum(x => x.Value.Count); // size of global vars dependencies
                        HashSet<Variable> inputsGlobals = new VarSet();
                        foreach (var depSet in pd.Item3.Where(x => x.Key is GlobalVariable))
                            foreach (var v in depSet.Value)
                                if (pd.Item2.InParams.Contains(v))
                                    inputsGlobals.Add(v);
                        var numOutputs = pd.Item3.Where(x => pd.Item2.OutParams.Contains(x.Key)).Count();
                        var sumOutputs = pd.Item3.Where(x => pd.Item2.OutParams.Contains(x.Key)).Sum(x => x.Value.Count); // size out outputs dependencies
                        HashSet<Variable> inputsOutputs = new VarSet();
                        foreach (var depSet in pd.Item3.Where(x => pd.Item2.OutParams.Contains(x.Key)))
                            foreach (var v in depSet.Value)
                                if (pd.Item2.InParams.Contains(v))
                                    inputsOutputs.Add(v);
                        output.WriteLine("{0},{1},{2},{3},{4},{5},{6},{7},{8}", pd.Item1, pd.Item2, overall, numGlobals, sumGlobals, inputsGlobals.Count, numOutputs, sumOutputs, inputsOutputs.Count);
                    }
                }
                output.Close();
            }

            public static void GenerateCSVOutputForSemDep(List<Tuple<string, string, int, int, int>> sd, string outFileName)
            {
                TextWriter output = new StreamWriter(outFileName);
                output.WriteLine("Filename, Procedure, Data + Control, Data Only, Refined");
                foreach (var fileDeps in sd.GroupBy(x => x.Item1))
                    foreach (var procDeps in fileDeps)
                        output.WriteLine("{0},{1},{2},{3},{4}", procDeps.Item1, procDeps.Item2, procDeps.Item3, procDeps.Item4, procDeps.Item5);
                output.Close();
            }

            internal static void GenerateCSVOutput(string outFileName, List<Tuple<string, string, int>> taintLog)
            {
                TextWriter output = new StreamWriter(outFileName);
                foreach (var taint in taintLog)
                {
                    output.WriteLine(taint.Item1 + "," + taint.Item2 + "," + taint.Item3);
                }
                output.Close();
            }
            internal static List<Tuple<string, string, int>> ReadCSVOutput(string outFileName)
            {
                List<Tuple<string, string, int>> taintLog = new List<Tuple<string, string, int>>();
                TextReader input = new StreamReader(outFileName);
                string line;
                while ((line = input.ReadLine()) != null)
                {

                    var items = line.Split(',');
                    taintLog.Add(new Tuple<string, string, int>(items[0], items[1], int.Parse(items[2])));
                }
                input.Close();
                return taintLog;
            }
        }

        public class DisplayHtmlHelper
        {
            public static string TaintMarkerPre = "<taint>";
            public static string TaintMarkerPost = "</taint>";

            HashSet<string> srcFiles;
            List<Tuple<string, string, int>> changedLines;  //{(file, func, line),..}
            List<Tuple<string, string, int>> taintedLines; //{(file, func, line), ..}
            List<Tuple<string, string, int>> dependencyTaintedLines; //{(file, func, line), ..}
            List<Tuple<string, string, int, string, Dependencies>> dependenciesLines; //{(file, func, line, title, {v1 <- {...},... vn <- {...}})}
            List<Tuple<string, string, int, string>> taintedModSetLines; //{(file, func, line, {v1, ..., vn})}

            public DisplayHtmlHelper(List<Tuple<string, string, int>> changedLines, List<Tuple<string, string, int>> taintedLines, List<Tuple<string, string, int, string, Dependencies>> dependenciesLines, List<Tuple<string, string, int, string>> taintedModSetLines, List<Tuple<string, string, int>> dependencyTaintedLines)
            {
                this.dependencyTaintedLines = dependencyTaintedLines;
                this.changedLines = changedLines;
                this.taintedLines = taintedLines;
                this.dependenciesLines = dependenciesLines;
                this.taintedModSetLines = taintedModSetLines;
                this.srcFiles = new HashSet<string>();
                this.srcFiles.UnionWith(changedLines.Select(t => t.Item1));
                this.srcFiles.UnionWith(taintedLines.Select(t => t.Item1));
                this.srcFiles.UnionWith(dependenciesLines.Select(t => t.Item1));
            }

            public DisplayHtmlHelper(List<Tuple<string, string, int>> changedLines, List<Tuple<string, string, int>> taintedLines, List<Tuple<string, string, int, string, Dependencies>> dependenciesLines, List<Tuple<string, string, int, string>> taintedModSetLines)
                :this(changedLines, taintedLines, dependenciesLines, taintedModSetLines, new List<Tuple<string, string, int>>())
            {                
            }

            public void GenerateHtmlOutput()
            {
                Func<string, string, string> MkLink = delegate(string s, string t)
                {
                    return @"<a href=" + t + @">" + s + @"</a>";
                };

                //for each file f in the dependency set
                //  for each sourceline l in f
                //     if changed(l) then change-marker l
                //     elseif tainted(l) then tainted-marker l
                //     elseif l is last line then l proc-deps 
                foreach (var srcFile in srcFiles)
                {
                    StreamReader sr = null;
                    try
                    {
                        if (!File.Exists(srcFile)) // try the linux version
                            sr = new StreamReader(srcFile.Replace('\\', '/'));
                        else
                            sr = new StreamReader(srcFile);
                    }
                    catch (Exception)
                    {
                        Console.WriteLine("Could not generate HTML for file " + (srcFile == null ? "null" : srcFile) + ". (file not found)");
                        continue;
                    }
                    
                    string outFileName = srcFile + (Analysis.DacMerged!=null?".DAC":"") + ".html";

                    Console.WriteLine("Generating " + outFileName);

                    TextWriter output = new StreamWriter(outFileName);
                    output.WriteLine("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 3.2//EN\">");
                    output.WriteLine("<html>");
                    output.WriteLine("<head>");
                    output.WriteLine("<title>Tainted outputs</title>");
                    output.WriteLine("<style type=\"text/css\"> "
                        + "div.code {font-family:monospace; font-size:100%;} </style>");
                    output.WriteLine("<style type=\"text/css\"> "
                        + "span.trace { background:yellow; color:red; font-weight:bold;} </style>");
                    output.WriteLine("<style type=\"text/css\"> "
                        + "span.values { background:lightgray; color:black; font-weight:bold;} </style>");
                    output.WriteLine("<style type=\"text/css\"> "
                        + "span.report { background:lightgreen; color:black; font-weight:bold;} </style>");
                    output.WriteLine("<style type=\"text/css\"> "
                        + "span.reportstmt { background:lightgreen; color:red; font-weight:bold;} </style>");
                    output.WriteLine("</head>");
                    output.WriteLine("<body>");
                    output.WriteLine("");
                    output.WriteLine("<h1> Statements that are tainted given the taint source </h1> ");

                    // get all line from the file and close it
                    string ln;
                    List<string> srcLines = new List<string>();
                    while ((ln = sr.ReadLine()) != null)
                        srcLines.Add(ln);
                    sr.Close();

                    for (int lineNum = 1; lineNum <= srcLines.Count; ++lineNum)
                    {
                        string line = srcLines[lineNum - 1].ToString().Replace(" ", "&nbsp;").Replace("\t", "&nbsp;&nbsp;&nbsp;");
                        if (changedLines.Exists(l => l.Item1 == srcFile && l.Item3 == lineNum)) // changed
                        {
                            //line = string.Format("<b> <i> {0}  </i> </b>", line);
                            line = string.Format("<b> <font color=\"red\"> {0} </font> </b>", line);
                        }
                        else if (taintedLines.Exists(l => l.Item1 == srcFile && l.Item3 == lineNum)) // tainted
                        {
                            //line = string.Format("<b> <u> {0} </u> </b>", line);
                            line = string.Format("<b> <font color=\"blue\"> {0} </font> </b>", line);
                        }
                        else if (dependencyTaintedLines.Exists(l => l.Item1.Equals(srcFile) && l.Item3 == lineNum)) // tainted from previous
                        {
                            //line = string.Format("<b> <u> {0} </u> </b>", line);
                            line = string.Format("<b> <font color=\"green\"> {0} </font> </b>", line);
                        }
                        
                        /*else */if (taintedModSetLines.Exists(l => l.Item1 == srcFile && l.Item3 == lineNum))
                        {
                            string taintedModset = null;
                            taintedModSetLines.Where(l => l.Item1 == srcFile && l.Item3 == lineNum).ForEach(t => taintedModset = string.Format("</br> <b> Outputs: </b> {0} ", t.Item4.Replace(TaintMarkerPre,"<b> <font color=\"blue\">").Replace(TaintMarkerPost,"</font> </b>")));
                            line += taintedModset;
                        }
                        else if (dependenciesLines.Exists(l => l.Item1 == srcFile && l.Item3 == lineNum)) 
                        {// dependencies: can be obtained when not using /taint:change.txt
                            string deps = null;
                            dependenciesLines.Where(l => l.Item1 == srcFile && l.Item3 == lineNum).ForEach(dep => deps = string.Format("<pre> {0} {1} </pre>", dep.Item4, dep.Item5.ToString()));
                            line += deps;
                        }
                        line = ("[" + lineNum + "]").PadRight(6).ToString().Replace(" ", "&nbsp;") + "   " + line + "<br>\n";
                        output.Write(line);
                        output.Flush();
                    }

                    output.WriteLine("</body>");
                    output.WriteLine("</html>");
                    output.Close();
                }

            }

        }

        public class AddExplicitConditionalVars : StandardVisitor
        {
            private Block currBlock = null;
            private Implementation currImpl = null;
            public override Block VisitBlock(Block node)
            {
                currBlock = node; base.VisitBlock(node); currBlock = null;
                return node;
            }

            public override Implementation VisitImplementation(Implementation node)
            {
                currImpl = node; base.VisitImplementation(node); currImpl = null;
                return node;
            }
            public override GotoCmd VisitGotoCmd(GotoCmd node)
            {
                // replace {goto A,B,C;} {A: assume (e1); ... } {B: assume (e2); ... } {C: assume (e3); ... }
                // with {c1 = e1; c2 = e2; c3 = e3; goto A,B,C;} {A: assume (c1); ... } {B: assume(c2); ... } {B: assume(c3); ... }
                var succs = node.labelTargets;
                if (succs.Count > 1)
                {
                    foreach (var succ in succs.Where(s => s.Cmds.Count > 0))
                    {
                        var cmd = succ.Cmds[0] as AssumeCmd;
                        if (cmd != null)
                        {
                            // create a fresh variable
                            var v = new LocalVariable(Token.NoToken, new TypedIdent(Token.NoToken, succ.Label + "_Cond", Microsoft.Boogie.Type.Bool));
                            //Debug.Assert(!currImpl.LocVars.Select(x => x.Name).Contains(v.Name));
                            currImpl.LocVars.Add(v);
                            var id = new IdentifierExpr(Token.NoToken, v);
                            // create and add the assignment
                            var lhs = new List<AssignLhs>();
                            lhs.Add(new SimpleAssignLhs(Token.NoToken, id));
                            var rhs = new List<Expr>();
                            rhs.Add(cmd.Expr);
                            currBlock.Cmds.Add(new AssignCmd(Token.NoToken, lhs, rhs));
                            // replace the goto destinations expressions
                            cmd.Expr = id;
                        }
                    }
                    //var s1 = succs[0].Cmds[0] as AssumeCmd;
                    //var s2 = succs[1].Cmds[0] as AssumeCmd;
                    //if (s1 != null && s2 != null)
                    //{
                    //    // TODO: hacky, this assertion is here to strengthen the assumption that gotos with 2 successors will always be a negation of one another
                    //    Debug.Assert(Expr.Not(s2.Expr).ToString() == s1.Expr.ToString() ||
                    //                 Expr.Not(s1.Expr).ToString() == s2.Expr.ToString() ||
                    //                 s1.Expr.ToString().Replace("!=", "==") == s2.Expr.ToString() ||
                    //                 s2.Expr.ToString().Replace("!=", "==") == s1.Expr.ToString());
                    //    // create a fresh variable
                    //    var v = new LocalVariable(Token.NoToken, new TypedIdent(Token.NoToken, currBlock.Label + "_Cond", Microsoft.Boogie.Type.Bool));
                    //    currImpl.LocVars.Add(v);
                    //    var id = new IdentifierExpr(Token.NoToken, new LocalVariable(Token.NoToken, new TypedIdent(Token.NoToken, currBlock.Label + "_Cond", Microsoft.Boogie.Type.Bool)));
                    //    // create and add the assignment
                    //    var lhs = new List<AssignLhs>();
                    //    lhs.Add(new SimpleAssignLhs(Token.NoToken, id));
                    //    var rhs = new List<Expr>();
                    //    rhs.Add(s1.Expr);
                    //    currBlock.Cmds.Add(new AssignCmd(Token.NoToken, lhs, rhs));
                    //    // replace the goto destinations expressions
                    //    s1.Expr = id;
                    //    s2.Expr = Expr.Not(id);
                    //}
                }
                return node;
            }
        }

        public class RemoveAsserts : StandardVisitor
        {
            public override Cmd VisitAssertCmd(AssertCmd node)
            {
                node.Expr = Expr.True;
                return base.VisitAssertCmd(node);
            }
        }

        public class RemoveValueIsAssumes : StandardVisitor
        {
            public override List<Cmd> VisitCmdSeq(List<Cmd> cmdSeq)
            {
                var newCmdSeq = new List<Cmd>();
                cmdSeq.ForEach
                    (x =>
                    {
                        if (!((x is AssumeCmd) && 
                             ((AssumeCmd)x).Expr.ToString().Contains("value_is")))
                            newCmdSeq.Add(x);
                    }    
                    );
                return base.VisitCmdSeq(newCmdSeq);
            }
        }

        /// <summary>
        /// Rewrites M := M[e := e'] ---> M[e] := e'
        /// </summary>
        public class RewriteSingletonMapUdates : StandardVisitor
        {
            public override Cmd VisitAssignCmd(AssignCmd node)
            {
                var i = 0;
                List<AssignLhs> nLhss = new List<AssignLhs>(node.Lhss);
                List<Expr> nRhss = new List<Expr>(node.Rhss);
                for (i = 0; i < node.Lhss.Count; ++i)
                {
                    var lhs = node.Lhss[i]; 
                    var rhs = node.Rhss[i]; 
                    if (lhs.DeepAssignedVariable.TypedIdent.Type.IsMap && lhs.Type.IsMap)
                    {
                        var x = rhs as NAryExpr;
                        if (x == null) continue;
                        if (x.Fun is MapStore &&
                            lhs.DeepAssignedVariable.ToString() == x.Args[0].ToString())
                        {
                            Debug.Assert(x.Args.Count == 3, "Expecting MapStore(m,x,y)");
                            nRhss[i] = x.Args[2]; //node.Rhss[i] = x.Args[2];
                            nLhss[i] = /*node.Lhss[i] =*/ new MapAssignLhs(Token.NoToken, lhs, new List<Expr> { x.Args[1] });
                        }
                    }
                }
                node.Lhss = nLhss;
                node.Rhss = nRhss;
                return base.VisitAssignCmd(node);
            }
        }


        /// <summary>
        /// Utilities for looking up entities across programs
        /// </summary>
        public static class CrossProgramUtils
        {
            //TODO: this does not account for non-globals (e.g. procedure params/returns/locals)
            public static Declaration ResolveTopLevelDeclsAcrossPrograms(Declaration d, Program prog1, Program prog2)
            {
                //TODO: do we have copies of NONDETVAR?
                if (d == Utils.VariableUtils.NonDetVar)
                    return d;
                var ret = prog2.TopLevelDeclarations.Where(x => x.ToString() == d.ToString() && x.GetType() == d.GetType()).FirstOrDefault();
                if (ret == null)
                    throw new Exception(string.Format("Unable to resolve symbol {0} of type {1} in prog2", d.ToString(), d.GetType()));
                return ret;
            }

            public static Variable ResolveVariableDeclsAcrossPrograms(Variable v, Procedure proc2, Program prog1, Program prog2)
            {
                if (v is GlobalVariable) return (Variable) ResolveTopLevelDeclsAcrossPrograms(v, prog1, prog2);
                if (v is Constant) return (Variable)ResolveTopLevelDeclsAcrossPrograms(v, prog1, prog2);
                var inp = (Variable)proc2.InParams.Where(x => x.Name == v.Name && x.TypedIdent.Type.ToString() == v.TypedIdent.Type.ToString()).FirstOrDefault();
                if (inp != null) return inp;
                var op = (Variable)proc2.OutParams.Where(x => x.Name == v.Name && x.TypedIdent.Type.ToString() == v.TypedIdent.Type.ToString()).FirstOrDefault();
                if (op != null) return op;
                Debug.Assert(v is LocalVariable);
                var impl2 = prog2.TopLevelDeclarations.OfType<Implementation>().Where(x => x.Name == proc2.Name).FirstOrDefault();
                if (impl2 == null)
                    throw new Exception(string.Format("Unable to resolve impl {0} in prog2", proc2.Name));
                var lv = impl2.LocVars.Where(x => x.Name == v.Name && x.TypedIdent.Type.ToString() == v.TypedIdent.Type.ToString()).FirstOrDefault();
                if (lv == null)
                    throw new Exception(string.Format("Unable to resolve local variable {0} of type {1} in impl {2} in prog2", 
                        v.ToString(), v.GetType(), proc2.Name));
                return lv;
            }

            /// <summary>
            /// Converts dependency over prog1 to dependecy over prog2
            /// </summary>
            /// <param name="dependency"></param>
            /// <param name="prog1"></param>
            /// <param name="prog2"></param>
            /// <returns></returns>
            public static Dictionary<Procedure, Dependencies> ResolveDependenciesAcrossPrograms
                (Dictionary<Procedure, Dependencies> procDepends,
                Program prog1,
                Program prog2)
            {
                Dictionary<Procedure, Dependencies> newProcDepends = new Dictionary<Procedure, Dependencies>();
                foreach (var kv in procDepends) //proc -> (Var -> {Var})
                {
                    var proc = kv.Key;
                    var newProc = (Procedure)ResolveTopLevelDeclsAcrossPrograms(proc, prog1, prog2);
                    var depends = new Dependencies();
                    foreach (var kv1 in kv.Value) //Var -> {Var}
                    {
                        var variable = ResolveVariableDeclsAcrossPrograms(kv1.Key, newProc, prog1, prog2);
                        var deps = new VarSet(kv1.Value.Select(x => ResolveVariableDeclsAcrossPrograms(x, newProc, prog1, prog2)));
                        depends[variable] = deps;
                    }
                    newProcDepends[newProc] = depends;
                }
                return newProcDepends;
            }

            static int replicateProgramCount = 0;
            public static Program ReplicateProgram(Program prog, string origFilename)
            {
                var filename = origFilename + ".tmp." + (++replicateProgramCount) + ".bpl";
                PrintProgram(prog, filename);
                //Parsing stuff
                Program newProg;
                if (!Utils.ParseProgram(filename, out newProg)) return null;
                //ModSetCollector c = new ModSetCollector();
                //c.DoModSetAnalysis(newProg);
                return newProg;
            }
        }


        public static Absy GetImplEntry(Implementation node)
        {
            return (node.Blocks[0].Cmds.Count > 0) ?
                (Absy)node.Blocks[0].Cmds[0] :
                (Absy)node.Blocks[0].TransferCmd;
        }

        /// <summary>
        /// These are some very specific stubs for which we should not add out == func(in)
        /// </summary>
        /// <param name="callee"></param>
        /// <returns></returns>
        internal static bool IsBakedInStub(Procedure callee)
        {
            Debug.Assert(false, "Not expecting stubs....did you run dependency.exe for " + callee);
            var name = callee.Name.ToLower();
            return
                name.Contains("_malloc") ||
                name.Contains("det_choice") ||
                name.ToLower().Contains("havoc_");
        }
    }

    //state related to VC generation that will be shared by different options
    /// <summary>
    /// TODO: Copied from Rootcause, refactor
    /// </summary>
    static class VC
    {
        /* vcgen related state */
        static public VerificationConditionGenerator vcgen;
        static public ProverInterface proverInterface;
        static public ProverInterface.ErrorHandler handler;
        static public VerificationResultCollector collector;
        static public Boogie2VCExprTranslator translator;
        static public VCExpressionGenerator exprGen;

        #region Utilities for calling the verifier
        public static void InitializeVCGen(Program prog)
        {
            //create VC.vcgen/VC.proverInterface
            var checkerPool = new CheckerPool(BoogieUtils.BoogieOptions);
            VC.vcgen = new VerificationConditionGenerator(prog, checkerPool);
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
            cex = VC.collector.examples.ToList();
            return proverOutcome;
        }

        public static void FinalizeVCGen(Program prog)
        {
            VC.collector = null;
        }

        public static SolverOutcome MyBeginCheck(string descriptiveName, VCExpr vc, ProverInterface.ErrorHandler handler)
        {
            VC.proverInterface.Push();
            VC.proverInterface.Assert(vc, true);
            VC.proverInterface.Check();
            var outcome = VC.proverInterface.Check(descriptiveName, vc, VC.handler,
                BoogieUtils.BoogieOptions.ErrorLimit, CancellationToken.None).Result;
            VC.proverInterface.Pop();
            return outcome;
        }

        public static VCExpr GenerateVC(Program prog, Implementation impl)
        {
            VC.vcgen.ConvertCFG2DAG(new ImplementationRun(impl, Console.Out));
            ModelViewInfo mvInfo;
            var /*TransferCmd->ReturnCmd*/ gotoCmdOrigins = VC.vcgen.PassifyImpl(new ImplementationRun(impl, Console.Out), out mvInfo);

            var exprGen = VC.proverInterface.Context.ExprGen;
            //VCExpr controlFlowVariableExpr = null; 
            VCExpr controlFlowVariableExpr = /*BoogieUtils.BoogieOptions.UseLabels ? null :*/ VC.exprGen.Integer(BigNum.ZERO);


            var absyIds = new ControlFlowIdMap<Absy>();
            var vc = VC.vcgen.GenerateVC(impl, controlFlowVariableExpr, absyIds, VC.proverInterface.Context);
            VCExpr controlFlowFunctionAppl = VC.exprGen.ControlFlowFunctionApplication(VC.exprGen.Integer(BigNum.ZERO), VC.exprGen.Integer(BigNum.ZERO));
            VCExpr eqExpr = VC.exprGen.Eq(controlFlowFunctionAppl, VC.exprGen.Integer(BigNum.FromInt(impl.Blocks[0].UniqueId)));
            vc = VC.exprGen.Implies(eqExpr, vc);

            return vc;
        }
        #endregion

    }

}
