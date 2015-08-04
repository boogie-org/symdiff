using Microsoft.Boogie;
using Microsoft.Boogie.GraphUtil;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;

namespace SymDiffUtils
{
    public class UseSetCollector : FixedVisitor
    {
        private Dictionary<Variable, int> variableToId = new Dictionary<Variable, int>();
        private Dictionary<int, Variable> idToVariable = new Dictionary<int, Variable>();
        private Dictionary<Procedure, BitArray> ProcedureToUseSet = new Dictionary<Procedure, BitArray>();
        private Procedure last;
        private Program program;
        private Graph<Procedure> callGraph;
        private int variableDecls;
        private int currentId = 0;

        public UseSetCollector(Program prog)
        {
            this.variableDecls = prog.Variables.Count();
            this.program = prog;
        }

        public HashSet<Variable> GetUseSetForProcedure(Procedure proc)
        {
            Debug.Assert(this.ProcedureToUseSet.ContainsKey(proc));
            HashSet<Variable> vars = new HashSet<Variable>();
            foreach(BitArray bitarray in this.ProcedureToUseSet[proc]){
                for (int i = 0; i < bitarray.Count; i++)
                {
                    if (bitarray.Get(i))
                    {
                        vars.Add(this.idToVariable[i]);
                    }
                }
            }
            return vars;
        }

        public override Procedure VisitProcedure(Procedure node)
        {
            last = node;
            Debug.Assert(!this.ProcedureToUseSet.ContainsKey(node));
            this.ProcedureToUseSet.Add(node, new BitArray(this.variableDecls));
            return base.VisitProcedure(node);
        }

        public override Expr VisitIdentifierExpr(IdentifierExpr node)
        {
            Debug.Assert(this.last != null);
            if (node.Decl is GlobalVariable)
            {
                this.ProcedureToUseSet[this.last].Set(this.getId(node.Decl), true);
            }
            return base.VisitIdentifierExpr(node);
        }

        private int getId(Variable variable)
        {
            if(!this.variableToId.ContainsKey(variable))
            {
                this.variableToId.Add(variable, this.currentId);
                this.idToVariable.Add(this.currentId, variable);
                this.currentId++;
            }
            
            return this.variableToId[variable];

        }

        public void Propagate()
        {
            this.callGraph = CallGraphHelper.ComputeCallGraph(program);
            
            Queue<Procedure> workQueue = new Queue<Procedure>(this.ProcedureToUseSet.Keys);
            
            while (workQueue.Count > 0)
            {
                Procedure current = workQueue.Dequeue();
                BitArray useSet = this.ProcedureToUseSet[current];
                var copy = useSet.Clone();
                bool changed = false;
                foreach (var suc in this.callGraph.Successors(current))
                {
                    if (!useSet.Or(this.ProcedureToUseSet[suc]).Equals(copy))
                    {
                        changed = true;
                    }
                }
                
                if(changed) {
                    foreach (var pred in this.callGraph.Predecessors(current))
                    {
                        workQueue.Enqueue(pred);
                    }
                }
            }
        }
    }
}
