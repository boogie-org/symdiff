using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Boogie;
using Microsoft.Boogie.GraphUtil;
using System.Diagnostics;

namespace Dependency
{

    public class RefineDependencyWL
    {
        private string filename;
        private Program program;

        private Graph<Procedure> callGraph;

        private Dictionary<Procedure, Dependencies> lowerBoundProcDependencies;
        private Dictionary<Procedure, Dependencies> upperBoundProcDependencies;
        public Dictionary<Procedure, Dependencies> ProcDependencies;

        private int stackBound;

        public RefineDependencyWL(string filename, Program program, Dictionary<Procedure, Dependencies> lowerBoundProcDependencies, Dictionary<Procedure, Dependencies> upperBoundProcDependencies, int stackBound)
        {
            this.filename = filename;
            this.program = program;
            this.lowerBoundProcDependencies = lowerBoundProcDependencies;
            this.upperBoundProcDependencies = upperBoundProcDependencies;
            this.ProcDependencies = new Dictionary<Procedure, Dependencies>();
            this.stackBound = stackBound;
            this.callGraph = Utils.CallGraphHelper.ComputeCallGraph(program);
        }

        public void RunFixedPoint()
        {
            var worklist = new List<Procedure>();
            Utils.CallGraphHelper.BFS(callGraph).Iter(l => worklist.AddRange(l.Value));

            while (worklist.Count > 0)
            {
                var proc = worklist.Last();
                worklist.Remove(proc);

                Debug.Assert(upperBoundProcDependencies[proc].Keys.All(v => proc.InParams.Contains(v) || proc.OutParams.Contains(v) || v is GlobalVariable));
                Debug.Assert(upperBoundProcDependencies[proc].Values.All(d => d.All(v => proc.InParams.Contains(v) || proc.OutParams.Contains(v) || v is GlobalVariable)));
                Debug.Assert(lowerBoundProcDependencies[proc].Keys.All(v => proc.InParams.Contains(v) || proc.OutParams.Contains(v) || v is GlobalVariable));
                Debug.Assert(lowerBoundProcDependencies[proc].Values.All(d => d.All(v => proc.InParams.Contains(v) || proc.OutParams.Contains(v) || v is GlobalVariable)));

                var impl = program.Implementations().SingleOrDefault(i => i.Name == proc.Name);
                if (impl == null)
                    continue;

                var newProg = Utils.CrossProgramUtils.ReplicateProgram(program, filename);
                // resolve dependencies, callGraph, impl, etc from program -> newProg
                RefineDependencyPerImplementation rdpi = new RefineDependencyPerImplementation(newProg,
                    (Implementation)Utils.CrossProgramUtils.ResolveTopLevelDeclsAcrossPrograms(impl, program, newProg),
                    Utils.CrossProgramUtils.ResolveDependenciesAcrossPrograms(upperBoundProcDependencies, program, newProg),
                    Utils.CrossProgramUtils.ResolveDependenciesAcrossPrograms(lowerBoundProcDependencies, program, newProg),
                    stackBound,
                    Utils.CallGraphHelper.ComputeCallGraph(newProg));

                ProcDependencies[proc] = Utils.CrossProgramUtils.ResolveDependenciesAcrossPrograms(rdpi.Run(), newProg, program)[proc];

                Debug.Assert(ProcDependencies[proc].Keys.All(v => proc.InParams.Contains(v) || proc.OutParams.Contains(v) || v is GlobalVariable));
                Debug.Assert(ProcDependencies[proc].Values.All(d => d.All(v => proc.InParams.Contains(v) || proc.OutParams.Contains(v) || v is GlobalVariable)));

                // if the dependencies are different (hopefully lower :) than the upper bound, add all callers
                if (!(ProcDependencies[proc].Equals(upperBoundProcDependencies[proc])))
                {
                    worklist.AddRange(callGraph.Predecessors(proc));
                    upperBoundProcDependencies[proc] = ProcDependencies[proc];
                }

            }
        }

    }

    public class DependencyVisitor : StandardVisitor
    {
        private string filename;
        private Program program;

        private Graph<Procedure> callGraph;
        private Dictionary<Absy, Implementation> nodeToImpl;

        public Dictionary<Procedure, Dependencies> ProcDependencies = new Dictionary<Procedure, Dependencies>();

        private Dictionary<Procedure, HashSet<CallCmd>> procCallers = new Dictionary<Procedure, HashSet<CallCmd>>();
        private Dictionary<Block, HashSet<Block>> dominatedBy = new Dictionary<Block, HashSet<Block>>();

