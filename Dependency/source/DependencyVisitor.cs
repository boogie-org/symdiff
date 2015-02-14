using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
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

         private readonly Dictionary<Procedure, Dependencies> lowerBoundProcDependencies; //never changes
         private readonly Dictionary<Procedure, Dependencies> upperBoundProcDependencies; //never changes
         public Dictionary<Procedure, Dependencies> currDependencies; 
        

        private int stackBound;

        public RefineDependencyWL(string filename, Program program, Dictionary<Procedure, Dependencies> lowerBoundProcDependencies, Dictionary<Procedure, Dependencies> upperBoundProcDependencies, int stackBound)
        {
            this.filename = filename;
            this.program = program;
            this.lowerBoundProcDependencies = lowerBoundProcDependencies;
            this.upperBoundProcDependencies = upperBoundProcDependencies;
            this.stackBound = stackBound;
            this.callGraph = Utils.CallGraphHelper.ComputeCallGraph(program);
            currDependencies = null;

            program.TopLevelDeclarations.OfType<Procedure>().Iter(proc =>
                {
                    if (upperBoundProcDependencies.ContainsKey(proc)) //some unreachable procs such as havoc_Assert are not present in the tables
                    {
                        Debug.Assert(upperBoundProcDependencies[proc].Keys.All(v => proc.InParams.Contains(v) || proc.OutParams.Contains(v) || v is GlobalVariable));
                        Debug.Assert(upperBoundProcDependencies[proc].Values.All(d => d.All(v => proc.InParams.Contains(v) || proc.OutParams.Contains(v) || v is GlobalVariable)));
                        Debug.Assert(lowerBoundProcDependencies[proc].Keys.All(v => proc.InParams.Contains(v) || proc.OutParams.Contains(v) || v is GlobalVariable));
                        Debug.Assert(lowerBoundProcDependencies[proc].Values.All(d => d.All(v => proc.InParams.Contains(v) || proc.OutParams.Contains(v) || v is GlobalVariable)));
                    }
                }
            );
        }

        public void RunFixedPoint(Stopwatch sw)
        {
            var worklist = new List<Procedure>();
            bool acyclic;
            List<Procedure> topSortedProcedures;
            Graph<Procedure> callGraph = Utils.CallGraphHelper.ComputeCallGraph(program);   //constant
            //HACK: lets try with self-recursion (includes loops) removed
            Graph<Procedure> selfLessCg = new Graph<Procedure>();
            callGraph.Edges.Where(e => e.Item1 != e.Item2).Iter(e => selfLessCg.AddEdge(e.Item1, e.Item2));
            selfLessCg.TarjanTopSort(out acyclic, out topSortedProcedures, true);
            if (acyclic)
                worklist.AddRange(topSortedProcedures);
            else
            {
                Console.WriteLine("---------\nMutual recursion exists: the work lists are not optimized\n--------");
                //TODO: Compute SCCs and topSort over SCCs
                worklist.AddRange(Utils.CallGraphHelper.BottomUp(callGraph)); //does this help?
                // worklist.AddRange(program.TopLevelDeclarations.Where(d => d is Procedure).Select(p => p as Procedure));
            }

            //least fixed point, starting with lower-bound
            currDependencies = new Dictionary<Procedure, Dependencies>(lowerBoundProcDependencies); 

            //important note about *
            //We want to remove * from currDependency except for stubs
            currDependencies.Iter(kv =>
                  {
                      //not a stub
                      if (!IsStub(kv.Key))
                      {
                          currDependencies[kv.Key].Iter
                              (v => currDependencies[kv.Key][v.Key].Remove(Utils.VariableUtils.NonDetVar));
                      }
                  }
                );

            while (worklist.Count > 0)
            {
                //the insertions into the Worklist also has to be sorted topologically
                //TODO: handle the case for general recursion
                if (topSortedProcedures.Count() > 0) //HACK!: we had a sorted list
                {
                    worklist = topSortedProcedures.Where(x => worklist.Contains(x)).ToList();
                }
                var proc = worklist.Last(); //why last?
                worklist.Remove(proc);

                var impl = program.Implementations.SingleOrDefault(i => i.Name == proc.Name);
                if (impl == null)
                    continue;
                Utils.LogStopwatch(sw, string.Format("Analyzing Procedure {0}", proc.Name), Analysis.Timeout);

                var newProg = Utils.CrossProgramUtils.ReplicateProgram(program, filename);
                // resolve dependencies, callGraph, impl, etc from program -> newProg
                RefineDependencyPerImplementation rdpi = new RefineDependencyPerImplementation(newProg,
                    (Implementation)Utils.CrossProgramUtils.ResolveTopLevelDeclsAcrossPrograms(impl, program, newProg),
                    Utils.CrossProgramUtils.ResolveDependenciesAcrossPrograms(upperBoundProcDependencies, program, newProg),
                    Utils.CrossProgramUtils.ResolveDependenciesAcrossPrograms(currDependencies, program, newProg),
                    stackBound,
                    Utils.CallGraphHelper.ComputeCallGraph(newProg));
                var tmp = Utils.CrossProgramUtils.ResolveDependenciesAcrossPrograms(rdpi.Run(), newProg, program)[proc];

                Debug.Assert(tmp.Keys.All(v => proc.InParams.Contains(v) || proc.OutParams.Contains(v) || v is GlobalVariable));
                Debug.Assert(tmp.Values.All(d => d.All(v => proc.InParams.Contains(v) || proc.OutParams.Contains(v) || v is GlobalVariable)));

                // the lower bound has changed, update the dependencies and add callers to WL
                if (!(tmp.Equals(currDependencies[proc])))
                {
                    worklist.AddRange(callGraph.Predecessors(proc));
                    currDependencies[proc] = tmp;
                }

            }
        }

        private bool IsStub(Procedure proc)
        {
            return program.Implementations.Where(x => x.Proc == proc).Count() == 0;
        }

    }

    public class DependencyVisitor : StandardVisitor
    {
        private string filename;
        private Program program;

        private Graph<Procedure> callGraph;
        private Dictionary<Absy, Implementation> nodeToImpl;

        public Dictionary<Procedure, Dependencies> ProcDependencies;

        private Dictionary<Block, HashSet<Block>> dominatedBy;
        public Dictionary<Block, VarSet> branchCondVars; // a mapping: branching Block -> { Variables in the branch conditional }
        public WorkList<Dependencies> worklist;

        private Dictionary<Procedure, Dependencies> procEntryTDTaint;
        private Dictionary<Procedure, Dependencies> procExitTDTaint;
        private HashSet<Procedure> changedProcs;
        private HashSet<Block> changedBlocks;

        private bool prune;
        private bool taintOnly;
        private bool dataOnly;
        private bool detStubs;

        private int timeOut;
        public DependencyVisitor(string filename, Program program, List<Tuple<string,string,int>> changeLog, int timeOut, bool prune = true, bool dataOnly = false, bool detStubs = false)
        {
            this.filename = filename;
            this.program = program;

            this.callGraph = Utils.CallGraphHelper.ComputeCallGraph(program);
            this.nodeToImpl = Utils.ComputeNodeToImpl(program);

            this.ProcDependencies = new Dictionary<Procedure, Dependencies>();

            this.dominatedBy = new Dictionary<Block, HashSet<Block>>();
            this.branchCondVars = new Dictionary<Block, VarSet>();

            this.worklist = new WorkList<Dependencies>();

            this.procEntryTDTaint = new Dictionary<Procedure, Dependencies>();
            this.procExitTDTaint = new Dictionary<Procedure, Dependencies>();
            // populate changedProcs,changedBlock from changedLines
            this.changedBlocks = Utils.ComputeChangedBlocks(program, changeLog);
            this.changedProcs = Utils.ComputeChangedProcs(program, changeLog);

            this.prune = prune;
            this.dataOnly = dataOnly;
            this.detStubs = detStubs;
            this.taintOnly = false;

            this.timeOut = timeOut * 1000; // change to ms
        }

        public override Program VisitProgram(Program node)
        {
            //Console.WriteLine("Starting...");
            //Console.ReadLine();
            var orderedSCCs = Utils.CallGraphHelper.ComputeOrderedSCCs(callGraph);
            orderedSCCs.Reverse();
            int numVisited = 0;
            ProcReadSetVisitor rsv = new ProcReadSetVisitor();
            foreach (var scc in orderedSCCs)
            {
                foreach (var proc in scc)
                {
                    var impl = node.Implementations.FirstOrDefault(i => i.Proc == proc);
                    if (impl == null)
                        continue;
                    //Console.Write("Visiting: {0} ({1}/{2}) [{3} cmds, {4} vars]", impl.Name, ++numVisited, program.Implementations.Count(), impl.Blocks.Sum(b => b.Cmds.Count + 1), impl.LocVars.Count);
                    Stopwatch s = Stopwatch.StartNew();
                    ManualResetEvent wait = new ManualResetEvent(false);
                    Thread work = new Thread(new ThreadStart(() => { Visit(impl); wait.Set(); }));
                    work.Start();
                    Boolean signal = wait.WaitOne(timeOut);
                    s.Stop();
                    if (!signal)
                    {
                        work.Abort();
                        Console.WriteLine("Aborted due to timeout. Reverting to readSet");

                        // the worklist alg was interrupted, clear the worklist to be safe
                        worklist.workList.Clear();
                        worklist.stateSpace.Clear();
                        GC.Collect();

                        // compute the read set instead
                        rsv.currentProc = impl.Proc;
                        rsv.Visit(impl);

                        // turn it to dependencies (\forall r \in ReadSet: r <- ReadSet)
                        ProcDependencies[impl.Proc] = new Dependencies();
                        rsv.ProcReadSet[impl.Proc].Iter(r => ProcDependencies[impl.Proc][r] = rsv.ProcReadSet[impl.Proc]);
                        ProcDependencies[impl.Proc].FixFormals(impl);
                    }
                    else
                    {
                        //Console.WriteLine(" {0} s", s.ElapsedMilliseconds / 1000.0);
                        // maintain the readSet (for cases where the analysis is too long and we revert to readset)
                        rsv.ProcReadSet[impl.Proc] = new VarSet();
                        rsv.ProcReadSet[impl.Proc].UnionWith(ProcDependencies[impl.Proc].Keys);
                        ProcDependencies[impl.Proc].Values.Iter(vs => rsv.ProcReadSet[impl.Proc].UnionWith(vs));
                    }
                }
                foreach (var proc in scc)
                {
                    var impl = node.Implementations.FirstOrDefault(i => i.Proc == proc);
                    if (impl == null)
                        continue;
                    Analysis.PopulateTaintLog(impl, Utils.ExtractTaint(this));
                }
                
                worklist.stateSpace.Clear();
                if (numVisited % 25 == 0)
                    GC.Collect();
            }

            // Removed. Printing directly to screen can be too huge.
            //ProcDependencies.Iter(pd => Console.Out.WriteLine(pd.Key + " : " + pd.Value));

            //node.Implementations.Iter(impl => Visit(impl));

            // compute top down taint
            orderedSCCs.Reverse();
            foreach (var scc in orderedSCCs)
	        {
                //foreach (var proc in procEntryTDTaint.Keys)
                foreach (var proc in scc)
                {
                    if (!procEntryTDTaint.ContainsKey(proc))
                        continue;
                    var impl = program.Implementations.Single(i => i.Proc == proc);
                    var entry = Utils.GetImplEntry(impl);
                    if (!worklist.stateSpace.ContainsKey(entry))
                        worklist.stateSpace[entry] = new Dependencies();
                    if (worklist.stateSpace[entry].JoinWith(procEntryTDTaint[impl.Proc]))
                    {
                        worklist.Propagate(entry);
                        Visit(impl);
                    }
                }
	        }

            // the top down taint was removed from ProcDependencies so it won't flow up, so add it back in now
            procExitTDTaint.Iter(pd => ProcDependencies[pd.Key].JoinWith(pd.Value));
            return node;
        }

        public override Implementation VisitImplementation(Implementation node)
        {
            node.ComputePredecessorsForBlocks();
            Utils.ComputeDominators(program, node, dominatedBy);

            worklist.RunFixedPoint(this, node);
            //Console.WriteLine("Analyzed " + node + "( ).");
            return node;
        }

        public override Cmd VisitHavocCmd(HavocCmd node)
        {
            Block currBlock = worklist.cmdBlocks[node];
            Dependencies dependencies = worklist.GatherPredecessorsState(node, currBlock);

            // Havoc x translates to x <- *
            foreach (var v in node.Vars.Select(x => x.Decl))
            {
                dependencies[v] = new VarSet();
                dependencies[v].Add(Utils.VariableUtils.NonDetVar);

                InferDominatorDependency(currBlock, dependencies[v]);

                if (changedProcs.Contains(nodeToImpl[node].Proc) || changedBlocks.Contains(currBlock)) // native taint
                    dependencies[v].Add(Utils.VariableUtils.BottomUpTaintVar);
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
                    branchCondVars[currBlock] = new VarSet();

                foreach (var succ in succs.Where(s => s.Cmds.Count > 0 && s.Cmds[0] is AssumeCmd))
                    branchCondVars[currBlock].UnionWith(Utils.VariableUtils.ExtractVars(succ.Cmds[0]));
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
                var lhs = Utils.VariableUtils.ExtractVars(node.Lhss[i]).First(); // stuff like: Mem_T.INT4[x] := y; does not affect x
                var rhsVars = Utils.VariableUtils.ExtractVars(node.Rhss[i]);

                dependencies[lhs] = new VarSet();

                foreach (var rv in rhsVars)
                {
                    dependencies[lhs].Add(rv);

                    if (dependencies.ContainsKey(rv)) // a variable in rhs has dependencies
                        dependencies[lhs].UnionWith(dependencies[rv]);
                }

                InferDominatorDependency(currBlock, dependencies[lhs]);

                if (prune)
                    dependencies[lhs].ExceptWith(nodeToImpl[node].LocVars);

                if (taintOnly)
                    dependencies[lhs].RemoveWhere(v => v != Utils.VariableUtils.BottomUpTaintVar && v != Utils.VariableUtils.TopDownTaintVar);

                if (changedProcs.Contains(nodeToImpl[node].Proc) || changedBlocks.Contains(currBlock)) // native taint
                    dependencies[lhs].Add(Utils.VariableUtils.BottomUpTaintVar);
            }
            
            if (worklist.Assign(node, dependencies))
                worklist.Propagate(node);
            return node;
        }

        public void InferDominatorDependency(Block currBlock, VarSet dependsSet)
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


        private VarSet InferCalleeOutputDependancy(CallCmd cmd, Variable output, Dependencies state, List<VarSet> inputExpressionsDependency)
        {
            var outputDependency = ProcDependencies[cmd.Proc][output]; // output is dependent on a set of formals and globals
            var inferedOutputDependency = new VarSet();
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
            var calleeImpl = program.Implementations.FirstOrDefault(i => i.Proc == callee);
            Block currBlock = worklist.cmdBlocks[node];
            Dependencies dependencies = worklist.GatherPredecessorsState(node, currBlock);

            //TODO: why do we have to deal with callee stubs in the callee command?
            // an external stub
            if (program.Implementations.Where(x => x.Proc == callee).Count() == 0)
            {
                ProcDependencies[callee] = new Dependencies();
                // all outputs+modified depend on all inputs+modified
                var outs = callee.OutParams.Union(callee.Modifies.Select(x => x.Decl));
                foreach (var v in outs)
                {
                    ProcDependencies[callee][v] = new VarSet(callee.InParams.Union(callee.Modifies.Select(x => x.Decl)));
                    if (!detStubs /* || Utils.IsBakedInStub(callee)*/ ) //adding out == func(in) causes inconsistency for functions like malloc/det_choice etc.
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
            bool nativeTaint = changedProcs.Contains(nodeToImpl[node].Proc) || changedBlocks.Contains(currBlock);

            var topDownTaint = new Dependencies();
            if (nativeTaint && calleeImpl != null)
            {// if the line syntactically changed, we assume all of the actuals introduce top-down taint
                foreach (var input in calleeImpl.InParams)
                {
                    topDownTaint[input] = new VarSet();
                    topDownTaint[input].Add(Utils.VariableUtils.TopDownTaintVar);
                }
            }

            // first, for f(e1,...,ek) find the dependency set of each ei
            var inputExpressionsDependency = new List<VarSet>();
            for (int i = 0; i < node.Ins.Count; ++i)
            {
                var inExpr = node.Ins[i];
                inputExpressionsDependency.Add(new VarSet());
                int current = inputExpressionsDependency.Count - 1;
                foreach (var v in Utils.VariableUtils.ExtractVars(inExpr))
                {
                    inputExpressionsDependency[current].Add(v);
                    if (dependencies.Keys.Contains(v))
                    {
                        inputExpressionsDependency[current].UnionWith(dependencies[v]);
                        if (calleeImpl != null && // not a stub
                            Utils.VariableUtils.IsTainted(dependencies[v]))
                        {   // top down taint from input
                            var input = calleeImpl.InParams[i];
                            topDownTaint[input] = new VarSet();
                            topDownTaint[input].Add(Utils.VariableUtils.TopDownTaintVar);
                        }
                    }
                }
            }

            foreach (var g in dependencies.Keys.Where(v => v is GlobalVariable && callee.Modifies.Exists(m => Utils.VariableUtils.ExtractVars(m).Contains(v))))
            {
                if (calleeImpl != null && // not a stub
                    Utils.VariableUtils.IsTainted(dependencies[g]))
                {   // top down taint from global
                    topDownTaint[g] = new VarSet();
                    topDownTaint[g].Add(Utils.VariableUtils.TopDownTaintVar);
                }
            }

            if (calleeImpl != null)
            {
                // propagate tainted inputs\globals to the callsite
                if (!procEntryTDTaint.ContainsKey(callee))
                    procEntryTDTaint[callee] = new Dependencies();
                procEntryTDTaint[callee].JoinWith(topDownTaint);
            }

            // handle outputs affected by the call
            for (int i = 0; i < callee.OutParams.Count; ++i)
            {
                var formalOutput = callee.OutParams[i];
                if (!calleeDependencies.ContainsKey(formalOutput))
                    continue;
                var actualOutput = node.Outs[i].Decl;

                dependencies[actualOutput] = InferCalleeOutputDependancy(node, formalOutput, dependencies, inputExpressionsDependency);
                InferDominatorDependency(currBlock, dependencies[actualOutput]); // conditionals may dominate/taint the return value
                //dependencies[actualOutput].ExceptWith(nodeToImpl[node].LocVars);

                if (nativeTaint) // native taint
                    dependencies[actualOutput].Add(Utils.VariableUtils.BottomUpTaintVar); // only applies to actual outputs (i.e. bottom up)
            }

            // handle globals affected by the call
            foreach (var g in calleeDependencies.Keys)
            {
                if (!(g is GlobalVariable))
                    continue;
                dependencies[g] = InferCalleeOutputDependancy(node, g, dependencies, inputExpressionsDependency);
                InferDominatorDependency(currBlock, dependencies[g]); // conditionals may dominate/taint the modified globals
                //dependencies[g].ExceptWith(nodeToImpl[node].LocVars);
            }

            if (worklist.Assign(node, dependencies))
                worklist.Propagate(node);
            return node;
        }

        public override Cmd VisitAssumeCmd(AssumeCmd node)
        {
            return worklist.SimpleTransform(node) as Cmd;
        }
        public override Cmd VisitAssertCmd(AssertCmd node)
        {
            return worklist.SimpleTransform(node) as Cmd;
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
            // top down taint can't flow up
            if (!procExitTDTaint.ContainsKey(proc))
                procExitTDTaint[proc] = new Dependencies();
            ProcDependencies[proc].Where(d => d.Value.Contains(Utils.VariableUtils.TopDownTaintVar)).Iter(dep => { 
                dep.Value.Remove(Utils.VariableUtils.TopDownTaintVar);
                procExitTDTaint[proc][dep.Key] = new VarSet(); 
                procExitTDTaint[proc][dep.Key].Add(Utils.VariableUtils.TopDownTaintVar);
            });
            return node;
        }
    }

    public class DependencyWriter : StandardVisitor
    {
        Program prog;
        Dictionary<Procedure, Dependencies> allDeps;

        public DependencyWriter(Program prog, Dictionary<Procedure, Dependencies> allDeps)
        {
            this.prog = prog;
            this.allDeps = allDeps;
        }

        public override Procedure VisitProcedure(Procedure node)
        {
            //stub procedures may not have dependencies
            if (!allDeps.ContainsKey(node)) return base.VisitProcedure(node);
            //add the dependencies as ensures
            var depEnsures = new List<Ensures>();
            var deps = allDeps[node];
            foreach(var kv in deps)
            {
                var ens = new Ensures(true, Expr.True);
                var outvar = kv.Key;
                Debug.Assert(outvar is GlobalVariable || node.OutParams.Contains(outvar), "Dependency should only contain globals/outputs as key");
                var invars = kv.Value.ToList(); //some order
                invars.Iter(i => Debug.Assert(i is GlobalVariable || node.InParams.Contains(i), "Dependency should only globals/inputs as values"));
                var varL = new List<string>() { outvar.Name };
                //don't add variables such as * and ~
                invars.RemoveAll(x => x.Name == Utils.VariableUtils.NonDetVar.Name 
                    || x.Name == Utils.VariableUtils.BottomUpTaintVar.Name 
                    || x.Name == Utils.VariableUtils.TopDownTaintVar.Name);
                varL.AddRange(invars.Select(i => i.Name));
                ens.Attributes = new QKeyValue(Token.NoToken, "io_dependency", varL.Select(x => (object) x).ToList(), null);
                depEnsures.Add(ens);
            }
            node.Ensures.AddRange(depEnsures);
            return base.VisitProcedure(node);
        }
    }
}
