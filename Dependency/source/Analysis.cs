//#define DBG
//#define DBGRES
//#define DBGDOMS

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

namespace Dependency
{
    class Analysis
    {
        static public GlobalVariable NonDetVar = new GlobalVariable(Token.NoToken, new TypedIdent(Token.NoToken, "*", Microsoft.Boogie.Type.Int));
        static private HashSet<Procedure> taintedProcs = new HashSet<Procedure>();
        static private Graph<Procedure> callGraph = new Graph<Procedure>();

        static public List<Dictionary<Procedure, Dependencies>> ComputedDependencies = new List<Dictionary<Procedure, Dependencies>>();

        static private class CmdLineOptsNames
        {
            public const string semanticDep = "/semanticDependency";
            public const string stats = "/stats";
            public const string prune = "/prune";
            public const string both = "/both";
            public const string dataOnly = "/dataOnly";
            public const string taint = "/taint";
            public const string debug = "/break";
            public const string detStubs = "/detStubs";
        }

        static public bool DataOnly = false;
        static public bool BothDependencies = false;
        static public bool Prune = false;
        static public bool PrintStats = false;
        static public bool DetStubs = false;
        
        static private List<Tuple<string, string, int>> changeLog = new List<Tuple<string, string, int>>();
        static private List<Tuple<string, string, int, List<string>>> taintLog = new List<Tuple<string, string, int, List<string>>>();
        static private List<Tuple<string, string, int, string>> dependenciesLog = new List<Tuple<string, string, int, string>>();
        static private string statsFile;

        static public List<Tuple<string, Procedure, Dependencies>> StatsLog = new List<Tuple<string, Procedure, Dependencies>>();
        static int Main(string[] args)
        {
            if (args.Length < 1)
            {
                Usage();
                return -1;
            }

            CommandLineOptions.Install(new CommandLineOptions());
            CommandLineOptions.Clo.RunningBoogieFromCommandLine = true;
            var boogieOptions = "/typeEncoding:m -timeLimit:20 -removeEmptyBlocks:0 /printModel:1 /printModelToFile:model.dmp /printInstrumented "; // /errorLimit:1";
            //IMPORTANT: need the next to avoid crash while creating prover
            CommandLineOptions.Clo.Parse(boogieOptions.Split(' '));
            //IMPORTANT: need these two to make use of UNSAT cores!!
            CommandLineOptions.Clo.UseUnsatCoreForContractInfer = true; //ROHIT
            CommandLineOptions.Clo.ContractInfer = true; //ROHIT

            statsFile = args[0] + ".csv";

            string changeList = null;
            args.Where(x => x.StartsWith(CmdLineOptsNames.taint + ":"))
                .Iter(s => changeList = s.Split(':')[1]);

            DataOnly = args.Any(x => x == CmdLineOptsNames.dataOnly);
            Prune = args.Any(x => x == CmdLineOptsNames.prune);
            BothDependencies = args.Any(x => x == CmdLineOptsNames.both) && !DataOnly;
            DetStubs = args.Any(x => x == CmdLineOptsNames.detStubs);

            PrintStats = args.Any(x => x == CmdLineOptsNames.stats || x.StartsWith(CmdLineOptsNames.stats + ":"));
            args.Where(x => x.StartsWith(CmdLineOptsNames.stats + ":"))
                .Iter(s => statsFile = s.Split(':')[1]);

            if (args.Any(x => x.Contains(CmdLineOptsNames.debug)))
                Debugger.Launch();

            if (args.Any(x => x.Contains(CmdLineOptsNames.semanticDep)))
                (new RefineDependency((new RefineProgram(args[0])).Create())).Run();
            else if (changeList != null)
                RunAnalysis(args[0], changeList);
            else
                RunAnalysis(args[0], null);

            var displayHtml = new Utils.DisplayHtmlHelper(changeLog, taintLog, dependenciesLog);
            displayHtml.GenerateHtmlOutput(args[0] + ".html");
            Console.WriteLine("Output generated in " + args[0] + ".html");

            if (PrintStats)
            {
                var statsHelper = new Utils.StatisticsHelper(StatsLog);
                statsHelper.GenerateCSVOutput(statsFile);
                Console.WriteLine("Statistics generated in " + statsFile);
            }

            TextWriter output = new StreamWriter(args[0] + ".dot");
            output.Write(callGraph.ToDot(p => p.ToString() /*+ procDependencies[p].ToString()*/));
            output.Close();

            return 0;
        }

