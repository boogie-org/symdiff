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
        static int Main(string[] args)
        {
            if (args.Length != 1)
            {
                Usage();
                return -1;
            }

            CommandLineOptions.Install(new CommandLineOptions());

            return RunAnalysis(args[0]);
        }

        private static int RunAnalysis(string filename)
        {

            Console.WriteLine("Processing file {0}", filename);
            if (!Utils.ParseProgram(filename, out program)) return -1;

            // collect Modifies for all procedures
            ModSetCollector c = new ModSetCollector();
            c.DoModSetAnalysis(program);

            List<Declaration> declarations = program.TopLevelDeclarations;


            var implementations = new List<Declaration>(program.TopLevelDeclarations.Where(x => x is Implementation));
            foreach (Implementation impl in implementations)
            {
                Console.WriteLine("Found implementation: {0}", impl.ToString());
                var visitor = new DependencyVisitor();
                visitor.Visit(impl);
                procDependencies[impl.Proc].Print();
                Console.WriteLine();
            }

            System.Console.WriteLine("Done.");

            return 0;
        }

        private static void Usage()
        {
            string execName = System.Diagnostics.Process.GetCurrentProcess().MainModule.ModuleName;
            Console.WriteLine("Lightweight inter-procedural dependency analysis for change impact");
            Console.WriteLine("Usage: " + execName + " <filename.bpl>");
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
            
            public List<Variable> inputs;
            // Command -> ( Var -> { Var } )
            public Dictionary<Absy, Dependencies> dependencies = new Dictionary<Absy,Dependencies>();
            public Dictionary<Block, HashSet<Block>> dominates = new Dictionary<Block, HashSet<Block>>();
            public Dictionary<Block, HashSet<Block>> dominatedBy = new Dictionary<Block, HashSet<Block>>();
            // a mapping: branching Block -> { Variables in the branch conditional }
            private Dictionary<Block, HashSet<Variable>> branchCondVars = new Dictionary<Block,HashSet<Variable>>();
            private Graph<Block> blockGraph;
            private List<Absy> workList;
            private Dictionary<Absy, Block> cmdToBlock;
            private Procedure currentProc;
            private Implementation currentImpl;
            private List<CallCmd> recursionPoints;

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

            public override Implementation VisitImplementation(Implementation node)
            {
                node.ComputePredecessorsForBlocks();
                ComputeDominators(node);
                inputs = node.InParams;
                currentImpl = node;
                currentProc = node.Proc;
                cmdToBlock = new Dictionary<Absy, Block>();
                recursionPoints = new List<CallCmd>();

                // do a fixed point computation
                workList = new List<Absy>();
                workList.Add(node.Blocks[0].Cmds[0]);
                cmdToBlock[node.Blocks[0].Cmds[0]] = node.Blocks[0];
                while (workList.Count > 0)
                {
                    var cmd = workList[0];
                    workList.RemoveAt(0);
#if DBG
                    Console.WriteLine("Visiting L" + cmd.Line + ": " + cmd);
#endif
                    Visit(cmd);
#if DBG
                    if (dependencies.ContainsKey(cmd))
                        dependencies[cmd].Print();
                    Console.ReadLine();
#endif
                }

                procDependencies[currentProc] = PruneDependencies(node, procDependencies[currentProc]);
#if DBGRES
                Console.WriteLine("Result: ");
                procDependencies[currentProc].Print();
                Console.ReadLine();
#endif
                return node;
            }

            private Dependencies PruneDependencies(Implementation impl, Dependencies deps)
            {
                var outDependancies = new Dependencies();
                foreach (var dependency in deps)
                {
                    var v = dependency.Key;
                    // fix the dependencies such that instead of the Implementation inputs\outputs
                    // it will adhere to the Procedure inputs\outputs
                    if (v is GlobalVariable || impl.OutParams.Contains(v))
                        outDependancies.Add(ImplOutputToProcOutput(impl, v), ImplInputsToProcInputs(impl, dependency.Value));
                }
                return outDependancies;
            }

            public override Cmd VisitHavocCmd(HavocCmd node)
            {
                Block currBlock = cmdToBlock[node];
                // get the state from the previous command
                var state = GatherPredecessorsState(node, currBlock);
                // Havoc x translates to x <- *
                foreach (var v in node.Vars)
	            {
                    state[v.Decl] = new HashSet<Variable>();
                    state[v.Decl].Add(nonDetVar);
                    InferDominatorDependency(currBlock, state[v.Decl]);
	            }
                AssignAndPropagate(node, currBlock, state);
                return node;
            }

            public override GotoCmd VisitGotoCmd(GotoCmd node)
            {
                Block currBlock = cmdToBlock[node];
                // get the state from the previous command
                var state = GatherPredecessorsState(node, currBlock);
                //state.JoinWith(dependencies[currBlock.Cmds.Last()]);
                var succs = node.labelTargets;
                if (succs.Count > 1)
                { // here we create branchCondVars
                    foreach (var succ in succs)
                    {
                        Debug.Assert(succ.Cmds[0] is AssumeCmd);
                        AssumeCmd cmd = (AssumeCmd)succ.Cmds[0];
                        var varExtractor = new Utils.VariableExtractor();
                        varExtractor.Visit(cmd.Expr);
                        branchCondVars[currBlock] = varExtractor.vars;
                    }
                    // branchCondVars changed, add all dominated to worklist
                    //foreach (var dominated in dominates.Values)
                    //    foreach (var b in dominated)
                    //        if (b.Cmds.Count > 0)
                    //            workList.Add(b.Cmds[0]);
                    //        else
                    //            workList.Add(b.TransferCmd);
                }
                
                // put the goto destinations in the worklist
                AssignAndPropagate(node, currBlock, state);
                return node;
            }
            public override Cmd VisitAssignCmd(AssignCmd node)
            {
                // gather state from all predecesors
                Block currBlock = cmdToBlock[node];
                Dependencies state = GatherPredecessorsState(node, currBlock);

                //Debug.Assert(node.Lhss.Count == 1 && node.Rhss.Count == 1);
                Expr lhs = node.Lhss[0].AsExpr, rhs = node.Rhss[0];
                var varExtractor = new Utils.VariableExtractor();
                varExtractor.Visit(lhs);

                Variable left = varExtractor.vars.Single(x => true);
                var dependsSet = new HashSet<Variable>();

                varExtractor.vars = new HashSet<Variable>();
                varExtractor.Visit(rhs);
                var rhsVars = varExtractor.vars;

                foreach (var rv in rhsVars)
                {
                    dependsSet.Add(rv);

                    if (state.ContainsKey(rv)) // a variable in rhs has dependencies
                        dependsSet.UnionWith(state[rv]);
                }

                InferDominatorDependency(currBlock, dependsSet);

                state[left] = dependsSet;
                AssignAndPropagate(node,currBlock,state);
                return node;
            }

            private void InferDominatorDependency(Block currBlock, HashSet<Variable> dependsSet)
            {
                // assignment under a branch is dependent on all the variables in the branch's conditional
                if (dominatedBy.Keys.Contains(currBlock))
                    foreach (var dominator in dominatedBy[currBlock])
                        if (branchCondVars.ContainsKey(dominator))
                            foreach (var v in branchCondVars[dominator])
                            {
                                dependsSet.Add(v);
                                // it is also dependends on all that v depends on *at the point of branching*
                                if (dependencies.ContainsKey(dominator.TransferCmd))
                                {
                                    var domDep = dependencies[dominator.TransferCmd];
                                    if (domDep.ContainsKey(v))
                                        dependsSet.UnionWith(domDep[v]);
                                }
                            }
            }

            // returns whether a propagation occured
            private bool AssignAndPropagate(Absy node, Block nodeBlock, Dependencies state)
            {
                // if the new state for the node is different, add all succesors to the worklist
                if (!dependencies.ContainsKey(node))
                    dependencies[node] = state;
                else if (!dependencies[node].JoinWith(state))
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
                    cmdToBlock[cmd] = nodeBlock;
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
                        cmdToBlock[cmd] = succ;
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
            private Dependencies GatherPredecessorsState(Absy node, Block currBlock)
            {
                Dependencies state = null;
                if (node is Cmd)
                {
                    int index = currBlock.Cmds.IndexOf((Cmd)node);
                    state = (index == 0) ? GatherBlockPredecessorsState(currBlock, state):
                                           new Dependencies(dependencies[currBlock.Cmds[index - 1]]);
                }
                else if (node is TransferCmd)
                    state = (currBlock.Cmds.Count == 0) ? GatherBlockPredecessorsState(currBlock, state):
                                                          new Dependencies(dependencies[currBlock.Cmds.Last()]);
                else
                    throw new ArgumentException("Unknown node type: " + node);
                return state;
            }

            private Dependencies GatherBlockPredecessorsState(Block currBlock, Dependencies state)
            {
                state = new Dependencies();
                foreach (var pred in currBlock.Predecessors)
                {
                    Absy cmd = null;
                    if (pred.Cmds.Count > 0)
                        cmd = pred.Cmds.Last();
                    else
                        cmd = pred.TransferCmd;

                    if (dependencies.ContainsKey(cmd))
                    {
                        var predState = dependencies[cmd];
                        state.JoinWith(predState);
                    }
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
                Block currBlock = cmdToBlock[node];
                Dependencies state = GatherPredecessorsState(node, currBlock);

                // an external stub
                if (!(node.Proc == currentProc || procDependencies.Keys.Contains(node.Proc))) {
                    procDependencies[node.Proc] = new Dependencies();
                    foreach (var v in node.Proc.OutParams)
                    {   // all outputs depend on all inputs
                        procDependencies[node.Proc][v] = new HashSet<Variable>(node.Proc.InParams);
                        // and on *
                        procDependencies[node.Proc][v].Add(nonDetVar);
                    }
                }

                Debug.Assert(node.Outs.Count == node.Outs.Distinct().Count()); // only allow one output for now

                // first, for f(e1,...,ek) find the dependency set of each e_i
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
                        if (state.Keys.Contains(v))
                            inputExpressionsDependency[current].UnionWith(state[v]);
                    }
	            }

                if (node.Proc == currentProc) // recursion
                {
                    recursionPoints.Add(node);
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
                    
                    var inferedOutputDependency = InferCalleeOutputDependancy(node,formalOutput,state,inputExpressionsDependency);
                    var actualOutput = node.Outs[i].Decl;
                    state[actualOutput] = inferedOutputDependency;
                    InferDominatorDependency(currBlock, state[actualOutput]); // conditionals may dominate the return value
                }

                // handle globals affected by the call
                foreach (var g in calleeDependencies.Keys)
                {
                    if (!(g is GlobalVariable))
                        continue;
                    var inferedOutputDependency = InferCalleeOutputDependancy(node,g,state,inputExpressionsDependency);
                    state[g] = inferedOutputDependency;
                    InferDominatorDependency(currBlock, state[g]); // conditionals may dominate the modified globals
                } 

                AssignAndPropagate(node, currBlock, state);
                return node;
            }


            public Cmd VisitCmd(Cmd node)
            {
                Block currBlock = cmdToBlock[node];
                Dependencies state = GatherPredecessorsState(node, currBlock);
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

            // TODO! everying past if(c) return; depends on c
            public override ReturnCmd VisitReturnCmd(ReturnCmd node)
            {
                Block currBlock = cmdToBlock[node];
                var state = GatherPredecessorsState(node,currBlock);
                AssignAndPropagate(node, currBlock, state);
                // set the result for the procedure
                procDependencies[currentProc] = dependencies[node];
                return node;
            }

        }


    }
}
