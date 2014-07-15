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
        static private Program program;
        static private Dictionary<Procedure, Dependencies> procDependencies = new Dictionary<Procedure, Dependencies>();
        static int Main(string[] args)
        {
            CommandLineOptions.Install(new CommandLineOptions());

            if (args.Length < 1)
            {
                Usage();
                return -1;
            }
            string filename = args[0];

            Console.WriteLine("Processing file {0}", filename);
            if (!Utils.ParseProgram(filename, out program)) return -1;

            // collect Modifies for all procedures
            ModSetCollector c = new ModSetCollector();
            c.DoModSetAnalysis(program);

            List<Declaration> declarations = program.TopLevelDeclarations;

            
            var implementations = new List<Declaration>(program.TopLevelDeclarations.Where(x => x is Implementation));
            foreach (Implementation impl in implementations) {
                Console.WriteLine("Found implementation: {0}",impl.ToString());
                var visitor = new DependencyVisitor();
                visitor.dominatedBy = ComputeDominators(impl);

                visitor.Visit(impl);

                foreach (var dependency in procDependencies[impl.Proc])
                {
                    Console.Write("{0} <-- {{ ",dependency.Key); 
                    foreach (var v in dependency.Value)
	                {
		                 Console.Write(v + " ");
	                }
                    Console.WriteLine("}");
                }
            }

            System.Console.WriteLine("Done.");

            return 0;

        }

        private static Dictionary<Block, HashSet<Block>> ComputeDominators(Implementation impl)
        {
            Graph<Block> blockGraph = program.ProcessLoops(impl);
            var controlDeps = blockGraph.ControlDependence();
            var dominatedBy = new Dictionary<Block, HashSet<Block>>();
            // reverse the control dependance mapping (easier for the algorithm)
            foreach (var cd in controlDeps)
            {
                foreach (var controlled in cd.Value)
                {
                    if (!dominatedBy.Keys.Contains(controlled))
                        dominatedBy[controlled] = new HashSet<Block>();
                    dominatedBy[controlled].Add(cd.Key);
                }
            }
            // transitive closure needed here
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
                    {   // each block is also dominated by the the dominators of its dominators :)
                        if (dominatedBy.Keys.Contains(block))
                            newDominators.UnionWith(dominatedBy[block]);
                    }
                    if (newDominators.Count > dominators.Count)
                    {
                        newDominatedBy[dom.Key] = newDominators;
                        done = false;
                    }
                }
                if (!done)
                    dominatedBy = newDominatedBy;
            } while (!done);

            return dominatedBy;
        }

        private static void Usage()
        {
            string execName = System.Diagnostics.Process.GetCurrentProcess().MainModule.ModuleName;
            Console.WriteLine("Lightweight inter-procedural dependency analysis for change impact");
            Console.WriteLine("Usage: " + execName + " <filename.bpl>");
            Console.WriteLine("filename.bpl -- a Boogie program");
        }

        // This is our abstract domain
        public class Dependencies : Dictionary<Variable, HashSet<Variable>>
        {
            public Dependencies() : base() { }
            // this is a deep copy, since we keep sets in the dictionary
            public Dependencies(Dependencies d) : base(d) {
                foreach (var v in d.Keys)
                {
                    this[v] = new HashSet<Variable>(d[v]);
                }
            }

            public void Print() {
                Console.Write("[ ");
                foreach (var v in Keys)
	            {
                    Console.Write(v + " -> { ");
                    foreach (var d in this[v])
	                {
		                 Console.Write(d + " ");
	                }
                    Console.Write("}" + (Keys.Last() == v ? "" : " ,"));
	            }
                Console.WriteLine(" ]");
            }

            // returns (d > this)
            public bool JoinWith(Dependencies d)
            {
                bool geq = false;
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
                    geq = true;
                }
                return geq;
            }
            
        }

        public class DependencyVisitor : StandardVisitor
        {
            Procedure currentProc;
            public List<Variable> inputs;
            // Command -> ( Var -> { Var } )
            public Dictionary<Absy, Dependencies> dependencies = new Dictionary<Absy,Dependencies>();
            public Dictionary<Block, HashSet<Block>> dominatedBy = new Dictionary<Block, HashSet<Block>>();
            // a mapping: branching Block -> { Variables in the branch conditional }
            private Dictionary<Block, HashSet<Variable>> branchCondVars = new Dictionary<Block,HashSet<Variable>>();
            private Graph<Block> blockGraph;
            private List<Absy> workList;
            private Dictionary<Absy, Block> cmdToBlock;

            static public HashSet<Variable> ImplInputsToProcInputs(Implementation impl, HashSet<Variable> vars)
            {
                var result = new HashSet<Variable>();
                foreach (var v in vars)
                {
                    if (impl.InParams.Contains(v)) // replace Implemetation inputs with Procedure inputs
                        result.Add(impl.Proc.InParams[impl.InParams.IndexOf(v)]);
                    else if (v is GlobalVariable)
                        result.Add(v); 
                }
                return result;
            }
            private Variable ImplOutputToProcOutput(Implementation node, Variable v)
            {
                var index = node.OutParams.IndexOf(v);
                if (index >= 0) // replace Implemetation outputs with Procedure outputs
                    return node.Proc.OutParams[index];
                else
                    return v; // leave non-outputs as is
            }
            public override Implementation VisitImplementation(Implementation node)
            {
                node.ComputePredecessorsForBlocks();
                blockGraph = program.ProcessLoops(node);
                inputs = node.InParams;
                currentProc = node.Proc;
                cmdToBlock = new Dictionary<Absy, Block>();

                // do a fixed point computation
                workList = new List<Absy>();
                workList.Add(node.Blocks[0].Cmds[0]);
                cmdToBlock[node.Blocks[0].Cmds[0]] = node.Blocks[0];
                while (workList.Count > 0)
                {
                    var cmd = workList[0];
                    workList.RemoveAt(0);
                    Visit(cmd);
                }

                var outDependancies = new Dependencies();
                foreach (var dependency in procDependencies[currentProc])
                {
                    var v = dependency.Key;
                    // fix the dependencies such that instead of the Implementation inputs\outputs
                    // it will adhere to the Procedure inputs\outputs
                    if (v is GlobalVariable || node.OutParams.Contains(v)) 
                        outDependancies.Add(ImplOutputToProcOutput(node, v), ImplInputsToProcInputs(node, dependency.Value));
                }
                procDependencies[currentProc] = outDependancies;
                return node;
            }

            public override GotoCmd VisitGotoCmd(GotoCmd node)
            {
                Block currBlock = cmdToBlock[node];
                // get the state from the previous command
                // TODO: this might not be necessary
                var state = new Dependencies(dependencies[currBlock.Cmds.Last()]);
                //state.JoinWith(dependencies[currBlock.Cmds.Last()]);
                var succs = node.labelTargets;
                if (succs.Count > 1)
                { // here we create branchCondVars
                    foreach (var succ in succs)
                    {
                        Debug.Assert(succ.Cmds[0] is AssumeCmd);
                        AssumeCmd cmd = (AssumeCmd)succ.Cmds[0];
                        var varExtractor = new VariableExtractor();
                        varExtractor.Visit(cmd.Expr);
                        branchCondVars[currBlock] = varExtractor.vars;
                    }
                }
                
                // put the goto destinations in the worklist
                AssignAndPropagate(node, currBlock, state);
                return node;
            }
            public override Cmd VisitAssignCmd(AssignCmd node)
            {
                // gather state from all predecesors
                Block currBlock = cmdToBlock[node];
                Dependencies state = GatherPredecessorState(node, currBlock);

                //Debug.Assert(node.Lhss.Count == 1 && node.Rhss.Count == 1);
                Expr lhs = node.Lhss[0].AsExpr, rhs = node.Rhss[0];
                var varExtractor = new VariableExtractor();
                varExtractor.Visit(lhs);

                Variable left = varExtractor.vars.Single(x => true);
                var taintSet = new HashSet<Variable>();

                varExtractor.vars = new HashSet<Variable>();
                varExtractor.Visit(rhs);
                var rhsVars = varExtractor.vars;

                foreach (var rv in rhsVars)
                {
                    taintSet.Add(rv);

                    if (state.ContainsKey(rv)) // a variable in rhs is tainted
                        taintSet.UnionWith(state[rv]);

                    //if (rv is GlobalVariable || inputs.Contains(rv))
                    //    taintSet.Add(rv);
                }

                // assignment under a branch is tainted by all the variables in the branch's conditional
                if (dominatedBy.Keys.Contains(currBlock))
                    foreach (var dominator in dominatedBy[currBlock])
                        foreach (var v in branchCondVars[dominator]) {
                            taintSet.Add(v);
                            taintSet.UnionWith(state[v]);
                        }

                state[left] = taintSet;
                AssignAndPropagate(node,currBlock,state);
                return node;
            }

            private void AssignAndPropagate(Absy node, Block currBlock, Dependencies state)
            {
                // if the new state for the node is different, add all succesors to the worklist
                if (!dependencies.ContainsKey(node))
                    dependencies[node] = state;
                else if (!dependencies[node].JoinWith(state))
                    return;

                Absy cmd;
                if (node is Cmd)
                {
                    int index = currBlock.Cmds.IndexOf((Cmd)node);
                    if (index < currBlock.Cmds.Count - 1)
                        cmd = currBlock.Cmds[index + 1];
                    else
                        cmd = currBlock.TransferCmd;
                    workList.Add(cmd);
                    cmdToBlock[cmd] = currBlock;
                }
                else if (node is GotoCmd)
                {
                    foreach (var succ in ((GotoCmd)node).labelTargets)
                    {
                        cmd = succ.Cmds[0];
                        workList.Add(cmd);
                        cmdToBlock[cmd] = succ;
                    }
                }
            }
            private Dependencies GatherPredecessorState(Cmd node, Block currBlock)
            {
                Dependencies state;
                int index = currBlock.Cmds.IndexOf(node);
                if (index == 0)
                {
                    state = new Dependencies();
                    foreach (var pred in currBlock.Predecessors)
                        if (dependencies.ContainsKey(pred.Cmds.Last()))
                        {
                            var predState = dependencies[pred.Cmds.Last()];
                            state.JoinWith(predState);
                        }
                }
                else
                {
                    state = new Dependencies(dependencies[currBlock.Cmds[index - 1]]);
                }
                return state;
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
                        if (dependencies.ContainsKey(dependentOn))
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
                // TODO: for external stubs this won't hold
                Debug.Assert(procDependencies.Keys.Contains(node.Proc)); // the callee was previously analyzed
                Block currBlock = cmdToBlock[node];
                Dependencies state = GatherPredecessorState(node, currBlock);

                if (node.Proc == currentProc) // recursion
                {
                    Debug.Assert(false);
                }

                Debug.Assert(node.Outs.Count == node.Outs.Distinct().Count()); // only allow one output for now

                // first, for f(e1,...,ek) find the dependency set of each e_i
                var inputExpressionsDependency = new List<HashSet<Variable>>();
                foreach (var inExpr in node.Ins)
	            {
		            var varExtractor = new VariableExtractor();
                    varExtractor.Visit(inExpr);
                    inputExpressionsDependency.Add(new HashSet<Variable>());
                    var current = inputExpressionsDependency.Count - 1;
                    foreach (var v in varExtractor.vars)
                    {
                        inputExpressionsDependency[current].Add(v);
                        if (state.Keys.Contains(v))
                            inputExpressionsDependency[current].UnionWith(state[v]);
                    }
	            }

                var calleeDependencies = procDependencies[node.Proc];
                // handle outputs affected by the call
                for (int i = 0; i < node.Proc.OutParams.Count; ++i)
                {
                    var formalOutput = node.Proc.OutParams[i];
                    if (!calleeDependencies.Keys.Contains(formalOutput))
                        continue;
                    
                    var inferedOutputDependency = InferCalleeOutputDependancy(node,formalOutput,state,inputExpressionsDependency);
                    var actualOutput = node.Outs[i].Decl;
                    state[actualOutput] = inferedOutputDependency;
                }

                // handle globals affected by the call
                foreach (var g in calleeDependencies.Keys)
                {
                    if (!(g is GlobalVariable))
                        continue;
                    var inferedOutputDependency = InferCalleeOutputDependancy(node,g,state,inputExpressionsDependency);
                    state[g] = inferedOutputDependency;
                }

                AssignAndPropagate(node, currBlock, state);
                return node;
            }


            public Cmd VisitCmd(Cmd node)
            {
                Block currBlock = cmdToBlock[node];
                Dependencies state = GatherPredecessorState(node, currBlock);
                AssignAndPropagate(node, currBlock, state);
                return node;
            }
            public override Cmd VisitAssumeCmd(AssumeCmd node)
            {
                return VisitCmd(node);
            }
            public override Cmd VisitAssertCmd(AssertCmd node)
            {
                return VisitCmd(node);
            }
            public override ReturnCmd VisitReturnCmd(ReturnCmd node)
            {
                Block currBlock = cmdToBlock[node];
                var state = new Dependencies(dependencies[currBlock.Cmds.Last()]);
                if (!dependencies.ContainsKey(node))
                {
                    dependencies[node] = state;
                }
                else
                {
                    dependencies[node].JoinWith(state);
                }
                //if (dependencies[node].JoinWith(state))
                //{
                //    foreach (var succ in blockGraph.Successors(currBlock))
                //    {
                //        workList.Add(succ.Cmds[0]);
                //        cmdToBlock[succ.Cmds[0]] = succ;
                //    }
                //}
                // set the result for the procedure
                procDependencies[currentProc] = dependencies[node];
                return node;
            }

        }

        public class VariableExtractor : StandardVisitor
        {
            public HashSet<Variable> vars = new HashSet<Variable>();
            public override Variable VisitVariable(Variable node)
            {
                vars.Add(node);
                return node;
            }
        }


        // Reps, Horwitz abd Sagiv: Precise Interprocedural Dataflow Analysis via Graph Reachability
        public class TaintFactoid
        {
            public Variable Src { get; set; }
            public Variable Dst { get; set; }
            public Absy Node { get; set; } // the node associated with the factoid
        }
        public class Tabulation
        {
            Program program;
            Cmd Smain;
            // TODO:
            // graph is a transformed block graph where B1 { c1_1, ... , c1_transfer } -> B2 { c2_1, ... , c2_transfer }
            // is c1_1 -> c1_2 ... c1_transfer -> c2_1 ... 
            Graph<Absy> graph;
            Dictionary<Absy, HashSet<TaintFactoid>> state;
            HashSet<Tuple<TaintFactoid, TaintFactoid>> pathEdge, workList, summaryEdge;
            Dictionary<Procedure, Implementation> procedures;
            Dictionary<Expr, HashSet<Variable>> extractedVars; // TODO: optimization

            // TODO: state was loaded with S_main -> { (In_1,In_1) , ... , (In_k,In_k) }
            public void Tabulate()
            {
                throw new NotImplementedException();
                // sanity check
                Debug.Assert(procedures.First().Value.LocVars.Count > 1);
                Variable v1 = procedures.First().Value.LocVars[0];
                Variable v2 = procedures.First().Value.LocVars[1];
                TaintFactoid f1 = new TaintFactoid();
                TaintFactoid f2 = new TaintFactoid();
                TaintFactoid f3 = new TaintFactoid();
                TaintFactoid f4 = new TaintFactoid();
                f1.Dst = v1; f1.Src = v2; f1.Node = graph.Nodes.First();
                f3.Dst = v1; f3.Src = v2; f3.Node = graph.Nodes.First();
                Debug.Assert(f1 == f3);
                Tuple<TaintFactoid, TaintFactoid> t1 = new Tuple<TaintFactoid, TaintFactoid>(f1, f3);
                Tuple<TaintFactoid, TaintFactoid> t2 = new Tuple<TaintFactoid, TaintFactoid>(f3, f1);
                Debug.Assert(t1 == t2);

                foreach (var node in graph.Nodes)
                {
                    state[node] = new HashSet<TaintFactoid>();
                }
                foreach (var f in state[Smain])
                {
                    workList.Add(new Tuple<TaintFactoid, TaintFactoid>(f, f));
                    pathEdge.Add(new Tuple<TaintFactoid, TaintFactoid>(f, f));
                }
                ForwardTabulate();
            }

            private void ForwardTabulate()
            {
                while (workList.Count > 0)
                {
                    var edge = workList.First();
                    workList.Remove(edge);
                    var n = edge.Item2.Node;
                    if (n is CallCmd)
                    {
                        CallTransformer((CallCmd)edge.Item2.Node);
                    }
                    else if (n is ReturnCmd)
                    {

                    }
                    else
                    {
                        if (n is AssignCmd)
                        {
                            AssignTransformer(edge.Item2);
                        }
                        else if (n is GotoCmd)
                        {

                        }
                    }
                }
            }

            private void CallTransformer(CallCmd node)
            {
                // the transformer for a call simply emits all the taint factoid of the caller
                // to the callee, with the proper renaming i.e. if f(int a) was called with f(x)
                // then every taint factoid T(x,v) at the callsite will appear as T(a,v) at function entry
                foreach (var f in state[node])
                {
                    for (int i = 0; i < node.Ins.Count; ++i)
                    {
                        var actual = node.Ins[i];
                        var varExtractor = new VariableExtractor();
                        varExtractor.Visit(actual);
                        if (varExtractor.vars.Contains(f.Dst)) // current input contains a tainted variable
                        {
                            var nf = new TaintFactoid();
                            nf.Node = procedures[node.Proc].Blocks[0].Cmds[0];
                            nf.Src = f.Src;
                            nf.Dst = node.Proc.InParams[i]; // replace the actual with the formal
                            state[nf.Node].Add(nf);
                            Propagate(nf, nf);
                            //if (summaryEdge.Contains)
                            //{
                            //}
                        }
                    }
                }
            }

            private void AssignTransformer(TaintFactoid factoid)
            {
                AssignCmd node = (AssignCmd)factoid.Node;
                Console.WriteLine("Visiting " + node);
                Debug.Assert(node.Lhss.Count == 1 && node.Rhss.Count == 1);
                Expr lhs = node.Lhss[0].AsExpr, rhs = node.Rhss[0];
                var varExtractor = new VariableExtractor();
                varExtractor.Visit(lhs);
                Variable left = varExtractor.vars.Single(x => true);

                varExtractor.vars = new HashSet<Variable>();
                varExtractor.Visit(rhs);
                var rhsVars = varExtractor.vars;

                // we know Dst is tained by Src
                if (rhsVars.Contains(factoid.Dst) ||  // RHS contains Dst so LHS is also tained by Src
                    left == factoid.Dst)              // factoid is not involved in the assignment
                {
                    foreach (var succ in graph.Successors(node))
                    { // foreach succesor of the node
                        TaintFactoid sf = new TaintFactoid();
                        sf.Node = succ;
                        sf.Src = factoid.Src;
                        sf.Dst = left;
                        Propagate(factoid, sf);
                    }
                }

            }

            private void Propagate(TaintFactoid from, TaintFactoid to)
            {
                state[to.Node].Add(to);
                var edge = new Tuple<TaintFactoid, TaintFactoid>(from, to);
                if (!pathEdge.Contains(edge))
                {
                    pathEdge.Add(edge);
                    workList.Add(edge);
                }

            }
        }
    }
}
