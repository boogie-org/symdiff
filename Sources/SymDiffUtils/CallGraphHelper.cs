using Microsoft.Boogie;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Boogie.GraphUtil;
using System.Diagnostics;
using System.IO;


namespace SymDiffUtils
{
    static public class CallGraphHelper
    {
        static public Graph<Procedure> ComputeCallGraph(Program program)
        {
            Graph<Procedure> graph = new Graph<Procedure>();

            foreach (Implementation impl in program.Implementations)
            {
                graph.AddSource(impl.Proc);
                foreach (var b in impl.Blocks)
                    foreach (CallCmd c in b.Cmds.Where(c => c is CallCmd))
                        graph.AddEdge(impl.Proc, c.Proc);
            }

            //program.Implementations.Iter(impl => { if (graph.Nodes.Contains(impl.Proc) && graph.Predecessors(impl.Proc).Count() == 0) graph.AddSource(impl.Proc); });
            return graph;
        }

        public static List<SCC<Procedure>> ComputeOrderedSCCs(Graph<Procedure> graph)
        {

            Adjacency<Procedure> next = new Adjacency<Procedure>(graph.Successors);
            Adjacency<Procedure> prev = new Adjacency<Procedure>(graph.Predecessors);

            var sccs = new StronglyConnectedComponents<Procedure>(graph.Nodes, next, prev);
            sccs.Compute();
            //sccs.Iter(s => { s.Iter(p => Console.Write(p + ", ")); Console.WriteLine(); });

            var order = sccs.ToList();
            for (int i = 0; i < order.Count; i++)
            {
                for (int j = i + 1; j < order.Count; j++)
                    Debug.Assert(order[i].All(p => order[j].All(p2 => !graph.Edge(p2, p))));
            }

            return order;
        }

        static public Dictionary<int, HashSet<Procedure>> BFS(Graph<Procedure> cg)
        {
            int level = 0;
            HashSet<Procedure> todo = new HashSet<Procedure>(cg.Nodes);
            Dictionary<int, HashSet<Procedure>> bfs = new Dictionary<int, HashSet<Procedure>>();

            bfs[level] = new HashSet<Procedure>();
            foreach (Procedure p in cg.Nodes.Where(p => cg.Predecessors(p).Count() == 0))
                bfs[level].Add(p);

            if (bfs[level].Count == 0)
            { // no sources found
                bfs[level] = todo;
                return bfs;
            }

            while (todo.Count > 0)
            {
                if (bfs[level].Count == 0)
                { // add remaining at last level
                    bfs[level] = todo;
                    return bfs;
                }
                bfs[level + 1] = new HashSet<Procedure>();
                foreach (var p in bfs[level])
                {
                    foreach (var s in cg.Successors(p).Intersect(todo))
                    {
                        bfs[level + 1].Add(s);
                    }
                    todo.Remove(p);
                }
                level++;
            }
            return bfs;
        }

        static public List<Procedure> DFS(Graph<Procedure> cg)
        {
            HashSet<Procedure> todo = new HashSet<Procedure>(cg.Nodes);
            List<Procedure> result = new List<Procedure>();

            foreach (Procedure p in cg.Nodes.Where(p => cg.Predecessors(p).Count() == 0))
            {
                todo.Remove(p);
                result.Add(p);
            }

            int curr = 0;
            while (todo.Count > 0 && curr < result.Count)
            {
                foreach (var s in cg.Successors(result.ElementAt(curr)))
                    if (todo.Contains(s))
                    {
                        result.Insert(curr + 1, s);
                        todo.Remove(s);
                    }
                curr++;
            }

            if (todo.Count > 0)
                result.AddRange(todo);

            return result;
        }

        static public List<Procedure> BottomUp(Graph<Procedure> cg)
        {
            HashSet<Procedure> todo = new HashSet<Procedure>(cg.Nodes);
            List<Procedure> result = new List<Procedure>();

            foreach (Procedure p in cg.Nodes.Where(p => cg.Successors(p).Count() == 0))
            {
                todo.Remove(p);
                result.Add(p);
            }

            int curr = 0;
            while (todo.Count > 0 && curr < result.Count)
            {
                foreach (var p in cg.Predecessors(result.ElementAt(curr)))
                    if (todo.Contains(p))
                    {
                        result.Add(p);
                        todo.Remove(p);
                    }
                curr++;
            }

            if (todo.Count > 0)
                result.AddRange(todo);

            return result;
        }

        static public void WriteCallGraph(string filename, Graph<Procedure> callGraph)
        {
            TextWriter output = new StreamWriter(filename + ".dot");
            var leaves =
                callGraph.Nodes.Where(p => callGraph.Successors(p).Count() == 0);
            output.Write(callGraph.ToDot(p => p.ToString(),
                p =>
                    leaves.Contains(p) ? "[shape=box style=filled fillcolor=yellow]" : "[shape=oval]"));
            output.Close();
        }
    }

}
