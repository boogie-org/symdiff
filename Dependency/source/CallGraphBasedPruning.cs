using Microsoft.Boogie;
using Microsoft.Boogie.GraphUtil;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dependency
{
    class CallGraphBasedPruning
    {
        private Graph<Procedure> callGraph;
        private Program program;

        private HashSet<Procedure> callers = new HashSet<Procedure>();
        private HashSet<Procedure> callees = new HashSet<Procedure>();
        private HashSet<Procedure> changedProcedures;

        public CallGraphBasedPruning(Program program, HashSet<Procedure> changedProcedures)
        {
            this.program = program;
            this.changedProcedures = changedProcedures;
        }

        public Program PruneProgram()
        {
            this.callGraph = Utils.CallGraphHelper.ComputeCallGraph(program);

            foreach (var proc in changedProcedures)
            {
                this.ComputeTransitiveCallers(proc);
            }
            foreach (var proc in callers)
            {
                this.ComputeTransitiveCallees(proc);
            }

            return this.Prune();
        }

        private Program Prune() {
            int total = this.program.Procedures.Count();
            int removed = 0;
            foreach(var impl in this.program.Implementations.ToList()) {
                if(!this.callees.Contains(impl.Proc)) {
                    Console.WriteLine("[INFO:] Pruned procedure based on callgraph: " + impl.Name);
                    this.program.RemoveTopLevelDeclaration(impl);
                    this.program.RemoveTopLevelDeclaration(impl.Proc);
                    removed++;
                }
            }

            foreach (var proc in this.program.Procedures.ToList())
            {
                if(!this.callees.Contains(proc)) {
                    Console.WriteLine("[INFO:] Pruned procedure based on callgraph: " + proc.Name);
                    this.program.RemoveTopLevelDeclaration(proc);
                    removed++;
                }
            }
            Console.WriteLine("[INFO:] Pruned {0} out of {1} based on callgraph.", removed, total);
            return this.program;
        }

        private void ComputeTransitiveCallers(Procedure proc)
        {
            if (this.callers.Contains(proc))
            {
                return;
            }

            this.callers.Add(proc);
            foreach (var caller in this.callGraph.Predecessors(proc))
            {
                this.ComputeTransitiveCallers(caller);
            }
        }

        private void ComputeTransitiveCallees(Procedure proc)
        {
            if (this.callees.Contains(proc))
            {
                return;
            }

            this.callees.Add(proc);
            foreach (var callee in this.callGraph.Successors(proc))
            {
                this.ComputeTransitiveCallees(callee);
            }
        }
    }
}
