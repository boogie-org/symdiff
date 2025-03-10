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
    public class BottomUpTaintVisitor : StandardVisitor
    {
        private string filename;
        private Program program;

        private Graph<Procedure> callGraph;
        private Dictionary<Absy, Implementation> nodeToImpl;

        public Dictionary<Procedure, TaintSet> ProcTaint;
        private Dictionary<Procedure, Dependencies> procDependencies;

        private Dictionary<Block, HashSet<Block>> dominatedBy;
        private Dictionary<Block, HashSet<Variable>> branchCondVars; // a mapping: branching Block -> { Variables in the branch conditional }

        public WorkList<TaintSet> worklist;

        private HashSet<Procedure> changedProcs;
        private HashSet<Block> changedBlocks;

        private bool dataOnly;


        public BottomUpTaintVisitor(string filename, Program program, Dictionary<Procedure, Dependencies> procDependencies, List<Tuple<string,string,int>> changeLog, bool dataOnly = false)
        {
            this.filename = filename;
            this.program = program;

            this.callGraph = Utils.CallGraphHelper.ComputeCallGraph(program);
            this.nodeToImpl = Utils.ComputeNodeToImpl(program);

            this.ProcTaint = new Dictionary<Procedure, TaintSet>();
            this.procDependencies = procDependencies;

            this.dominatedBy = new Dictionary<Block, HashSet<Block>>();
            this.branchCondVars = new Dictionary<Block, HashSet<Variable>>();

            this.worklist = new WorkList<TaintSet>();

            // populate changedProcs,changedBlock from changedLines
            this.changedProcs = new HashSet<Procedure>();
            this.changedBlocks = new HashSet<Block>();
            foreach (var changesPerFile in changeLog.GroupBy(t => t.Item1)) {
                foreach (var changesPerProc in changesPerFile.GroupBy(t => t.Item2)) {
                    var impl = program.Implementations().FirstOrDefault(i => i.Proc.Name == changesPerProc.Key);
                    if (changesPerProc.FirstOrDefault(t => t.Item3 == Utils.AttributeUtils.WholeProcChangeAttributeVal) != null)
                        this.changedProcs.Add(impl.Proc); // whole procedure changed
                    else foreach (var procChange in changesPerProc)
	                {
                        // add in the block pertaining to the changed line
                        impl.Blocks.Where(b => b.Cmds.Count > 0 &&
                                          b.Cmds[0] is AssertCmd &&
                                          Utils.AttributeUtils.GetSourceLine(b.Cmds[0] as AssertCmd) == procChange.Item3)
                                            .Iter(b => changedBlocks.Add(b));
	                }
                }
            }

            this.dataOnly = dataOnly;
        }

        public override Program VisitProgram(Program node)
        {
            program.Implementations().Iter(impl => Visit(impl));
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


        private bool InferDominatorTaint(Block block)
        {
            if (dataOnly)
                return false;

            if (dominatedBy.Keys.Contains(block))
                foreach (var dominator in dominatedBy[block])
                    if (branchCondVars.ContainsKey(dominator))
                    {
                        // assignment under a branch is tainted if any the variables in the
                        // branch conditional are tainted, *at the point of branching*
                        var domTaint = worklist.stateSpace[dominator.TransferCmd];
                        if (branchCondVars[dominator].Intersect(domTaint).Count() > 0)
                            return true;
                    }

            return false;
        }

        public override Cmd VisitAssignCmd(AssignCmd node)
        {
            // gather state from all predecesors
            Block currBlock = worklist.cmdBlocks[node];
            var predTaintSet = worklist.GatherPredecessorsState(node, currBlock);
            var taintSet = new TaintSet(predTaintSet);

            // the assignment has the potential to cleanse the taint
            taintSet.RemoveWhere(v => node.Lhss.Exists(l => Utils.VariableUtils.ExtractVars(l).Contains(v)));

            if (changedProcs.Contains(nodeToImpl[node].Proc) || changedBlocks.Contains(currBlock)  // native taint
                || InferDominatorTaint(currBlock)) // control taint
            {
                node.Lhss.Iter(lhs => taintSet.Add(Utils.VariableUtils.ExtractVars(lhs).First()));
            }
            else // data taint
            {
                for (int i = 0; i < node.Lhss.Count; ++i)
                {
                    var lhs = Utils.VariableUtils.ExtractVars(node.Lhss[i]).First(); // TODO: stuff like: Mem_T.INT4[in_prio] := out_tempBoogie0
                    var rhsVars = Utils.VariableUtils.ExtractVars(node.Rhss[i]);
                    if (rhsVars.Intersect(predTaintSet).Count() > 0) // if RHS is tainted
                        taintSet.Add(lhs); // so is LHS
                }
            }
            if (worklist.Assign(node, taintSet))
                worklist.Propagate(node);
            return node;
        }

        public override Cmd VisitCallCmd(CallCmd node)
        {
            var callee = node.Proc;
            var deps = procDependencies[callee];
            Debug.Assert(callee.Modifies.All(m => Utils.VariableUtils.ExtractVars(m).All(v => deps.Keys.Contains(v)))); // sanity check

            // gather state from all predecesors
            Block currBlock = worklist.cmdBlocks[node];
            var predTaintSet = worklist.GatherPredecessorsState(node, currBlock);
            var taintSet = new TaintSet(predTaintSet);

            // the assignment has the potential to cleanse the taint
            taintSet.RemoveWhere(v => node.Outs.Exists(o => o.Decl == v));
            taintSet.RemoveWhere(g => deps.ModSet().Contains(g));

            if (changedProcs.Contains(nodeToImpl[node].Proc) || changedBlocks.Contains(currBlock)  // native taint
                || InferDominatorTaint(currBlock)) // control taint
            {
                node.Outs.Iter(lhs => taintSet.Add(lhs.Decl));
                deps.ModSet().Where(v => v is GlobalVariable).Iter(g => taintSet.Add(g));
            }
            else
            {
                if (!ProcTaint.ContainsKey(callee))
                { // this will be continued once the callee gets analyzed
                    if (worklist.Assign(node, new TaintSet()))
                        worklist.Propagate(node);
                    return node;
                }

                //TODO: remove code dup here and review again!

                // data taint for outputs
                for (int i = 0; i < node.Outs.Count; ++i)
                {
                    var lhs = node.Outs[i].Decl;
                    var formalOut = node.Proc.OutParams[i];

                    if (ProcTaint[callee].Contains(formalOut) || // callee's output is natively tainted
                        predTaintSet.FirstOrDefault(g => g is GlobalVariable && deps[formalOut].Contains(g)) != null) // callee's output depends on a tainted global
                    {
                        taintSet.Add(lhs);
                        continue;
                    }

                    for (int j = 0; j < node.Ins.Count; ++j) {
                        if (Utils.VariableUtils.ExtractVars(node.Ins[j]).Intersect(predTaintSet).Count() == 0)
                            continue;
                        var formalIn = node.Proc.InParams[j];
                        if (deps[formalOut].Contains(formalIn)) // callee's output depends on a tainted input
                        {
                            taintSet.Add(lhs);
                            break;
                        }
                    }
                }

                // data taint for globals
                foreach (var g in deps.ModSet().Where(v => v is GlobalVariable)) {
                    if (ProcTaint[callee].Contains(g) || // callee's global is natively tainted
                        deps[g].Intersect(predTaintSet).Count() > 0) // callee's global depends on a tainted global
                    {
                        taintSet.Add(g);
                        continue;
                    }
                    for (int j = 0; j < node.Ins.Count; ++j) {
                        if (Utils.VariableUtils.ExtractVars(node.Ins[j]).Intersect(predTaintSet).Count() == 0)
                            continue;
                        var formalIn = node.Proc.InParams[j];
                        if (deps[g].Contains(formalIn)) // callee's global depends on a tainted input
                        {
                            taintSet.Add(g);
                            break;
                        }
                    }
                }
            }

            Console.WriteLine("Taint after calling " + node + " = " + taintSet);

            if (worklist.Assign(node, taintSet))
                worklist.Propagate(node);
            return node;
        }

        public override GotoCmd VisitGotoCmd(GotoCmd node)
        {
            Block currBlock = worklist.cmdBlocks[node];
            var taintSet = worklist.GatherPredecessorsState(node, currBlock);

            var succs = node.LabelTargets;
            if (succs.Count > 1)
            { // here we create branchCondVars
                if (!branchCondVars.ContainsKey(currBlock))
                    branchCondVars[currBlock] = new HashSet<Variable>();

                foreach (var succ in succs)
                    branchCondVars[currBlock].UnionWith(Utils.VariableUtils.ExtractVars(succ.Cmds[0]));
            }

            if (worklist.Assign(node, taintSet))
                worklist.Propagate(node);
            return node;
        }

        public override Cmd VisitHavocCmd(HavocCmd node)
        {
            // gather state from all predecesors
            Block currBlock = worklist.cmdBlocks[node];
            var predTaintSet = worklist.GatherPredecessorsState(node, currBlock);
            var taintSet = new TaintSet(predTaintSet);

            // the assignment has the potential to cleanse the taint
            taintSet.RemoveWhere(v => node.Vars.Exists(o => o.Decl == v));

            if (changedProcs.Contains(nodeToImpl[node].Proc) || changedBlocks.Contains(currBlock)  // native taint
                || InferDominatorTaint(currBlock)) // control taint
                node.Vars.Iter(v => taintSet.Add(v.Decl));

            if (worklist.Assign(node, taintSet))
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
            var taintSet = worklist.GatherPredecessorsState(node, currBlock);
            if (worklist.Assign(node, taintSet))
                worklist.Propagate(node,nodeToImpl[node].Proc);

            // set the taint result for the procedure
            var proc = nodeToImpl[node].Proc;
            if (!ProcTaint.ContainsKey(proc))
                ProcTaint[proc] = new TaintSet();
            ProcTaint[proc].JoinWith(worklist.stateSpace[node]);
            Utils.VariableUtils.FixFormals(nodeToImpl[node], ProcTaint[proc]);

            return node;
        }

    }

    public class TopDownTaintVisitor : StandardVisitor { }

    public class PruneTaintVisitor : StandardVisitor { }
}
