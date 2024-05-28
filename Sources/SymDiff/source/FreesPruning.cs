using Microsoft.Boogie;
using Microsoft.Boogie.GraphUtil;
using SymDiffUtils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Util = SymDiffUtils.Util;

namespace SDiff
{
    class FreesPruning
    {
        private Program program;
        private Dictionary<Procedure, bool> transitivelyFreeProceduresCache = new Dictionary<Procedure, bool>();
        public FreesPruning(Program program)
        {
            this.program = program;
        }

        public void Prune()
        {
            var cg = CallGraphHelper.ComputeCallGraph(this.program);
            foreach (var proc in cg.Nodes)
            {
                this.IsTransitivelyFree(proc, cg);
            }
            foreach (var proc in this.transitivelyFreeProceduresCache.Keys.Where(x => this.transitivelyFreeProceduresCache[x]))
            {
                var impl = Util.getImplByName(this.program, proc.Name);
                if (impl != null)
                {
                    Console.WriteLine("Pruning impls with no non-free contract transitively: " + proc.Name);
                    this.program.RemoveTopLevelDeclaration(impl);
                }
            }
        }


        private bool IsTransitivelyFree(Procedure proc, Graph<Procedure> callGraph)
        {
            var result = this.IsTransitivelyFree(proc, callGraph, new HashSet<Procedure>());
            this.transitivelyFreeProceduresCache.Add(proc, result);
            return result;
        }

        private bool IsTransitivelyFree(Procedure proc, Graph<Procedure> callGraph, HashSet<Procedure> visited)
        {
            if (this.transitivelyFreeProceduresCache.ContainsKey(proc))
            {
                return this.transitivelyFreeProceduresCache[proc];
            }
            if (visited.Contains(proc))
            {
                return true;
            }
            visited.Add(proc);

            //  If the procedure itself has non-free contracts, then it's not free;
            if (!this.HasOnlyFreeContracts(proc))
            {
                return false;
            }

            foreach (var callee in callGraph.Successors(proc))
            {
                if (!this.IsTransitivelyFree(callee, callGraph, visited))
                {
                    return false;
                }
            }
            return true;
        }

        private bool HasOnlyFreeContracts(Procedure proc)
        {
            foreach (var req in proc.Requires)
            {
                if (!req.Free)
                {
                    return false;
                }
            }

            foreach (var ens in proc.Ensures)
            {
                if (!ens.Free)
                {
                    return false;
                }
            }
            return true;
        }
    }
}
