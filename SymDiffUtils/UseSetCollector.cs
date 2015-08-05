using Microsoft.Boogie;
using Microsoft.Boogie.GraphUtil;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
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
            BitArray bitarray = this.ProcedureToUseSet[proc];
            HashSet<Variable> vars = GetUseSetFromBitArray(bitarray);
            return vars;
        }

        private HashSet<Variable> GetUseSetFromBitArray(BitArray bitarray)
        {
            HashSet<Variable> vars = new HashSet<Variable>();

            for (int i = 0; i < bitarray.Count; i++)
            {
                if (bitarray.Get(i))
                {
                    vars.Add(this.idToVariable[i]);
                }
            }
            return vars;
        }

        public HashSet<Variable> GetUseSetForProgram()
        {

            BitArray allUses = this.ProcedureToUseSet.Values.Aggregate(new BitArray(this.variableDecls, false), (x, y) => x.Or(y));
            return this.GetUseSetFromBitArray(allUses);
        }

        public override Procedure VisitProcedure(Procedure node)
        {
            last = node;
            if (!this.ProcedureToUseSet.ContainsKey(node))
            {
                this.ProcedureToUseSet.Add(node, new BitArray(this.variableDecls));
            }
            var result = base.VisitProcedure(node);
            last = null;
            return result;
        }

        public override Implementation VisitImplementation(Implementation node)
        {
            last = node.Proc;
            if (!this.ProcedureToUseSet.ContainsKey(node.Proc))
            {
                this.ProcedureToUseSet.Add(node.Proc, new BitArray(this.variableDecls));
            }
            var result = base.VisitImplementation(node);
            last = null;
            return result;
        }

        public override Expr VisitIdentifierExpr(IdentifierExpr node)
        {
            if (this.last == null)
            {                
                return base.VisitIdentifierExpr(node);
            }

            if (node.Decl is GlobalVariable)
            {
                this.ProcedureToUseSet[this.last].Set(this.GetId(node.Decl), true);
            }
            return base.VisitIdentifierExpr(node);
        }

        private int GetId(Variable variable)
        {
            if (!this.variableToId.ContainsKey(variable))
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
                BitArray copy = useSet.Clone() as BitArray;
                Debug.Assert(copy != null);
                bool changed = false;
                foreach (var suc in this.callGraph.Successors(current))
                {
                    useSet.Or(this.ProcedureToUseSet[suc]);
                }
                if (!this.BitArrayEquals(copy,useSet))
                {
                    changed = true;
                }

                if (changed)
                {
                    foreach (var pred in this.callGraph.Predecessors(current))
                    {
                        if (!workQueue.Contains(pred) && !pred.Equals(current))
                        {
                            workQueue.Enqueue(pred);
                        }
                    }
                }
            }
        }

        private bool BitArrayEquals(BitArray b1, BitArray b2)
        {
            Debug.Assert(b1.Count.Equals(b2.Count));
            for (int i = 0; i < b1.Count; i++)
            {
                if (b1.Get(i) != b2.Get(i))
                    return false;
            }
            return true;
        }
    }
}