        private Dictionary<Block, HashSet<Variable>> branchCondVars = new Dictionary<Block, HashSet<Variable>>(); // a mapping: branching Block -> { Variables in the branch conditional }
        public WorkList<Dependencies> worklist;

        private bool dataOnly;
        private bool detStubs;

        public DependencyVisitor(string filename, Program program, bool dataOnly = false, bool detStubs = false)
        {
            this.filename = filename;
            this.program = program;
            this.dataOnly = dataOnly;
            this.detStubs = detStubs;
            this.nodeToImpl = Utils.ComputeNodeToImpl(program);
            this.callGraph = Utils.CallGraphHelper.ComputeCallGraph(program);
            this.worklist = new WorkList<Dependencies>(procCallers);
        }

        public override Program VisitProgram(Program node)
        {
            foreach (var impl in program.Implementations())
            {
                if (!ProcDependencies.ContainsKey(impl.Proc)) // the proc may have been visited already through a caller
                    Visit(impl);
            }
            return node;
        }

        public override Implementation VisitImplementation(Implementation node)
        {
            node.ComputePredecessorsForBlocks();
            Utils.ComputeDominators(program, node, dominatedBy);

            worklist.RunFixedPoint(this, node);
            Console.WriteLine("Analyzed " + node + "( ).");
            return node;
        }

        public override Cmd VisitHavocCmd(HavocCmd node)
        {
            Block currBlock = worklist.cmdBlocks[node];
            Dependencies dependencies = worklist.GatherPredecessorsState(node, currBlock);

            // Havoc x translates to x <- *
            foreach (var v in node.Vars.Select(x => x.Decl))
            {
                dependencies[v] = new HashSet<Variable>();
                dependencies[v].Add(Utils.VariableUtils.NonDetVar);

                InferDominatorDependency(currBlock, dependencies[v], v);
            }

            if (worklist.Assign(node, dependencies))
                worklist.Propagate(node);
            return node;
        }

        public override GotoCmd VisitGotoCmd(GotoCmd node)
        {
            Block currBlock = worklist.cmdBlocks[node];
            Dependencies dependencies = worklist.GatherPredecessorsState(node, currBlock);

            var succs = node.labelTargets;
            if (succs.Count > 1)
            { // here we create branchCondVars
                if (!branchCondVars.ContainsKey(currBlock))
                    branchCondVars[currBlock] = new HashSet<Variable>();
                foreach (var succ in succs)
                {
                    AssumeCmd cmd = (AssumeCmd)succ.Cmds[0];
                    var varExtractor = new Utils.VariableUtils.VariableExtractor();
                    varExtractor.Visit(cmd.Expr);
                    branchCondVars[currBlock].UnionWith(varExtractor.vars);
                }
            }

            if (worklist.Assign(node, dependencies))
                worklist.Propagate(node);
            return node;
        }
        public override Cmd VisitAssignCmd(AssignCmd node)
        {
            // gather state from all predecesors
            Block currBlock = worklist.cmdBlocks[node];
            Dependencies dependencies = worklist.GatherPredecessorsState(node, currBlock);

            // for assignment v1,...,vn = e1,...,en handle each vi = ei separately
            for (int i = 0; i < node.Lhss.Count; ++i)
            {
                Expr lhs = node.Lhss[i].AsExpr, rhs = node.Rhss[i];
                var varExtractor = new Utils.VariableUtils.VariableExtractor();
                varExtractor.Visit(lhs);
                Variable left = varExtractor.vars.First(); // TODO: stuff like: Mem_T.INT4[in_prio] := out_tempBoogie0

                varExtractor = new Utils.VariableUtils.VariableExtractor();
                varExtractor.Visit(rhs);
                var rhsVars = varExtractor.vars;

                var dependsSet = new HashSet<Variable>();

                foreach (var rv in rhsVars)
                {
                    dependsSet.Add(rv);

                    if (dependencies.ContainsKey(rv)) // a variable in rhs has dependencies
                        dependsSet.UnionWith(dependencies[rv]);
                }

                InferDominatorDependency(currBlock, dependsSet, left);

                dependencies[left] = dependsSet;
            }

            if (worklist.Assign(node, dependencies))
                worklist.Propagate(node);
            return node;
        }

