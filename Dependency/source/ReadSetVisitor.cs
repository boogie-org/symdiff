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

        public Dictionary<Procedure, VarSet> ProcReadSet = new Dictionary<Procedure, VarSet>();
        public Procedure currentProc;

        public override Program VisitProgram(Program program)
        {
            var callGraph = Utils.CallGraphHelper.ComputeCallGraph(program);

            var worklist = new List<Procedure>();
            program.TopLevelDeclarations.Iter(d => { if (d is Procedure) worklist.Add(d as Procedure); });

            int numVisited = 0;
            while (worklist.Count > 0)
            {
                currentProc = worklist.First();
                worklist.Remove(currentProc);

                if (!ProcReadSet.ContainsKey(currentProc))
                    ProcReadSet[currentProc] = new VarSet();

                var initialRS = new VarSet(ProcReadSet[currentProc]);

                var impl = program.Implementations.SingleOrDefault(i => i.Name == currentProc.Name);
                if (impl == null)
                {// a stub
                    ProcReadSet[currentProc].Add(Utils.VariableUtils.NonDetVar);
                    ProcReadSet[currentProc].UnionWith(currentProc.InParams);
                    ProcReadSet[currentProc].UnionWith(currentProc.OutParams);
                    currentProc.Modifies.Iter(m => ProcReadSet[currentProc].UnionWith(Utils.VariableUtils.ExtractVars(m)));
                }
                else
                {// a procedure with a body
                    Console.WriteLine("Visiting: {0} ({1}/{2})", impl.Name, ++numVisited, program.Implementations.Count());
                    Visit(impl);
                }

                if (!initialRS.SetEquals(ProcReadSet[currentProc]) && callGraph.Nodes.Contains(currentProc))
                {// the read set changed
                    worklist.AddRange(callGraph.Predecessors(currentProc)); // add all callers to WL
                }
                //GC.Collect();
            }
            ProcReadSet.Iter(prs => Utils.VariableUtils.FixFormals(program.Implementations.SingleOrDefault(i => i.Name == prs.Key.Name), prs.Value));

            return program;
        }

        public override Variable VisitVariable(Variable node)
        {
            if (!ProcReadSet.ContainsKey(currentProc))
                ProcReadSet[currentProc] = new VarSet();
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
                ProcReadSet[currentProc] = new VarSet();

            ProcReadSet[currentProc].UnionWith(ProcReadSet[callee].Where(v => v is GlobalVariable)); // add all globals read in the callee to the read set

            return base.VisitCallCmd(node);
        }
        
    }

}