        // TODO: add a option for marking an entire function as tainted. maybe by adding a line like: funcname,-1 to the changelist
        public static void PopulateChangeLog(string filename)
        {
            if (filename == null)
                return;
            StreamReader reader = File.OpenText(filename);
            string line;
            while ((line = reader.ReadLine()) != null)
            {
                string[] items = line.Split(',');
                changeLog.Add(Tuple.Create(filename, items[0], int.Parse(items[1])));
            }
        }

        static public void PopulateDependencyLog(Implementation impl, Dependencies deps, string which)
        {
            var proc = impl.Proc;
            string sourcefile = Utils.GetImplSourceFile(impl);
            var sourceLines = impl.Blocks.Where(b => b.Cmds.Count > 0 && b.Cmds[0] is AssertCmd).Select(b => Utils.GetSourceLine((AssertCmd)b.Cmds[0]));
            if (sourceLines.Count() == 0)
                return;
            int lastSourceLine = sourceLines.Max();

            string depStr = "<b> " + which + " for " + proc.Name + "(): (Size = " + deps.Sum(d => d.Value.Count) + ")</b> " + deps.ToString();

            dependenciesLog.Add(new Tuple<string, string, int, string>(sourcefile, proc.Name, lastSourceLine, depStr));
        }

        private static int RunAnalysis(string filename, string changelist, bool taintAll = false)
        {
            Console.WriteLine("Running Analysis for {0}", filename);
            Program program;
            if (!Utils.ParseProgram(filename, out program)) return -1;

            if (!taintAll)
                PopulateChangeLog(changelist);

            // collect Modifies for all procedures
            ModSetCollector c = new ModSetCollector();
            c.DoModSetAnalysis(program);

            var visitor = new DependencyTaintVisitor(program);
            visitor.Visit(program);
            visitor.Results();

            if (BothDependencies)
            {
                var dataDepVisitor = new DependencyTaintVisitor(program);
                DataOnly = true;
                dataDepVisitor.Visit(program);
                dataDepVisitor.Results();
            }

            return 0;
        }

        private static void Usage()
        {
            int length = 25;
            string execName = System.Diagnostics.Process.GetCurrentProcess().MainModule.ModuleName;
            Console.WriteLine("Lightweight inter-procedural dependency\\taint analysis for change impact");
            Console.WriteLine("Usage: " + execName + " <filename.bpl> [flags]");
            Console.WriteLine((CmdLineOptsNames.taint + ":changelist.txt").PadRight(length,' ') + " - produce taint for all lined marked as changed in changelist.txt");
            Console.WriteLine(CmdLineOptsNames.dataOnly.PadRight(length,' ') + " - compute data dependnecies\\taint only (no control)");
            Console.WriteLine(CmdLineOptsNames.both.PadRight(length,' ') + " - compute both data & control dependencies for showing in HTML");
            Console.WriteLine(CmdLineOptsNames.prune.PadRight(length,' ') + " - show only in\\out\\global dependencies (no locals)");
            Console.WriteLine((CmdLineOptsNames.stats + "[:statsfile.csv]").PadRight(length,' ') +  " - print dependecies statistics in CSV format [to a specified file]");
            Console.WriteLine(CmdLineOptsNames.semanticDep.PadRight(length,' ') + " - print dependecies statistics in CSV format [to a specified file]");
            Console.WriteLine(CmdLineOptsNames.detStubs.PadRight(length, ' ') + " - (unsoundly) assume stub functions to depend only on input (and not be undeterministic)");
        }

        // some of the WorkList algorithm was exported to this class as it is the same for Dependency and Taint
        public class WorkList<AbsState>  where AbsState :  IAbstractState, new()
        {
            // Command -> Abstract State
            public Dictionary<Absy, AbsState> stateSpace = new Dictionary<Absy,AbsState>();
            internal List<Absy> workList = new List<Absy>();
            internal Dictionary<Absy, Block> cmdBlocks = new Dictionary<Absy, Block>();
            private Dictionary<Absy, Implementation> nodeToImpl;
            private Dictionary<Procedure, HashSet<CallCmd>> procCallers;

            public WorkList(Dictionary<Absy, Implementation> _nodeToImpl, Dictionary<Procedure, HashSet<CallCmd>> _procCallers) {
                nodeToImpl = _nodeToImpl;
                procCallers = _procCallers;
            }

            internal AbsState GatherPredecessorsState(Absy node, Block currBlock)
            {
                AbsState state = default(AbsState);
                if (node is Cmd)
                {
                    int index = currBlock.Cmds.IndexOf((Cmd)node);
                    if (index == 0) 
                        state = GatherBlockPredecessorsState(currBlock, state);
                    else 
                        state = (AbsState)stateSpace[currBlock.Cmds[index - 1]].Clone();
                }
                else if (node is TransferCmd) {
                    if (currBlock.Cmds.Count == 0)
                        state = GatherBlockPredecessorsState(currBlock, state);
                    else
                        state = (AbsState)stateSpace[currBlock.Cmds.Last()].Clone();
                }
                else
                    throw new ArgumentException("Unknown node type: " + node);
                return state;
            }

