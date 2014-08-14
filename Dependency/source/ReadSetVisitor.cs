using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Boogie;
using Microsoft.Boogie.GraphUtil;

namespace Dependency
{
    class ReadSetVisitor : StandardVisitor
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

                var initialRS = ProcReadSet.ContainsKey(currentProc) ? ProcReadSet[currentProc] : null;

                var impl = program.Implementations().SingleOrDefault(i => i.Name == currentProc.Name);
                if (impl == null)
                { // a stub
                    ProcReadSet[currentProc] = new HashSet<Variable>();
                    ProcReadSet[currentProc].Add(Utils.VariableUtils.NonDetVar);
                    ProcReadSet[currentProc].UnionWith(currentProc.InParams);
                    ProcReadSet[currentProc].UnionWith(currentProc.OutParams);
                }
                else
                { // a procedure with a body
                    Visit(impl);
                }

                if ((initialRS == null || !initialRS.SetEquals(ProcReadSet[currentProc])) && callGraph.Nodes.Contains(currentProc))
                {// the read set changed
                    worklist.AddRange(callGraph.Predecessors(currentProc)); // add all callers to WL
                }
            }

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
                return node;

            if (!ProcReadSet.ContainsKey(currentProc))
                ProcReadSet[currentProc] = new HashSet<Variable>();

            ProcReadSet[currentProc].UnionWith(ProcReadSet[callee].Where(v => v is GlobalVariable)); // add all globals read in the callee to the read set

            return base.VisitCallCmd(node);
        }
        
    }
}
