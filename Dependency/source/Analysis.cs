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
        static private GlobalVariable nonDetVar = new GlobalVariable(Token.NoToken, new TypedIdent(Token.NoToken, "*", Microsoft.Boogie.Type.Int));
        static private Program program;
        static private Dictionary<Procedure, Dependencies> procDependencies = new Dictionary<Procedure, Dependencies>();
        static private Dictionary<Procedure, TaintSet> procTaint = new Dictionary<Procedure, TaintSet>();
        static private bool dataDependencyOnly = false;
        static private bool printDeps = false;
        static private List<Tuple<string, string, int>> changeLog = new List<Tuple<string, string, int>>();
        static private List<Tuple<string, string, int, List<string>>> taintLog = new List<Tuple<string, string, int, List<string>>>();
        static private List<Tuple<string, string, int, string>> dependenciesLog = new List<Tuple<string, string, int, string>>();
        static int Main(string[] args)
        {
            if (args.Length < 1 || args.Length > 3)
            {
                Usage();
                return -1;
            }
             
            CommandLineOptions.Install(new CommandLineOptions());

            string changeList = null;
            args.Where(x => x.StartsWith("/t:"))
                .Iter(s => changeList = s.Split(':')[1]);

            printDeps = (args.Length == 1);
            dataDependencyOnly = args.Any(x => x == "/d");

            if (args.Any(x => x.Contains("/break")))
                Debugger.Launch();

            if (changeList != null)
            {
                if (changeList == "all")
                    RunAnalysis(args[0], null, true);
                else
                    RunAnalysis(args[0], changeList);
            } 
            else
                RunAnalysis(args[0], null);

            var displayHtml = new Utils.DisplayHtmlHelper(changeLog, taintLog, dependenciesLog);
            displayHtml.GenerateHtmlOutput("taint_output.html");
            return 0;
        }

        private static Dictionary<string, HashSet<int>> ParseChangeList(string filename)
        {
            Dictionary<string, HashSet<int>> result = new Dictionary<string, HashSet<int>>();
            if (filename == null)
                return result;
            StreamReader reader = File.OpenText(filename);
            string line;
            while ((line = reader.ReadLine()) != null)
            {
                string[] items = line.Split(',');
                string funcName = items[0];
                int lineNum = int.Parse(items[1]);
                if (!result.ContainsKey(funcName))
                    result[funcName] = new HashSet<int>();
                result[funcName].Add(lineNum);
                changeLog.Add(Tuple.Create(filename, funcName, lineNum));
            }
            return result;
        }

        private static int RunAnalysis(string filename, string changelist, bool taintAll = false)
        {
            Console.WriteLine("Processing file {0}", filename);
            if (!Utils.ParseProgram(filename, out program)) return -1;

            Dictionary<string, HashSet<int>> changes = null;
            if (!taintAll)
                changes = ParseChangeList(changelist);

            // collect Modifies for all procedures
            ModSetCollector c = new ModSetCollector();
            c.DoModSetAnalysis(program);

            List<Declaration> declarations = program.TopLevelDeclarations;

            var implementations = new List<Declaration>(program.TopLevelDeclarations.Where(x => x is Implementation));
            foreach (Implementation impl in implementations)
            {
                if (procDependencies.ContainsKey(impl.Proc)) // the proc may have been visited already through a caller
                    continue;
                var visitor = new DependencyTaintVisitor();

                if (taintAll)
                    visitor.taintAll = true;
                else if (changes.ContainsKey(impl.Proc.Name))
                    visitor.changedLines = changes[impl.Proc.Name];

                visitor.Visit(impl);
            }

            return 0;
        }

        private static void Usage()
        {
            string execName = System.Diagnostics.Process.GetCurrentProcess().MainModule.ModuleName;
            Console.WriteLine("Lightweight inter-procedural dependency\\taint analysis for change impact");
            Console.WriteLine("Usage: " + execName + " <filename.bpl> [/t:changelist.txt | /t:all] [/d]");
            Console.WriteLine("/t:changelist.txt - produce taint for all lined marked as changed in changelist.txt");
            // TODO: /t:all should really be function based, and conveyed by lines like "f,-1" in the changelist file
            Console.WriteLine("/t:all            - produce taint assuming all assignments are tainted");
            Console.WriteLine("/d                - compute data dependnecies\\taint only (no control)");
            Console.WriteLine("No flags          - print dependnecies only (no taint)");
        }

        // some of the WorkList algorithm was exported to this class as it is the same for Dependency and Taint
        public class WorkList<AbsState>  where AbsState :  IAbstractState, new()
        {
            // Command -> Abstract State
            public Dictionary<Absy, AbsState> stateSpace = new Dictionary<Absy,AbsState>();
            internal List<Absy> workList = new List<Absy>();
            internal Dictionary<Absy, Block> cmdBlocks = new Dictionary<Absy, Block>();
            internal HashSet<CallCmd> recursionPoints = new HashSet<CallCmd>();

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
                    foreach (var rp in recursionPoints)
                    {
                        workList.Add(rp);
                    }
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
            public void Print() {
                Console.Write("{ ");
                foreach (var v in this)
                    Console.Write(v + " ");
                Console.WriteLine("}");
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
        }
        public class DependencyTaintVisitor : StandardVisitor
        {
            public List<Variable> inputs;
            public Dictionary<Block, HashSet<Block>> dominates = new Dictionary<Block, HashSet<Block>>();
            public Dictionary<Block, HashSet<Block>> dominatedBy = new Dictionary<Block, HashSet<Block>>();
            // a mapping: branching Block -> { Variables in the branch conditional }
            private Dictionary<Block, HashSet<Variable>> branchCondVars = new Dictionary<Block,HashSet<Variable>>();
            private Procedure currentProc;
            private Implementation currentImpl;
            public WorkList<Dependencies> DWL = new WorkList<Dependencies>();
            public WorkList<TaintSet> TWL = new WorkList<TaintSet>();
            public HashSet<int> changedLines = new HashSet<int>();
            public bool taintAll = false;
            private HashSet<Block> changedBlocks = new HashSet<Block>();

            private Dictionary<Block, HashSet<Block>> ComputeDominators(Implementation impl)
            {
                dominates = program.ProcessLoops(impl).ControlDependence();
                dominatedBy = new Dictionary<Block, HashSet<Block>>();
                // reverse the control dependance mapping (easier for the algorithm)
                foreach (var cd in dominates)
                {
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

                return dominatedBy;
            }

            private TaintSet PruneTaint(Implementation impl, TaintSet taintSet)
            {
                var outTaintSet = new TaintSet();
                foreach (var v in taintSet)
                {
                    // fix the dependencies such that instead of the Implementation outputs
                    // it will adhere to the Procedure outputs
                    if (v is GlobalVariable || impl.OutParams.Contains(v))
                        outTaintSet.Add(Utils.ImplOutputToProcOutput(impl, v));
                }
                return outTaintSet;
            }

            public override Implementation VisitImplementation(Implementation node)
            {
                Console.WriteLine("Analyzing " + node.ToString() + "( ).");
                node.ComputePredecessorsForBlocks();
                ComputeDominators(node);
                inputs = node.InParams;
                currentImpl = node;
                currentProc = node.Proc;

                
                DWL.RunFixedPoint(this,node); // the dependencies fixed-point will also drive the taint computation
                Console.WriteLine("Analyzed " + node.ToString() + "( ).");
                

                Dictionary<int, TaintSet> lines = new Dictionary<int, TaintSet>();
                Dictionary<int, Tuple<string, string, int, List<string>>> tuples = new Dictionary<int, Tuple<string, string, int, List<string>>>();
                string sourcefile = null;
                foreach (var pair in TWL.stateSpace) {
                    if (!(pair.Key is GotoCmd) || pair.Value.Count == 0)
                        continue;
                    Block block = TWL.cmdBlocks[(GotoCmd)pair.Key];
                    if (block.Cmds.Count > 0 && block.Cmds[0] is AssertCmd)
                    {
                        int sourceline = GetSourceLine((AssertCmd)block.Cmds[0]);
                        if (sourcefile == null)
                            sourcefile = GetSourceFile((AssertCmd)block.Cmds[0]);
                        if (sourceline >= 0)
                        {
                            var taintSet = pair.Value;
                            // multiple boogie lines may corrsepond to a single source line
                            // so the taint there would be the join of taint over all boogie lines
                            if (lines.ContainsKey(sourceline)) 
                                taintSet.JoinWith(lines[sourceline]);
                            lines[sourceline] = taintSet;
                            List<string> varNames = taintSet.Select(x => x.Name).ToList<string>();
                            tuples[sourceline] = new Tuple<string, string, int, List<string>>(sourcefile, currentProc.Name, sourceline, varNames);
                        }
                    }
                }

                foreach (var t in tuples.OrderBy(x => x.Key))
                {
                    taintLog.Add(t.Value);
                }

                int lastSourceLine = node.Blocks.Where(b => b.Cmds.Count > 0 && b.Cmds[0] is AssertCmd).Select(b => GetSourceLine((AssertCmd)b.Cmds[0])).Max();
                dependenciesLog.Add(new Tuple<string, string, int, string>(sourcefile, currentProc.Name, lastSourceLine, procDependencies[currentProc].ToString()));

                procDependencies[currentProc] = PruneDependencies(node, procDependencies[currentProc]);
                procTaint[currentProc] = PruneTaint(node, procTaint[currentProc]);

                if (printDeps)
                    Console.WriteLine("Dependencies for procedure " + node.ToString() + "( ) :" + procDependencies[currentProc].ToString() + "\n");

#if DBGRES
                Console.ReadLine();
#endif
                return node;
            }

            private Dependencies PruneDependencies(Implementation impl, Dependencies dependencies)
            {
                var outDependancies = new Dependencies();
                foreach (var dependency in dependencies)
                {
                    var v = dependency.Key;
                    // fix the dependencies such that instead of the Implementation inputs\outputs
                    // it will adhere to the Procedure inputs\outputs
                    if (v is GlobalVariable || impl.OutParams.Contains(v))
                        outDependancies.Add(Utils.ImplOutputToProcOutput(impl, v), Utils.ImplInputsToProcInputs(impl, dependency.Value));
                }
                return outDependancies;
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
                    dependencies[v].Add(nonDetVar);

                    InferDominatorDependency(currBlock, dependencies[v], taintSet, v);

                    if (taintAll || changedBlocks.Contains(currBlock))
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

                //Debug.Assert(node.Lhss.Count == 1 && node.Rhss.Count == 1);
                Expr lhs = node.Lhss[0].AsExpr, rhs = node.Rhss[0];
                var varExtractor = new Utils.VariableExtractor();
                varExtractor.Visit(lhs);

                Variable left = varExtractor.vars.Single(x => true);
                var dependsSet = new HashSet<Variable>();

                varExtractor.vars = new HashSet<Variable>();
                varExtractor.Visit(rhs);
                var rhsVars = varExtractor.vars;


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

                if (taintAll || changedBlocks.Contains(currBlock)) // the line itself is tainted
                {// the line itself is tainted
                    taintSet.Add(left);
                }

                TWL.AssignAndPropagate(node, currBlock, taintSet);
                dependencies[left] = dependsSet;
                DWL.AssignAndPropagate(node, currBlock, dependencies);
                return node;
            }

            private void InferDominatorDependency(Block currBlock, HashSet<Variable> dependsSet, HashSet<Variable> taintSet, Variable left)
            {
                if (dataDependencyOnly)
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
                        if (DWL.stateSpace.ContainsKey(dependentOn))
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
                Block currBlock = DWL.cmdBlocks[node];
                Dependencies dependencies = DWL.GatherPredecessorsState(node, currBlock);
                TaintSet initialTaintSet = TWL.GatherPredecessorsState(node, currBlock), 
                         taintSet = new TaintSet(); // the new taint starts empty
                // an external stub
                if (!(node.Proc == currentProc || procDependencies.Keys.Contains(node.Proc))) {
                    var procImpl = program.Implementations().Where(x => x.Proc == node.Proc);
                    if (procImpl.Count() == 1) // the implementation exists, but has yet to be visited
                    {   // TODO: careful of mutual recursion
                        Console.WriteLine("Visiting call " + node);
                        var visitor = new DependencyTaintVisitor();
                        visitor.Visit(procImpl.First());
                    }
                    else
                    {
                        procDependencies[node.Proc] = new Dependencies();
                        foreach (var v in node.Proc.OutParams)
                        {   // all outputs depend on all inputs
                            procDependencies[node.Proc][v] = new HashSet<Variable>(node.Proc.InParams);
                            // and on *
                            procDependencies[node.Proc][v].Add(nonDetVar);
                        }
                    }
                }

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

                if (node.Proc == currentProc) // recursion
                {
                    DWL.recursionPoints.Add(node);
                    if (!procDependencies.ContainsKey(node.Proc)) {
                        procDependencies[node.Proc] = new Dependencies();
                    }
                }

                var calleeDependencies = procDependencies[node.Proc];
                // handle outputs affected by the call
                for (int i = 0; i < node.Proc.OutParams.Count; ++i)
                {
                    var formalOutput = node.Proc.OutParams[i];
                    if (!calleeDependencies.Keys.Contains(formalOutput))
                        continue;
                    
                    var inferedOutputDependency = InferCalleeOutputDependancy(node,formalOutput,dependencies,inputExpressionsDependency);
                    var actualOutput = node.Outs[i].Decl;
                    dependencies[actualOutput] = inferedOutputDependency;

                    foreach (var v in dependencies[actualOutput]) // the output v := call (...) is infered to depend on {v1, ... ,vn}
                        if (initialTaintSet.Contains(v)) // so if vi is tainted
                            taintSet.Add(actualOutput); // so is v

                    InferDominatorDependency(currBlock, dependencies[actualOutput], taintSet, actualOutput); // conditionals may dominate/taint the return value

                    if (taintAll || changedBlocks.Contains(currBlock))
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
                            (v is GlobalVariable && procTaint[node.Proc].Contains(v))) // or vi is a global marked as tainted in the callee
                            taintSet.Add(g); // g is also tainted

                    InferDominatorDependency(currBlock, dependencies[g], taintSet, g); // conditionals may dominate/taint the modified globals

                    if (taintAll || changedBlocks.Contains(currBlock))
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

            private string GetSourceFile(AssertCmd node)
            {
                for (var attr = node.Attributes; attr != null; attr = attr.Next)
                    if (attr.Key == "sourcefile") // TODO: magic string
                        return (string)attr.Params[0];
                return null;
            }

            private int GetSourceLine(AssertCmd node)
            {
                for (var attr = node.Attributes; attr != null; attr = attr.Next)
                        if (attr.Key == "sourceline") // TODO: magic string
                            return int.Parse(((LiteralExpr)attr.Params[0]).ToString());
                return -1;
            }
            public override Cmd VisitAssertCmd(AssertCmd node)
            {
                Block currBlock = DWL.cmdBlocks[node];
                if (!taintAll) // if we mark all assignments as tainted, no need to search
                    if (changedLines.Contains(GetSourceLine(node))) 
                        changedBlocks.Add(currBlock);

                return VisitCmd(node);
            }

            public override ReturnCmd VisitReturnCmd(ReturnCmd node)
            {
                Block currBlock = DWL.cmdBlocks[node];
                Dependencies dependencies = DWL.GatherPredecessorsState(node, currBlock);
                DWL.AssignAndPropagate(node, currBlock, dependencies);

                // set the dependencies result for the procedure
                if (!procDependencies.ContainsKey(currentProc))
                    procDependencies[currentProc] = DWL.stateSpace[node];
                else
                    procDependencies[currentProc].JoinWith(DWL.stateSpace[node]);

                TaintSet taintSet = TWL.GatherPredecessorsState(node, currBlock);
                TWL.AssignAndPropagate(node, currBlock, taintSet);

                // set the taint result for the procedure
                if (!procTaint.ContainsKey(currentProc))
                    procTaint[currentProc] = TWL.stateSpace[node];
                else
                    procTaint[currentProc].JoinWith(TWL.stateSpace[node]);
                
                return node;
            }
        }


    }
}