            internal AbsState GatherBlockPredecessorsState(Block currBlock, AbsState state)
            {
                state = new AbsState();
                foreach (var pred in currBlock.Predecessors)
                {
                    Absy cmd = null;
                    if (pred.Cmds.Count > 0)
                        cmd = pred.Cmds.Last();
                    else
                        cmd = pred.TransferCmd;

                    if (stateSpace.ContainsKey(cmd))
                    {
                        var predState = stateSpace[cmd];
                        state.JoinWith(predState);
                    }
                }
                return state;
            }

            // returns whether a propagation occured
            internal bool AssignAndPropagate(Absy node, Block nodeBlock, AbsState state)
            {
                // if the new state for the node is different, add all succesors to the worklist
                if (!stateSpace.ContainsKey(node))
                    stateSpace[node] = state;
                else if (!stateSpace[node].JoinWith(state))
                    return false;

                Absy cmd;
                if (node is Cmd)
                {
                    int index = nodeBlock.Cmds.IndexOf((Cmd)node);
                    if (index < nodeBlock.Cmds.Count - 1)
                        cmd = nodeBlock.Cmds[index + 1];
                    else
                        cmd = nodeBlock.TransferCmd;
                    workList.Add(cmd);
                    cmdBlocks[cmd] = nodeBlock;
                }
                else if (node is GotoCmd)
                {
                    foreach (var succ in ((GotoCmd)node).labelTargets)
                    {
                        if (succ.Cmds.Count > 0)
                            cmd = succ.Cmds[0];
                        else
                            cmd = succ.TransferCmd; // some blocks are just a goto
                        workList.Add(cmd);
                        cmdBlocks[cmd] = succ;
                    }
                }
                else if (node is ReturnCmd) // for recursive procedures, the return propagates to all call sites
                {
                    var caller = nodeToImpl[node].Proc;
                    if (procCallers.ContainsKey(caller))
                        foreach (var cs in procCallers[caller])
                            workList.Add(cs);
                }

                return true;
            }

            internal void RunFixedPoint(StandardVisitor visitor, Implementation node)
            {
                Absy entry = (node.Blocks[0].Cmds.Count > 0) ? 
                    (Absy)node.Blocks[0].Cmds[0] :
                    (Absy)node.Blocks[0].TransferCmd;
                workList.Add(entry);
                cmdBlocks[entry] = node.Blocks[0];
                while (workList.Count > 0)
                {
                    var cmd = workList[0];
                    workList.RemoveAt(0);
#if DBG
                    Console.WriteLine("Visiting L" + cmd.Line + ": " + cmd);
#endif
                    visitor.Visit(cmd);
#if DBG
                    if (stateSpace.ContainsKey(cmd))
                        Console.WriteLine(stateSpace[cmd].ToString());
                    Console.ReadLine();
#endif
                }
            }
        }
        public interface IAbstractState
        {
            bool JoinWith(IAbstractState d);
            IAbstractState Clone();
        }
        public class TaintSet : HashSet<Variable>, IAbstractState
        {
            public TaintSet() : base() { }

            public TaintSet(TaintSet t) : base(t) { }

            public IAbstractState Clone()
            {
                return new TaintSet(this);
            }
            public override string ToString()
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("{ ");
                foreach (var v in this)
                    sb.Append(v + " ");
                sb.Append("}");
                return sb.ToString();
            }

            // returns ( (this |_| ias) > this ) i.e. whether ias had tainted variables that did not exist in this
            public bool JoinWith(IAbstractState ias)
            {
                TaintSet t = (TaintSet)ias;
                bool added = false;
                foreach (var v in t)
                {
                    if (!Contains(v))
                    {
                        this.Add(v);
                        added = true;
                    }
                }
                return added;
            }

            public void Prune(Implementation impl)
            {
                var proc = impl.Proc;
                var result = new TaintSet();
                foreach (var v in this)
                {
                    // leave only globals and outputs
                    if (v is GlobalVariable || proc.OutParams.Contains(v))
                        result.Add(v);
                }
                Clear();
                JoinWith(result);
            }

