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
    public class TaintVisitor : StandardVisitor
    {
        private string filename;
        private Program program;

        private Graph<Procedure> callGraph;
        private Dictionary<Absy, Implementation> nodeToImpl;

        private Dictionary<Absy, Dependencies> progDependencies;
        private Dictionary<Procedure, HashSet<CallCmd>> procCallers = new Dictionary<Procedure, HashSet<CallCmd>>();

        public WorkList<TaintSet> worklist;

        private HashSet<string> changedProcs;
        private HashSet<int> changedLines;
        private HashSet<Block> changedBlocks = new HashSet<Block>();

        private bool dataOnly;


        public TaintVisitor(string filename, Program program, Dictionary<Absy, Dependencies> progDependencies, HashSet<int> changedLines, HashSet<string> changedProcs, bool dataOnly = false)
        {
            this.filename = filename;
            this.program = program;
            this.progDependencies = progDependencies;
            this.nodeToImpl = Utils.ComputeNodeToImpl(program);
            this.callGraph = Utils.CallGraphHelper.ComputeCallGraph(program);
            this.worklist = new WorkList<TaintSet>(procCallers);
            this.changedLines = (changedLines != null) ? changedLines : new HashSet<int>();
            this.changedProcs = (changedProcs != null) ? changedProcs : new HashSet<string>();
            this.dataOnly = dataOnly;
        }


        public override Program VisitProgram(Program node)
        {
            var bfs = new List<Procedure>();
            Utils.CallGraphHelper.BFS(callGraph).Iter(l => bfs.AddRange(l.Value));

            foreach (var proc in bfs)
                Visit(program.Implementations().FirstOrDefault(i => i.Proc == proc));

            return node;
        }

        public override Implementation VisitImplementation(Implementation node)
        {
            node.ComputePredecessorsForBlocks();

            worklist.RunFixedPoint(this, node);
            Console.WriteLine("Analyzed " + node + "( ).");

            return node;
        }

        public override Absy Visit(Absy node)
        {
            Block currBlock = worklist.cmdBlocks[node];
            TaintSet prevTaintSet = worklist.GatherPredecessorsState(node, currBlock), taintSet = new TaintSet();

            ComputeTaintFromDependencies(node, prevTaintSet, taintSet);
            return node;
        }

        private void ComputeTaintFromDependencies(Absy node, TaintSet prevTaintSet, TaintSet taintSet)
        {
            foreach (var t in prevTaintSet)
                foreach (var d in progDependencies[node])
                    if (d.Value.Contains(t))
                        taintSet.Add(t);

            if (worklist.Assign(node, taintSet))
                worklist.Propagate(node);
        }

        public override Cmd VisitAssignCmd(AssignCmd node)
        {
            // gather state from all predecesors
            Block currBlock = worklist.cmdBlocks[node];
            TaintSet prevTaintSet = worklist.GatherPredecessorsState(node, currBlock), taintSet = new TaintSet();

            if (changedProcs.Contains(nodeToImpl[node].Proc.Name) || changedBlocks.Contains(currBlock)) // the line itself is tainted
                TaintLhs(node.Lhss.Select(l => l.AsExpr), taintSet);

            ComputeTaintFromDependencies(node, prevTaintSet, taintSet);
            return node;
        }

        private static void TaintLhs(IEnumerable<Expr> Lhss, TaintSet taintSet)
        {
            // for assignment v1,...,vn = e1,...,en handle each vi = ei separately
            foreach (var lhs in Lhss)
            {
                Variable left = Utils.VariableUtils.ExtractVars(lhs).First(); // TODO: stuff like: Mem_T.INT4[in_prio] := out_tempBoogie0
                taintSet.Add(left);
            }
        }

        public override Cmd VisitCallCmd(CallCmd node)
        {
            var callee = node.Proc;
            Block currBlock = worklist.cmdBlocks[node];
            TaintSet prevTaintSet = worklist.GatherPredecessorsState(node, currBlock), calleeTaintSet = new TaintSet(), taintSet = new TaintSet();

            for (int i = 0; i < node.Ins.Count; ++i)
            {
                // if an argument is tainted at the call site, mark the corresponding formal as tainted 
                foreach (var v in Utils.VariableUtils.ExtractVars(node.Ins[i]))
                    if (prevTaintSet.Contains(v))
                        calleeTaintSet.Add(callee.InParams[i]);
            }

            // propagate the taint set to procedure entry
            var calleeImpl = program.Implementations().SingleOrDefault(i => i.Proc == callee);
            if (calleeImpl != null)
            {
                var implEntry = Utils.GetImplEntry(calleeImpl);
                if (worklist.Assign(implEntry, calleeTaintSet))
                    worklist.Propagate(implEntry);
            }

            if (changedProcs.Contains(nodeToImpl[node].Proc.Name) || changedBlocks.Contains(currBlock)) // the line itself is tainted
                TaintLhs(node.Outs, taintSet);

            ComputeTaintFromDependencies(node, prevTaintSet, taintSet);
            return node;
        }

    }
}
