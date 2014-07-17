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

    // Reps, Horwitz abd Sagiv: Precise Interprocedural Dataflow Analysis via Graph Reachability
    public class TaintFactoid
    {
        public Variable Src { get; set; }
        public Variable Dst { get; set; }
        public Absy Node { get; set; } // the node associated with the factoid
    }
    public class Tabulation
    {
        Program program;
        Cmd Smain;
        // TODO:
        // graph is a transformed block graph where B1 { c1_1, ... , c1_transfer } -> B2 { c2_1, ... , c2_transfer }
        // is c1_1 -> c1_2 ... c1_transfer -> c2_1 ... 
        Graph<Absy> graph;
        Dictionary<Absy, HashSet<TaintFactoid>> state;
        HashSet<Tuple<TaintFactoid, TaintFactoid>> pathEdge, workList, summaryEdge;
        Dictionary<Procedure, Implementation> procedures;
        Dictionary<Expr, HashSet<Variable>> extractedVars; // TODO: optimization

        // TODO: state was loaded with S_main -> { (In_1,In_1) , ... , (In_k,In_k) }
        public void Tabulate()
        {
            throw new NotImplementedException();
            // sanity check
            Debug.Assert(procedures.First().Value.LocVars.Count > 1);
            Variable v1 = procedures.First().Value.LocVars[0];
            Variable v2 = procedures.First().Value.LocVars[1];
            TaintFactoid f1 = new TaintFactoid();
            TaintFactoid f2 = new TaintFactoid();
            TaintFactoid f3 = new TaintFactoid();
            TaintFactoid f4 = new TaintFactoid();
            f1.Dst = v1; f1.Src = v2; f1.Node = graph.Nodes.First();
            f3.Dst = v1; f3.Src = v2; f3.Node = graph.Nodes.First();
            Debug.Assert(f1 == f3);
            Tuple<TaintFactoid, TaintFactoid> t1 = new Tuple<TaintFactoid, TaintFactoid>(f1, f3);
            Tuple<TaintFactoid, TaintFactoid> t2 = new Tuple<TaintFactoid, TaintFactoid>(f3, f1);
            Debug.Assert(t1 == t2);

            foreach (var node in graph.Nodes)
            {
                state[node] = new HashSet<TaintFactoid>();
            }
            foreach (var f in state[Smain])
            {
                workList.Add(new Tuple<TaintFactoid, TaintFactoid>(f, f));
                pathEdge.Add(new Tuple<TaintFactoid, TaintFactoid>(f, f));
            }
            ForwardTabulate();
        }

        private void ForwardTabulate()
        {
            while (workList.Count > 0)
            {
                var edge = workList.First();
                workList.Remove(edge);
                var n = edge.Item2.Node;
                if (n is CallCmd)
                {
                    CallTransformer((CallCmd)edge.Item2.Node);
                }
                else if (n is ReturnCmd)
                {

                }
                else
                {
                    if (n is AssignCmd)
                    {
                        AssignTransformer(edge.Item2);
                    }
                    else if (n is GotoCmd)
                    {

                    }
                }
            }
        }

        private void CallTransformer(CallCmd node)
        {
            // the transformer for a call simply emits all the taint factoid of the caller
            // to the callee, with the proper renaming i.e. if f(int a) was called with f(x)
            // then every taint factoid T(x,v) at the callsite will appear as T(a,v) at function entry
            foreach (var f in state[node])
            {
                for (int i = 0; i < node.Ins.Count; ++i)
                {
                    var actual = node.Ins[i];
                    var varExtractor = new Utils.VariableExtractor();
                    varExtractor.Visit(actual);
                    if (varExtractor.vars.Contains(f.Dst)) // current input contains a tainted variable
                    {
                        var nf = new TaintFactoid();
                        nf.Node = procedures[node.Proc].Blocks[0].Cmds[0];
                        nf.Src = f.Src;
                        nf.Dst = node.Proc.InParams[i]; // replace the actual with the formal
                        state[nf.Node].Add(nf);
                        Propagate(nf, nf);
                        //if (summaryEdge.Contains)
                        //{
                        //}
                    }
                }
            }
        }

        private void AssignTransformer(TaintFactoid factoid)
        {
            AssignCmd node = (AssignCmd)factoid.Node;
            Console.WriteLine("Visiting " + node);
            Debug.Assert(node.Lhss.Count == 1 && node.Rhss.Count == 1);
            Expr lhs = node.Lhss[0].AsExpr, rhs = node.Rhss[0];
            var varExtractor = new Utils.VariableExtractor();
            varExtractor.Visit(lhs);
            Variable left = varExtractor.vars.Single(x => true);

            varExtractor.vars = new HashSet<Variable>();
            varExtractor.Visit(rhs);
            var rhsVars = varExtractor.vars;

            // we know Dst is tained by Src
            if (rhsVars.Contains(factoid.Dst) ||  // RHS contains Dst so LHS is also tained by Src
                left == factoid.Dst)              // factoid is not involved in the assignment
            {
                foreach (var succ in graph.Successors(node))
                { // foreach succesor of the node
                    TaintFactoid sf = new TaintFactoid();
                    sf.Node = succ;
                    sf.Src = factoid.Src;
                    sf.Dst = left;
                    Propagate(factoid, sf);
                }
            }

        }

        private void Propagate(TaintFactoid from, TaintFactoid to)
        {
            state[to.Node].Add(to);
            var edge = new Tuple<TaintFactoid, TaintFactoid>(from, to);
            if (!pathEdge.Contains(edge))
            {
                pathEdge.Add(edge);
                workList.Add(edge);
            }

        }
    }
}