            public void FixFormals(Implementation impl)
            {
                var result = new TaintSet();
                foreach (var v in this)
                {
                    // fix the dependencies such that instead of the Implementation outputs
                    // it will adhere to the Procedure outputs
                    if (impl.OutParams.Contains(v))
                        result.Add(Utils.ImplOutputToProcOutput(impl, v));
                    else 
                        result.Add(v);
                }
                Clear();
                JoinWith(result);
            }
        }
        public class Dependencies : Dictionary<Variable, HashSet<Variable>>, IAbstractState
        {
            public Dependencies() : base() { }
            // this is a deep copy, since we keep sets in the dictionary
            public Dependencies(Dependencies d)
                : base(d)
            {
                foreach (var v in d.Keys)
                {
                    this[v] = new HashSet<Variable>(d[v]);
                }
            }

            public IAbstractState Clone() {
                return new Dependencies(this);
            }

            public List<Variable> ReadSet()
            {
                HashSet<Variable> result = new HashSet<Variable>();
                foreach (var d in this.Values)
                    result.UnionWith(d);
                return new List<Variable>(result);
            }

            public List<Variable> ModSet()
            {
                return new List<Variable>(Keys);
            }

            public override string ToString()
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("[\n");
                foreach (var v in Keys)
                {
                    sb.Append("  " + v + " <- { ");
                    foreach (var d in this[v])
                    {
                        sb.Append(d + ", ");
                    }
                    sb.Append(" }\n");
                }
                sb.Append("]\n");
                return sb.ToString();
            }