        private void InferDominatorDependency(Block currBlock, HashSet<Variable> dependsSet, Variable left)
        {
            if (dataOnly)
                return;
            // assignment under a branch is dependent on all the variables in the branch's conditional
            if (dominatedBy.Keys.Contains(currBlock))
                foreach (var dominator in dominatedBy[currBlock])
                    if (branchCondVars.ContainsKey(dominator))
                        foreach (var v in branchCondVars[dominator])
                        {
                            dependsSet.Add(v);
                            // it is also dependends on all that v depends on *at the point of branching*
                            if (worklist.stateSpace.ContainsKey(dominator.TransferCmd))
                            {
                                var domDep = worklist.stateSpace[dominator.TransferCmd];
                                if (domDep.ContainsKey(v))
                                    dependsSet.UnionWith(domDep[v]);
                            }
                        }
        }


        private HashSet<Variable> InferCalleeOutputDependancy(CallCmd cmd, Variable output, Dependencies state, List<HashSet<Variable>> inputExpressionsDependency)
        {
            var outputDependency = ProcDependencies[cmd.Proc][output]; // output is dependent on a set of formals and globals
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
            Block currBlock = worklist.cmdBlocks[node];
            Dependencies dependencies = worklist.GatherPredecessorsState(node, currBlock);

            // an external stub
            if (program.Implementations().Where(x => x.Proc == callee).Count() == 0)
            {
                ProcDependencies[callee] = new Dependencies();
                foreach (var v in callee.OutParams)
                {   // all outputs depend on all inputs
                    ProcDependencies[callee][v] = new HashSet<Variable>(callee.InParams);
                    if (!detStubs)
                        ProcDependencies[callee][v].Add(Utils.VariableUtils.NonDetVar); // and on *
                }
            }

            if (!ProcDependencies.ContainsKey(callee))
            { // this will be continued once the callee gets analyzed
                dependencies = new Dependencies();
                if (worklist.Assign(node, dependencies))
                    worklist.Propagate(node);
                return node;
            }

            var calleeDependencies = ProcDependencies[callee];

            // first, for f(e1,...,ek) find the dependency set of each ei
            var inputExpressionsDependency = new List<HashSet<Variable>>();
            foreach (var inExpr in node.Ins)
            {
                var varExtractor = new Utils.VariableUtils.VariableExtractor();
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
                var inferedOutputDependency = InferCalleeOutputDependancy(node, formalOutput, dependencies, inputExpressionsDependency);
                var actualOutput = node.Outs[i].Decl;
                dependencies[actualOutput] = inferedOutputDependency;

                InferDominatorDependency(currBlock, dependencies[actualOutput], actualOutput); // conditionals may dominate/taint the return value
            }

            // handle globals affected by the call
            foreach (var g in calleeDependencies.Keys)
            {
                if (!(g is GlobalVariable))
                    continue;
                var inferedOutputDependency = InferCalleeOutputDependancy(node, g, dependencies, inputExpressionsDependency);
                dependencies[g] = inferedOutputDependency;

                InferDominatorDependency(currBlock, dependencies[g], g); // conditionals may dominate/taint the modified globals
            }

            if (worklist.Assign(node, dependencies))
                worklist.Propagate(node);
            return node;
        }

        // this is a simple transformer for a command that has no effect on the state
        public Cmd VisitCmd(Cmd node)
        {
            Block currBlock = worklist.cmdBlocks[node];
            var dependencies = worklist.GatherPredecessorsState(node, currBlock);

            if (worklist.Assign(node, dependencies))
                worklist.Propagate(node);

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
            Block currBlock = worklist.cmdBlocks[node];
            Dependencies dependencies = worklist.GatherPredecessorsState(node, currBlock);
            if (worklist.Assign(node, dependencies))
                worklist.Propagate(node,nodeToImpl[node].Proc);
            var proc = nodeToImpl[node].Proc;
            // set the dependencies result for the procedure
            if (!ProcDependencies.ContainsKey(proc))
                ProcDependencies[proc] = new Dependencies();
            ProcDependencies[proc].JoinWith(worklist.stateSpace[node]);
            ProcDependencies[proc].FixFormals(nodeToImpl[node]);

            return node;
        }

        // TODO: this should not exist
        public void Results(bool prune, bool printStats)
        {
            if (prune)
                Utils.DependenciesUtils.PruneProcDependencies(program, ProcDependencies);
            foreach (Implementation impl in program.Implementations())
            {
                var proc = impl.Proc;
                Analysis.PopulateDependencyLog(impl, ProcDependencies[proc], dataOnly ? "Data Only" : "Data and Control");
                if (printStats) // TODO: move to main
                    Analysis.PopulateStatsLog(impl, ProcDependencies[proc]);
            }
        }
    }
}
