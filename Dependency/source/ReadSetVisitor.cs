using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Boogie;
using Microsoft.Boogie.GraphUtil;

namespace Dependency
{
    class ProcReadSetVisitor : StandardVisitor
    {

        public Dictionary<Procedure, HashSet<Variable>> ProcReadSet = new Dictionary<Procedure, HashSet<Variable>>();
        private Program program;
        private Procedure currentProc;
        private Graph<Procedure> callGraph;
        

        public override Program VisitProgram(Program program)
        {
            this.program = program;
            this.callGraph = Utils.CallGraphHelper.ComputeCallGraph(program);

            var worklist = new List<Procedure>();
            program.TopLevelDeclarations.Iter(d => { if (d is Procedure) worklist.Add(d as Procedure); });

            while (worklist.Count > 0)
            {
                currentProc = worklist.First();
                worklist.Remove(currentProc);

                if (!ProcReadSet.ContainsKey(currentProc))
                    ProcReadSet[currentProc] = new HashSet<Variable>();

                var initialRS = new HashSet<Variable>(ProcReadSet[currentProc]);

                var impl = program.Implementations().SingleOrDefault(i => i.Name == currentProc.Name);
                if (impl == null)
                {// a stub
                    ProcReadSet[currentProc].Add(Utils.VariableUtils.NonDetVar);
                    ProcReadSet[currentProc].UnionWith(currentProc.InParams);
                    ProcReadSet[currentProc].UnionWith(currentProc.OutParams);
                    currentProc.Modifies.Iter(m => ProcReadSet[currentProc].UnionWith(Utils.VariableUtils.ExtractVars(m)));
                }
                else // a procedure with a body
                    Visit(impl);

                if (!initialRS.SetEquals(ProcReadSet[currentProc]) && callGraph.Nodes.Contains(currentProc))
                {// the read set changed
                    worklist.AddRange(callGraph.Predecessors(currentProc)); // add all callers to WL
                }
            }

            ProcReadSet.Iter(prs => Utils.VariableUtils.FixFormals(program.Implementations().SingleOrDefault(i => i.Name == prs.Key.Name), prs.Value));

            return program;
        }

        public override Variable VisitVariable(Variable node)
        {
            if (!ProcReadSet.ContainsKey(currentProc))
                ProcReadSet[currentProc] = new HashSet<Variable>();
            //if (node is GlobalVariable || proc.InParams.Contains(node)) // only consider globals and formals in the read set
            ProcReadSet[currentProc].Add(node);
            return node;
        }

        public override Cmd VisitCallCmd(CallCmd node)
        {
            var callee = node.Proc;
            if (!ProcReadSet.ContainsKey(callee) || ProcReadSet[callee].Count == 0) // callee has no readset
                return base.VisitCallCmd(node);

            if (!ProcReadSet.ContainsKey(currentProc))
                ProcReadSet[currentProc] = new HashSet<Variable>();

            ProcReadSet[currentProc].UnionWith(ProcReadSet[callee].Where(v => v is GlobalVariable)); // add all globals read in the callee to the read set

            return base.VisitCallCmd(node);
        }
        
    }

    class SimpleReadSetVisitor : StandardVisitor
    {
        public HashSet<Variable> ReadSet;
        Dictionary<Procedure, Dependencies> procDependencies;

        public SimpleReadSetVisitor(Dictionary<Procedure, Dependencies> procDependencies)
        {
            this.ReadSet = new HashSet<Variable>();
            this.procDependencies = procDependencies;
        }

        public override Cmd VisitAssignCmd(AssignCmd node)
        {
            node.Lhss.Iter(lhs => ReadSet.UnionWith(Utils.VariableUtils.ExtractVars(lhs)));
            return node;
        }

        public override Cmd VisitAssumeCmd(AssumeCmd node)
        {
            ReadSet.UnionWith(Utils.VariableUtils.ExtractVars(node.Expr));
            return node;
        }
        
        public override Cmd VisitCallCmd(CallCmd node)
        {
            node.Ins.Iter(i => ReadSet.UnionWith(Utils.VariableUtils.ExtractVars(i)));
            ReadSet.UnionWith(procDependencies[node.Proc].ReadSet().Where(v => v is GlobalVariable));
            return node;
        }
    }

    class SimpleModSetVisitor : StandardVisitor
    {
        public HashSet<Variable> ModSet;
        Dictionary<Procedure, Dependencies> procDependencies;

        public SimpleModSetVisitor(Dictionary<Procedure, Dependencies> procDependencies)
        {
            this.ModSet = new HashSet<Variable>();
            this.procDependencies = procDependencies;
        }

        public override Cmd VisitAssignCmd(AssignCmd node)
        {
            node.Rhss.Iter(rhs => ModSet.UnionWith(Utils.VariableUtils.ExtractVars(rhs)));
            return node;
        }
        public override Cmd VisitHavocCmd(HavocCmd node)
        {
            node.Vars.Iter(e => ModSet.Add(e.Decl));
            return node;
        }
        public override Cmd VisitCallCmd(CallCmd node)
        {
            node.Outs.Iter(o => ModSet.UnionWith(Utils.VariableUtils.ExtractVars(o)));
            ModSet.UnionWith(procDependencies[node.Proc].ModSet().Where(v => v is GlobalVariable));
            return node;
        }
    }
}