            public string ToStringPretty()
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("[ \n");
                foreach (var v in Keys)
                {
                    int maxLen = 0;
                    var vheader = "  " + v + " <- { ";
                    sb.Append(vheader);
                    if (this[v].Count == 0)
                    {
                        sb.Append("}\n");
                        continue;
                    }

                    string vspaces = new string(' ', vheader.Length);
                    foreach (var d in this[v])
                    {
                        var dLen = d.ToString().Length;
                        if (d == this[v].Last())
                        {
                            sb.Append(d);
                            maxLen = (dLen > maxLen ? dLen : maxLen);
                            string lastSpaces = new string(' ', maxLen - dLen);
                            sb.Append(lastSpaces + " }\n");
                        }
                        else
                        {
                            sb.Append(d + "\n");
                            maxLen = (dLen > maxLen ? dLen : maxLen);
                            sb.Append(vspaces);
                        }
                    }
                }
                sb.Append("]");
                return sb.ToString();
            }

            // returns ( (this |_| ias) > this ) i.e. whether ias has dependencies that did not exists in this
            public bool JoinWith(IAbstractState ias)
            {
                bool added = false;
                Dependencies d = (Dependencies)ias;
                foreach (var v in d.Keys)
                {
                    if (!ContainsKey(v))
                    {
                        this[v] = new HashSet<Variable>(d[v]);
                    }
                    else if (!this[v].IsSupersetOf(d[v]))
                    {
                        this[v].UnionWith(d[v]);
                    }
                    else
                    {
                        continue;
                    }
                    added = true;
                }
                return added;
            }

            public void FixFormals(Implementation impl)
            {
                var result = new Dependencies();
                foreach (var dependency in this)
                {
                    var v = dependency.Key;
                    // fix the dependencies such that instead of the Implementation inputs\outputs
                    // it will adhere to the Procedure inputs\outputs
                    if (impl.OutParams.Contains(v))
                    {
                        var fv = Utils.ImplOutputToProcOutput(impl, v);
                        if (!result.ContainsKey(fv))
                            result[fv] = new HashSet<Variable>();
                        result[fv].UnionWith(Utils.ImplInputsToProcInputs(impl, dependency.Value));
                    }
                    else
                    {
                        if (!result.ContainsKey(v))
                            result[v] = new HashSet<Variable>();
                        result[v].UnionWith(dependency.Value);
                    }
                }
                this.JoinWith(result);
            }

            public void Prune(Implementation impl)
            {
                var proc = impl.Proc;
                var result = new Dependencies();
                foreach (var dependency in this)
                {
                    var v = dependency.Key;
                    // leave only globals and formal outputs
                    if (v is GlobalVariable || proc.OutParams.Contains(v))
                        result.Add(v, Utils.ImplInputsToProcInputs(impl, dependency.Value));
                }
                Clear();
                JoinWith(result);
            }
        }
        public class DependencyTaintVisitor : StandardVisitor
        {
            private Program program;
            private Dictionary<Absy, Implementation> nodeToImpl = new Dictionary<Absy, Implementation>();
            public Dictionary<Procedure, Dependencies> procDependencies = new Dictionary<Procedure, Dependencies>();
            private Dictionary<Procedure, TaintSet> procTaint = new Dictionary<Procedure, TaintSet>();
            private Dictionary<Procedure, HashSet<CallCmd>> procCallers = new Dictionary<Procedure, HashSet<CallCmd>>();
            public Dictionary<Block, HashSet<Block>> dominates = new Dictionary<Block, HashSet<Block>>();
            public Dictionary<Block, HashSet<Block>> dominatedBy = new Dictionary<Block, HashSet<Block>>();
            // a mapping: branching Block -> { Variables in the branch conditional }
            private Dictionary<Block, HashSet<Variable>> branchCondVars = new Dictionary<Block,HashSet<Variable>>();
            public WorkList<Dependencies> DWL;
            public WorkList<TaintSet> TWL;
            public HashSet<int> changedLines = new HashSet<int>();
            private HashSet<Block> changedBlocks = new HashSet<Block>();


            private void ComputeNodeToImpl()
            {
                var implementations = new List<Declaration>(program.TopLevelDeclarations.Where(x => x is Implementation));
                foreach (Implementation impl in implementations)
                    foreach (var b in impl.Blocks)
                    {
                        foreach (var s in b.Cmds)
                            nodeToImpl[s] = impl;
                        nodeToImpl[b.TransferCmd] = impl;
                    }
            }

            public DependencyTaintVisitor(Program p)
            {
                program = p;
                ComputeNodeToImpl();
                DWL = new WorkList<Dependencies>(nodeToImpl, procCallers);
                TWL = new WorkList<TaintSet>(nodeToImpl, procCallers);
            }
            public override Program VisitProgram(Program node)
            {
                callGraph = Utils.ComputeCallGraph(node);
                
                var reversedBFS = new List<Procedure>();
                Utils.BFS(callGraph).Iter(l => reversedBFS.AddRange(l.Value));  
                reversedBFS.Reverse();

                foreach (var proc in reversedBFS)
                {
                    var impl = (Implementation)program.TopLevelDeclarations.Find(x => x is Implementation && ((Implementation)x).Proc == proc);
                    if (impl == null)
                        continue;
                    if (procDependencies.ContainsKey(impl.Proc)) // the proc may have been visited already through a caller
                        continue;
                    else
                        foreach (var change in changeLog.Where(x => x.Item2 == impl.Proc.Name))
                            changedLines.Add(change.Item3);

                    Visit(impl);
                }
                return node;
            }

            public void PopulateTaintLog(Implementation node)
            {
                Dictionary<int, TaintSet> lines = new Dictionary<int, TaintSet>();
                Dictionary<int, Tuple<string, string, int, List<string>>> tuples = new Dictionary<int, Tuple<string, string, int, List<string>>>();
                string sourcefile = Utils.GetImplSourceFile(node);
                foreach (var pair in TWL.stateSpace)
                {
                    if (!(pair.Key is GotoCmd) || pair.Value.Count == 0)
                        continue;
                    Block block = TWL.cmdBlocks[(GotoCmd)pair.Key];
                    if (block.Cmds.Count > 0 && block.Cmds[0] is AssertCmd)
                    {
                        int sourceline = Utils.GetSourceLine((AssertCmd)block.Cmds[0]);
                        if (sourceline >= 0)
                        {
                            var taintSet = pair.Value;
                            // multiple boogie lines may corrsepond to a single source line
                            // so the taint there would be the join of taint over all boogie lines
                            if (lines.ContainsKey(sourceline))
                                taintSet.JoinWith(lines[sourceline]);
                            lines[sourceline] = taintSet;
                            List<string> varNames = taintSet.Select(x => x.Name).ToList<string>();
                            tuples[sourceline] = new Tuple<string, string, int, List<string>>(sourcefile, node.Proc.Name, sourceline, varNames);
                        }
                    }
                }

                foreach (var t in tuples.OrderBy(x => x.Key))
                    taintLog.Add(t.Value);
            }

            private void ComputeDominators(Implementation impl)
            {   
                // reverse the control dependence mapping (easier for the algorithm)
                foreach (var cd in program.ProcessLoops(impl).ControlDependence())
                {
                    dominates.Add(cd.Key, cd.Value);
                    foreach (var controlled in cd.Value)
                    {
                        if (!dominatedBy.Keys.Contains(controlled))
                            dominatedBy[controlled] = new HashSet<Block>();
#if DBGDOMS
                        Console.WriteLine(controlled + " dominated by " + cd.Key);
#endif
                        dominatedBy[controlled].Add(cd.Key);
                    }
                }
            }

            public override Implementation VisitImplementation(Implementation node)
            {
                node.ComputePredecessorsForBlocks();
                ComputeDominators(node);

                DWL.RunFixedPoint(this,node); // the dependencies fixed-point will also drive the taint computation
                Console.WriteLine("Analyzed " + node + "( ).");

                return node;
            }

            public override Cmd VisitHavocCmd(HavocCmd node)
            {
                Block currBlock = DWL.cmdBlocks[node];
                Dependencies dependencies = DWL.GatherPredecessorsState(node, currBlock);
                TaintSet taintSet = TWL.GatherPredecessorsState(node, currBlock);

                // Havoc x translates to x <- *
                foreach (var v in node.Vars.Select(x => x.Decl))
	            {
                    dependencies[v] = new HashSet<Variable>();
                    dependencies[v].Add(NonDetVar);

                    InferDominatorDependency(currBlock, dependencies[v], taintSet, v);

                    if (taintedProcs.Contains(nodeToImpl[node].Proc) || changedBlocks.Contains(currBlock))
                    {// the line itself is tainted
                        taintSet.Add(v);
                    }
	            }

                TWL.AssignAndPropagate(node, currBlock, taintSet);
                DWL.AssignAndPropagate(node, currBlock, dependencies);
                return node;
            }

            public override GotoCmd VisitGotoCmd(GotoCmd node)
            {
                Block currBlock = DWL.cmdBlocks[node];
                Dependencies dependencies = DWL.GatherPredecessorsState(node, currBlock);
                TaintSet taintSet = TWL.GatherPredecessorsState(node, currBlock);
                var succs = node.labelTargets;
                if (succs.Count > 1)
                { // here we create branchCondVars
                    if (!branchCondVars.ContainsKey(currBlock))
                        branchCondVars[currBlock] = new HashSet<Variable>();
                    foreach (var succ in succs)
                    {
                        Debug.Assert(succ.Cmds[0] is AssumeCmd);
                        AssumeCmd cmd = (AssumeCmd)succ.Cmds[0];
                        var varExtractor = new Utils.VariableExtractor();
                        varExtractor.Visit(cmd.Expr);
                        branchCondVars[currBlock].UnionWith(varExtractor.vars);
                    }

                    if (changedBlocks.Contains(currBlock))
                    {// a tainted conditional
                        taintSet.UnionWith(branchCondVars[currBlock]);
                    }

                    // Note: we assume control structure change results in the taintAll flag being turned on.
                    //       and therefore don't handle change in goto destinations etc.
                }

                TWL.AssignAndPropagate(node, currBlock, taintSet);
                // put the goto destinations in the worklist
                DWL.AssignAndPropagate(node, currBlock, dependencies);
                return node;
            }
            public override Cmd VisitAssignCmd(AssignCmd node)
            {
                // gather state from all predecesors
                Block currBlock = DWL.cmdBlocks[node];
                Dependencies dependencies = DWL.GatherPredecessorsState(node, currBlock);
                TaintSet taintSet = TWL.GatherPredecessorsState(node, currBlock);

                // for assignment v1,...,vn = e1,...,en handle each vi = ei separately
                for (int i = 0; i < node.Lhss.Count; ++i)
                {
                    Expr lhs = node.Lhss[i].AsExpr, rhs = node.Rhss[i];
                    var varExtractor = new Utils.VariableExtractor();
                    varExtractor.Visit(lhs);
                    Variable left = varExtractor.vars.First(); // TODO: stuff like: Mem_T.INT4[in_prio] := out_tempBoogie0
                    
                    varExtractor = new Utils.VariableExtractor();
                    varExtractor.Visit(rhs);
                    var rhsVars = varExtractor.vars;

                    var dependsSet = new HashSet<Variable>();
                    taintSet.Remove(left);

                    foreach (var rv in rhsVars)
                    {
                        dependsSet.Add(rv);

                        if (dependencies.ContainsKey(rv)) // a variable in rhs has dependencies
                            dependsSet.UnionWith(dependencies[rv]);

                        if (taintSet.Contains(rv)) // a variable in rhs is tainted
                            taintSet.Add(left);
                    }

                    InferDominatorDependency(currBlock, dependsSet, taintSet, left);

                    if (taintedProcs.Contains(nodeToImpl[node].Proc) || changedBlocks.Contains(currBlock)) // the line itself is tainted
                        taintSet.Add(left);

                    dependencies[left] = dependsSet;
                }

                TWL.AssignAndPropagate(node, currBlock, taintSet);
                DWL.AssignAndPropagate(node, currBlock, dependencies);
                return node;
            }

            private void InferDominatorDependency(Block currBlock, HashSet<Variable> dependsSet, HashSet<Variable> taintSet, Variable left)
            {
                if (DataOnly)
                    return;
                bool tainted = false;
                // assignment under a branch is dependent on all the variables in the branch's conditional
                if (dominatedBy.Keys.Contains(currBlock))
                    foreach (var dominator in dominatedBy[currBlock])
                        if (branchCondVars.ContainsKey(dominator))
                            foreach (var v in branchCondVars[dominator])
                            {
                                // if v was tainted at the branching point, that taints the current block operations
                                if (!tainted && TWL.stateSpace.ContainsKey(dominator.TransferCmd))
                                    if (TWL.stateSpace[dominator.TransferCmd].Contains(v))
                                    {
                                        taintSet.Add(left);
                                        tainted = true;
                                    }

                                dependsSet.Add(v);
                                // it is also dependends on all that v depends on *at the point of branching*
                                if (DWL.stateSpace.ContainsKey(dominator.TransferCmd))
                                {
                                    var domDep = DWL.stateSpace[dominator.TransferCmd];
                                    if (domDep.ContainsKey(v))
                                        dependsSet.UnionWith(domDep[v]);
                                }
                            }
            }


            private HashSet<Variable> InferCalleeOutputDependancy(CallCmd cmd, Variable output, Dependencies state, List<HashSet<Variable>> inputExpressionsDependency)
            {
                var outputDependency = procDependencies[cmd.Proc][output]; // output is dependent on a set of formals and globals
                var inferedOutputDependency = new HashSet<Variable>();
                foreach (var dependentOn in outputDependency) // foreach (formal parameter p\global g) o_i is dependent upon
                {
                    if (dependentOn is GlobalVariable) // global
                    { // add in the global's dependency set
                        inferedOutputDependency.Add(dependentOn);
                        if (state.ContainsKey(dependentOn))
                            inferedOutputDependency.UnionWith(state[dependentOn]);
                        continue;
                    }
                    var inputIndex = cmd.Proc.InParams.IndexOf(dependentOn);
                    if (inputIndex >= 0) // formal parameter
                        // replace the formal with the actual's dependency set
                        inferedOutputDependency.UnionWith(inputExpressionsDependency[inputIndex]);
                }
                return inferedOutputDependency;
            }

            public override Cmd VisitCallCmd(CallCmd node)
            {
                var callee = node.Proc;
                if (!procCallers.ContainsKey(callee))
                    procCallers[callee] = new HashSet<CallCmd>();
                procCallers[callee].Add(node);
                Block currBlock = DWL.cmdBlocks[node];
                Dependencies dependencies = DWL.GatherPredecessorsState(node, currBlock);
                TaintSet initialTaintSet = TWL.GatherPredecessorsState(node, currBlock), 
                         taintSet = new TaintSet(); // the new taint starts empty

                // an external stub
                if (program.Implementations().Where(x => x.Proc == callee).Count() == 0)
                {
                    procDependencies[callee] = new Dependencies();
                    foreach (var v in callee.OutParams)
                    {   // all outputs depend on all inputs
                        procDependencies[callee][v] = new HashSet<Variable>(callee.InParams);
                        if (!DetStubs)
                            procDependencies[callee][v].Add(NonDetVar); // and on *
                    }
                }

                if (!procDependencies.ContainsKey(callee))
                { // this will be continued once the callee gets analyzed
                    TWL.AssignAndPropagate(node, currBlock, new TaintSet());
                    DWL.AssignAndPropagate(node, currBlock, new Dependencies());
                    return node;
                }

                var calleeDependencies = procDependencies[callee];

                // first, for f(e1,...,ek) find the dependency set of each ei
                var inputExpressionsDependency = new List<HashSet<Variable>>();
                foreach (var inExpr in node.Ins)
	            {
		            var varExtractor = new Utils.VariableExtractor();
                    varExtractor.Visit(inExpr);
                    inputExpressionsDependency.Add(new HashSet<Variable>());
                    int current = inputExpressionsDependency.Count - 1;
                    foreach (var v in varExtractor.vars)
                    {
                        inputExpressionsDependency[current].Add(v);
                        if (dependencies.Keys.Contains(v))
                            inputExpressionsDependency[current].UnionWith(dependencies[v]);
                    }
	            }

                // handle outputs affected by the call
                for (int i = 0; i < callee.OutParams.Count; ++i)
                {
                    var formalOutput = callee.OutParams[i];
                    if (!calleeDependencies.ContainsKey(formalOutput))
                        continue;
                    var inferedOutputDependency = InferCalleeOutputDependancy(node,formalOutput,dependencies,inputExpressionsDependency);
                    var actualOutput = node.Outs[i].Decl;
                    dependencies[actualOutput] = inferedOutputDependency;

                    foreach (var v in dependencies[actualOutput]) // the output v := call (...) is infered to depend on {v1, ... ,vn}
                        if (initialTaintSet.Contains(v)) // so if vi is tainted
                            taintSet.Add(actualOutput); // so is v

                    InferDominatorDependency(currBlock, dependencies[actualOutput], taintSet, actualOutput); // conditionals may dominate/taint the return value

                    if (taintedProcs.Contains(nodeToImpl[node].Proc) || changedBlocks.Contains(currBlock))
                    {// the line itself is tainted
                        taintSet.Add(actualOutput);
                    }
                }

                // handle globals affected by the call
                foreach (var g in calleeDependencies.Keys)
                {
                    if (!(g is GlobalVariable))
                        continue;
                    var inferedOutputDependency = InferCalleeOutputDependancy(node,g,dependencies,inputExpressionsDependency);
                    dependencies[g] = inferedOutputDependency;

                    foreach (var v in dependencies[g])// a global g in the call (...) is infered to depend on {v1, ... ,vn}
                        if (initialTaintSet.Contains(v) || // so if vi is tainted
                            (v is GlobalVariable && procTaint[callee].Contains(v))) // or vi is a global marked as tainted in the callee
                            taintSet.Add(g); // g is also tainted

                    InferDominatorDependency(currBlock, dependencies[g], taintSet, g); // conditionals may dominate/taint the modified globals

                    if (taintedProcs.Contains(nodeToImpl[node].Proc) || changedBlocks.Contains(currBlock))
                    {// the line itself is tainted TODO: this may be too conservative
                        taintSet.Add(g);
                    }
                }

                TWL.AssignAndPropagate(node, currBlock, taintSet);
                DWL.AssignAndPropagate(node, currBlock, dependencies);
                return node;
            }

            // this is a simple transformer for a command that has no effect on the state
            public Cmd VisitCmd(Cmd node)
            {
                Block currBlock = DWL.cmdBlocks[node];
                var dependencies = DWL.GatherPredecessorsState(node, currBlock);
                DWL.AssignAndPropagate(node, currBlock, dependencies);
                var taintSet = TWL.GatherPredecessorsState(node, currBlock);
                TWL.AssignAndPropagate(node, currBlock, taintSet);
                return node;
            }

            public override Cmd VisitAssumeCmd(AssumeCmd node)
            {
                return VisitCmd(node);
            }
            public override Cmd VisitAssertCmd(AssertCmd node)
            {
                Block currBlock = DWL.cmdBlocks[node];
                if (!taintedProcs.Contains(nodeToImpl[node].Proc)) // if we mark all assignments as tainted, no need to search
                    if (changedLines.Contains(Utils.GetSourceLine(node))) 
                        changedBlocks.Add(currBlock);

                return VisitCmd(node);
            }

            public override ReturnCmd VisitReturnCmd(ReturnCmd node)
            {
                Block currBlock = DWL.cmdBlocks[node];
                Dependencies dependencies = DWL.GatherPredecessorsState(node, currBlock);
                DWL.AssignAndPropagate(node, currBlock, dependencies);
                var currentProc = nodeToImpl[node].Proc;
                // set the dependencies result for the procedure
                if (!procDependencies.ContainsKey(currentProc))
                    procDependencies[currentProc] = new Dependencies();
                procDependencies[currentProc].JoinWith(DWL.stateSpace[node]);
                procDependencies[currentProc].FixFormals(nodeToImpl[node]);

                TaintSet taintSet = TWL.GatherPredecessorsState(node, currBlock);
                TWL.AssignAndPropagate(node, currBlock, taintSet);

                // set the taint result for the procedure
                if (!procTaint.ContainsKey(currentProc))
                    procTaint[currentProc] = new TaintSet();
                procTaint[currentProc].JoinWith(TWL.stateSpace[node]);
                procTaint[currentProc].FixFormals(nodeToImpl[node]);
                
                return node;
            }

            public void Results()
            {
                foreach (Implementation impl in program.TopLevelDeclarations.Where(x => x is Implementation))
                {
                    var proc = impl.Proc;
                    if (Prune)
                    {
                        procDependencies[proc].Prune(impl);
                        procTaint[proc].Prune(impl);
                    }

                    PopulateTaintLog(impl);
                    PopulateDependencyLog(impl, procDependencies[proc], DataOnly ? "Data Only" : "Data and Control");

                    if (PrintStats)
                        StatsLog.Add(new Tuple<string, Procedure, Dependencies>(Utils.GetImplSourceFile(impl), proc, procDependencies[proc]));

                }
                ComputedDependencies.Add(procDependencies);
            }
        }


    }
}
