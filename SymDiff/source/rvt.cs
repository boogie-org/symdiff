
using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Text;
using System.IO;
using System.Diagnostics;

namespace DECOMPOSE_CS
{

    public static class Options
    {

        public const bool Refine = false; // when equivalence check fails, it will attempt to inline its nonrecursive children up to recursive functions.
                                         // TODO: the refinement 1) can go into SCCs (i.e., inline some functions in SCCS unlike today), as long as enough edges (calls) are replaced with UFs so as all cycles are broken, and 2) should follow a counterexaple. Extract from the ce the UFs that are being invoked and only refine them. 
        
        public const string SCC_PREFIX = "S";
        public const string NODE_PREFIX = "n";
        public const bool S_OPTIMIZATION_FLAG = true;
        public const string COMMAND = "minisat+_64-bit_static.exe ";
        public const string Negated_solutions_file = "negated_solutions";

        public const string EquivColor = "green";
        public const string EquivSyntacticColor = "green4";
        public const string DoomedColor = "grey"; // doom = never checked
    }



    public static class Utils
    {

        public static void print_vec(List<int> v)
        {
            Console.Write("{ ");
            foreach (int i in v) Console.Write(i + " ");
            Console.Write("} ");
        }

        public static void print_set(HashSet<int> v)
        {
            Console.Write("{ ");
            foreach (int i in v) Console.Write(i + " ");
            Console.Write("} ");
        }

        public static StringBuilder name(int i, int j, string[] names, string[] names_other)
        {
            StringBuilder s = new StringBuilder();
            string separator = "--";
            string s1 = i >= 0 ? names[i] : "";
            string s2 = j >= 0 ? names_other[j] : "";
            if (s1.Equals(s2)) s.Append("\"" + s1 + "\"");
            else s.Append("\"" + s1 + separator + s2 + "\"");
            return s;
        }

        public static void Abort(string s, int i = 1)
        {
            Console.WriteLine("\n" + s.ToString() + " Aborting.");
            Environment.Exit(i);
        }

        public static bool vec_contains(List<int> a, List<int> b)
        {
            Debug.Assert(b.Count > 0);
            if (a == null) return false;
            a.Sort();
            foreach (int i in b) if (a.BinarySearch(i) < 0) return false;
            return true;
        }

        public static int Run(string Command)
        {
            {
                int ExitCode;
                ProcessStartInfo ProcessInfo;
                Process Process;

                ProcessInfo = new ProcessStartInfo("cmd.exe", "/C " + Command);
                ProcessInfo.CreateNoWindow = true;
                ProcessInfo.UseShellExecute = false;
                Process = Process.Start(ProcessInfo);
                Process.WaitForExit();
                ExitCode = Process.ExitCode;
                Process.Close();
                return ExitCode;
            }
        }
    }


    public class mygraph
    {
        int _size;
        public bool[] node_reported; // for testing the input	
        bool[,] G;
        public int[] nodes_index;
        public int[] nodes_lowlink;
        public int[] map; // maps function to SCC index

        public mygraph() { }

        public mygraph(int n)
        {

            nodes_index = new int[n];
            nodes_lowlink = new int[n];
            map = new int[n];
            for (int i = 0; i < n; ++i)
            {

                nodes_index[i] = nodes_lowlink[i] = -1;
                map[i] = -1;
            }
            init_graph(n);
        }

        public mygraph(mygraph othergraph) // copy constructor. Copies only info that is needed by is_cyclic. Do not reuse without checking what info. is needed.
        {
            _size = othergraph.size();
            G = new bool[_size, _size];
            for (int i = 0; i < _size; ++i)
                for (int j = 0; j < _size; ++j) G[i, j] = othergraph.G[i, j];
        }

        public void init_graph(int n) // here we initialize information that is also relevant to the dags later on.
        {
            _size = n;
            node_reported = new bool[n];
            for (int i = 0; i < n; ++i)
            {
                node_reported[i] = false;
            }
            G = new bool[n, n];
            for (int i = 0; i < n; ++i)
                for (int j = 0; j < n; ++j) G[i, j] = false;
        }

        public void declare(List<Tuple<int, int>> edges)
        {
            foreach (var e in edges) edge(e.Item1, e.Item2);
        }

        public void edge(int i, int j)
        {
            if (i >= _size || j >= _size) Utils.Abort("in edge(): reported edge out of range");
            G[i, j] = true;
            node_reported[i] = node_reported[j] = true;
        }

        public void remove_edge(int i, int j)
        {
            if (i >= _size || j >= _size) Utils.Abort("in remove_edge(): reported edge out of range");
            G[i, j] = false;
        }

        public bool is_edge(int i, int j)
        {
            if (i >= _size || j >= _size) Utils.Abort("in is_edge(): reported edge out of range");
            return G[i, j] ? true : false;
        }

        public void get_children(int i, ref List<int> res)
        {
            Debug.Assert(i < _size);
            for (int j = 0; j < _size; ++j)
                if (G[i, j]) res.Add(j);
        }

        public void get_parents(int i, ref List<int> res)
        {
            Debug.Assert(i < _size);
            for (int j = 0; j < _size; ++j)
                if (G[j, i]) res.Add(j);
        }

        public int indegree(int i)
        {
            int count = 0;
            for (int j = 0; j < _size; ++j)
            {
                if (G[j, i]) ++count;
            }
            return count;
        }

        public bool is_cyclic()
        {
            /******************************************************************************************************* 
            Name: is_cyclic
            Sideeffect: destroys the object.
            Purpose: Checks whtehr the object graph is cyclic. 
            Algorithm: Removes nodes with indegree 0 until no such nodes. Then checks if any node remains.
            Complexity: quadratic in the number of nodes. 
            *******************************************************************************************************/
            int removed = 0;

            int[] in_deg = new int[_size]; // in degree
            Stack check = new Stack(); // stack

            for (int i = 0; i < _size; ++i)
            {
                in_deg[i] = indegree(i);
                if (in_deg[i].Equals(0)) check.Push(i);
            }
            while (check.Count > 0)
            {
                int i = (int)check.Pop();
                Debug.Assert(in_deg[i] == 0);
                removed++;
                for (int j = 0; j < _size; ++j)
                {
                    if (G[i, j])
                    {
                        G[i, j] = false;
                        --in_deg[j];
                        if (in_deg[j] == 0) check.Push(j);
                    }
                }
            }
            Debug.Assert(removed <= _size);
            return removed != _size;
        }

        public List<int> get_neighbors(List<int> S, List<int> scc, int root)
        {
            /******************************************************************************************************* 
            name: get_neighbors
            Purpose: returns a subset of S, equal to root + anything in S that can be reached from root not through 
            any other node in S. The idea: these constitute a sufficient condition for root to fail the proof. 
            Example: scc = {f <-> g, g <-> h }, and S = {f,g,h}. If f fails, then we must remove from S either f or
            g, regardless of what we do with h. Hence here we return {f,g}. In the calling function 
            (add_negated_solution), we will add a constraint that one of {f,g} should not be in S, which is more
            powerfule than doing the same for the original S, i.e., {f,g,h}.
            Precondition: S cuts all cycles in scc (it will go into an infinite loop otherwise!).
            ********************************************************************************************************/
            List<int> res = new List<int>();
            Stack stack = new Stack();
            if (S.Count == 1) return S; // cannot make S smaller anyway.
            scc.Sort();
            S.Sort();
            //assert(includes(scc.begin(), scc.end(), S.begin(), S.end()));
            res.Add(root);
            for (int i = 0; i < _size; ++i)
            {	// add immediate neighbors in scc			
                if (G[root, i] &&
                    (root != i)) // root was already added to res anyway
                    if (scc.BinarySearch(i) >= 0) stack.Push(i);
            }
            while (stack.Count > 0)
            {
                int node = (int)stack.Pop();
                if (S.BinarySearch(node) >= 0) res.Add(node);
                else
                    for (int i = 0; i < _size; ++i)
                    {
                        if (G[node, i])
                            if (scc.BinarySearch(i) >= 0) stack.Push(i);
                    }
            }
            if (res.Count != S.Count)
            {
                Console.Write("* Generalized counterexample to: ");
                Utils.print_vec(res);
                Console.WriteLine();
            }
            return res;
        }

        public void todotty(string file_name, string prefix = Options.NODE_PREFIX)
        {
            StringBuilder s = new StringBuilder();
            s.Append(file_name.ToString() + ".gv");
            System.IO.StreamWriter dotty = new System.IO.StreamWriter(s.ToString());
            dotty.WriteLine("digraph G{");
            dotty.WriteLine(file_name.ToString() + "[style=filled, color = lightblue, shape = box];");
            for (int j = 0; j < _size; j++) if (node_reported[j]) dotty.WriteLine(prefix + j + ";"); // necessary for dotty to maintain a consistent layout with the final graph.
            for (int j = 0; j < _size; j++)
                for (int i = 0; i < _size; i++)
                    if (G[i, j]) dotty.WriteLine(prefix + i + "->" + prefix + j);
            dotty.WriteLine("}");
            dotty.Close();
        }

        public void todotty_final(string file_name, DAG dag, bool[] is_equivalent, bool[] syntactic_equivalent, List<int> Loop_functions, int[] mapf, string[] names, string[] names_other)
        {
            bool[] doomed = new bool[_size];
            for (int i = 0; i < _size; ++i) doomed[i] = true;
            for (int i = 0; i < dag.size(); ++i)
            {
                if (!dag.is_doomed[i])
                    for (int j = 0; j < dag.get_SCC_line(i).Count; ++j) doomed[dag.get_SCC_line(i)[j]] = false;
            }
            StringBuilder s = new StringBuilder();
            s.Append(file_name.ToString() + ".gv");
            System.IO.StreamWriter dotty = new System.IO.StreamWriter(s.ToString());
            dotty.WriteLine("digraph G{ ");
            dotty.WriteLine(file_name + "[style=filled, color = lightblue, shape = box];");
            for (int j = 0; j < _size; j++)
            {
                if (!node_reported[j]) continue;
                dotty.Write(Utils.name(j, mapf[j], names, names_other).ToString());
                if (doomed[j] || (mapf[j] == -1)) dotty.WriteLine("[style = filled];"); // here we mark unmapped that are part of SCCs as they were doomed. 
                else dotty.WriteLine("[style = empty];");
            }
            dotty.WriteLine("node [style = filled, color = " + Options.DoomedColor + "];");
            for (int j = 0; j < _size; j++)
                if (is_equivalent[j])
                {
                    if (syntactic_equivalent[j])
                        dotty.WriteLine(Utils.name(j, mapf[j], names, names_other).ToString() + "[style = filled, color = " + Options.EquivSyntacticColor + "];");
                    else dotty.WriteLine(Utils.name(j, mapf[j], names, names_other).ToString() + "[style = filled, color = " + Options.EquivColor + "];");
                }

            for (int j = 0; j < _size; j++)
                for (int i = 0; i < _size; i++)
                    if (G[i, j])
                    {
                        dotty.Write(Utils.name(i, mapf[i], names, names_other).ToString() + "->" + Utils.name(j, mapf[j], names, names_other).ToString());
                        if (Loop_functions.Contains(j)) dotty.WriteLine("[style = dotted]"); else dotty.WriteLine();
                    }
            dotty.WriteLine("}");
            dotty.Close();
        }

        public int size() { return _size; }
    }

    public class DAG : mygraph
    {
        public mygraph cg; // the call graph associated with this DAG
        int index;
        int scc_count;

        Stack stack;
        public List<bool> is_recursive;	// whether a node in the scc DAG is recursive
        public bool[] is_doomed;		// whether a node in the scc DAG should not be checked, because either it or one of its descendants are recursive and cannot be proven equivalent. 
        List<List<int>> SCC_list = new List<List<int>>();

        public DAG(mygraph call_graph)
        {
            cg = call_graph;
            is_recursive = new List<bool>(); // refers to the DAG, whose size is bounded by n, the size of the original call graph.            
        }

        public bool get_is_SCC_recursive(int i) { return is_recursive[i]; } // if there is more than one element it is true for all of them anyway.

        public List<int> get_SCC_line(int i) { return SCC_list[i]; }

        /// <summary>
        /// Marks ancestors as doom. Generally doom = unchecked, other than nonmapped in SCCs.
        /// </summary>
        /// <param name="i">root</param>
        /// <param name="mark">whether to mark the root itself as doom. Generally yes other than the case in which the root was checked. </param>
        /// <param name="side1"> side 1 or 2 </param>
        public void mark_ancestors_as_doomed(int i, bool mark = true, bool side1 = true)
        {
            if (is_doomed[i]) return;
            if (mark) is_doomed[i] = true;
            if (side1) Console.Write("Side 1:");
            else Console.Write("Side 2:");
            Console.WriteLine("SCC " + Options.SCC_PREFIX + i + " is doomed.");
            for (int j = 0; j < size(); j++)
            {
                if (is_edge(j, i)) mark_ancestors_as_doomed(j, true, side1);
            }
        }

        void print_SCCs(List<List<int>> SCC_list)
        {
            Console.Write("SCCs: ");
            for (int i = 0; i < SCC_list.Count; ++i) { Utils.print_vec(SCC_list[i]); Console.Write(";"); }
            Console.WriteLine();
            for (int i = 0; i < size(); ++i) Console.WriteLine(i + " mapped to SCC " + cg.map[i]);
        }

        public void build_DAG()
        {
            init_graph(scc_count);
            for (int i = 0; i < cg.size(); ++i)
            {
                for (int j = 0; j < cg.size(); ++j)
                {
                    if (cg.is_edge(i, j) && cg.map[i] != cg.map[j]) edge(cg.map[i], cg.map[j]);
                }
            }
        }

        public void compute_SCCs()
        {
            List<List<int>> res = new List<List<int>>();
            index = 0;
            scc_count = 0;
            stack = new Stack();
            for (int i = 0; i < cg.size(); ++i)
                if (cg.nodes_index[i] == -1 && cg.node_reported[i]) tarjan(i);
            print_SCCs(SCC_list);
            is_doomed = new bool[scc_count];
        }

        /// <summary>
        /// Computes SCCs and updates the SCC list "SCC_list". Based on Tarjan's algorithm.
        /// </summary>
        /// <param name="v"> root</param>
        /// <param name="cg"> graph</param>
        void tarjan(int v)
        {
            cg.nodes_index[v] = index;
            cg.nodes_lowlink[v] = index;
            index++;
            stack.Push(v);
            for (int i = 0; i < cg.size(); ++i)
            {
                if (cg.is_edge(v, i))
                {
                    if (cg.nodes_index[i] == -1)
                    {
                        tarjan(i);
                        cg.nodes_lowlink[v] = Math.Min(cg.nodes_lowlink[v], cg.nodes_lowlink[i]);
                    }
                    else
                        if (stack.Contains(i)) cg.nodes_lowlink[v] = Math.Min(cg.nodes_lowlink[v], cg.nodes_index[i]);
                }
            }
            if (cg.nodes_lowlink[v] == cg.nodes_index[v])
            {
                int n;
                List<int> component = new List<int>();
                do
                {
                    n = (int)stack.Pop();
                    component.Add(n);
                    cg.map[n] = scc_count;
                } while (n != v);
                SCC_list.Add(component);
                is_recursive.Add(component.Count > 1 || cg.is_edge(v, v));  // for each component, marks whether it is recursive
                scc_count++;
            }
        }

        void reset_SCC() { SCC_list.Clear(); }

        public int get_map_element(int i) { return cg.map[i]; }
    }



    public class Solve
    {
        const string node1 = "S", node2 = "D";  // must be different
        const string Edge1_prefix = "es", Edge2_prefix = "ed"; // must be different
        int side1_size, side2_size;
        public int dag1_size;
        System.IO.StreamWriter cnf;
        int iteration = 0;  // used in build_SCC_map
        public int[] mapf1;	// mapping of functions (side 1 |-> side 2)
        public int[] mapf2;	// mapping of functions (side 2 |-> side 1) 
        public int[] mapm;	// mapping between SCCs

        public bool[] is_equivalent1;	// whether a cg0 node was proven equivalent  
        public bool[] is_equivalent2;	// whether a cg1 node was proven equivalent          
        public bool[] syntactic_equivalent;	// in the stub Check and check_recursive, this input vector determines whether the result is true or false          

        Dictionary<string, int> map_var2idx = new Dictionary<string, int>();  // for modeling the optimization problem of find_S. maps between variable names and their index in the optimization model.

        public Solve(int n1, int n2)
        {
            side1_size = n1;
            side2_size = n2;
            is_equivalent1 = new bool[n1];
            is_equivalent2 = new bool[n2];
            syntactic_equivalent = new bool[n1];
        }

        public void map_functions(int n1, int n2, List<Tuple<int, int>> mapf, List<int> empty1, List<int> empty2, mygraph cg1, mygraph cg2)
        {
            mapf1 = new int[n1];
            mapf2 = new int[n2];
            for (int i = 0; i < n1; ++i) mapf1[i] = -1;
            for (int i = 0; i < n2; ++i) mapf2[i] = -1;
            foreach (var m in mapf)
            {
                mapit(m.Item1, m.Item2);
                // Unconnected functions that are mapped and not empty (i.e., they have an implementation in boogie), are marked for the sake of the graphs in the end.
                if (!empty1.Contains(m.Item1)) cg1.node_reported[m.Item1] = true; 
                if (!empty2.Contains(m.Item2)) cg2.node_reported[m.Item2] = true; 
            }
        }

        public void declare_syntactic_equivalent(List<int> syntactic_equivalent_list)
        {
            foreach (int i in syntactic_equivalent_list)
            {
                if (i >= side1_size) Utils.Abort("Reported syntactically equivalent function outside of range");
                syntactic_equivalent[i] = true;
            }
        }


        void init_negated_solutions_file()
        {
            StringBuilder s = new StringBuilder();
            s.Append("echo * negated solutions: > " + Options.Negated_solutions_file);
            Utils.Run(s.ToString());
        }

        public void mapit(int i, int j)
        {
            /******************************************************************************************************* 
            Name: mapit
            Precondition: mapf1 and mapf2 were allocated the graph size.
            *******************************************************************************************************/
            if (i >= side1_size || j >= side2_size) Utils.Abort("in mapit(): Attempted mapping of non existing nodes.");
            int check_double = 0;
            if (mapf1[i] != -1) check_double = 1;
            if (mapf2[j] != -1) check_double = 2;
            if (check_double > 0)
            {
                StringBuilder s = new StringBuilder();
                s.Append("in mapit(): Double mapping for function " + (check_double == 0 ? i : j) + " on side " + check_double + ". ");
                Utils.Abort(s.ToString());
            }
            mapf1[i] = j;
            mapf2[j] = i;            
        }

        public bool build_SCC_map(ref DAG dag1, ref DAG dag2)
        {
            ++iteration;
            Console.WriteLine("Building_SCC_map, iteration " + iteration);
            bool changed = false;
            bool[,] a = new bool[dag1.size(), dag2.size()];  // a is a matrix of size dag1.size x dag2.size. a[i,j] = true iff there is a pair (f,f') \in mapf1 such that scc(f) = i, scc(f') = j and these sccs are not doomed.
            mapm = new int[dag1_size];
            for (int i = 0; i < dag1_size; ++i) mapm[i] = -1;

            // filling the matrix	
            for (int i = 0; i < side1_size; ++i)
                if (mapf1[i] >= 0) // some functions are mapped to -1 in mapf1, which means that they are not mapped
                {
                    int m1 = dag1.get_map_element(i), // get_map_element uses 'map' - a mapping from functions to SCCs
                        m2 = dag2.get_map_element(mapf1[i]);
                    if (m1 < 0 || m2 < 0) continue; 
                    if (!dag1.is_doomed[m1] && !dag2.is_doomed[m2]) a[m1, m2] = true;
                }

            // examining result: vertical (dag2)
            bool[] dag2_matches = new bool[dag2.size()];
            for (int i = 0; i < dag2.size(); ++i) dag2_matches[i] = false;
            int mycount;
            for (int j = 0; j < dag2.size(); ++j)
            {
                if (!(dag2.get_is_SCC_recursive(j)))
                {
                    int f = dag2.get_SCC_line(j)[0];
                    if (!is_mapped1(f)) dag2.is_doomed[j] = true;
                }
                if (dag2.is_doomed[j]) continue;

                mycount = 0;
                for (int i = 0; i < dag1.size(); ++i)
                    if (a[i, j]) mycount++;
                switch (mycount)
                {
                    case 0:
                        Console.WriteLine("DAG 2: S" + j + " cannot be mapped and cannot be inlined. Ancestors are doomed.");
                        dag2.mark_ancestors_as_doomed(j, true, false);
                        changed = true;
                        break;
                    case 1:
                        dag2_matches[j] = true;
                        break;
                    default:
                        Console.WriteLine("DAG 2: S" + j + " is mapped to more than one SCC on side 1. Ancestors are doomed.");
                        dag2.mark_ancestors_as_doomed(j, true, false);
                        changed = true;
                        break;
                }
            }

            // examining result: horizontal (dag1)

            mycount = 0;
            for (int j = 0; j < dag1.size(); j++)
            {
                if (!(dag1.get_is_SCC_recursive(j)))
                {
                    int f = dag1.get_SCC_line(j)[0];
                    if (!is_mapped(f)) dag1.is_doomed[j] = true;
                }
                if (dag1.is_doomed[j]) continue;
                mycount = 0;
                for (int i = 0; i < dag2.size(); ++i) if (a[j, i]) ++mycount;
                Console.Write("DAG 1: S" + j + " ");
                switch (mycount)
                {
                    case 0:
                        Console.WriteLine("cannot be mapped and cannot be inlined. Ancestors are doomed.");
                        dag1.mark_ancestors_as_doomed(j);
                        changed = true;
                        break;
                    case 1:
                        {
                            int to = -1;
                            for (int i = 0; i < dag2.size(); ++i) if (a[j, i]) { to = i; break; }

                            if (dag2_matches[to])
                            {
                                mapm[j] = to;
                                dag1.node_reported[j] = dag2.node_reported[to] = true;
                                Console.WriteLine("is mapped to DAG 2: S" + to);
                            }
                            else
                            {
                                Console.WriteLine("can only be mapped to DAG 2: S" + to + ", which is doomed. Hence ancestors are doomed.");
                                dag1.mark_ancestors_as_doomed(j);
                                changed = true;
                            }
                            break;
                        }
                    default:
                        Console.WriteLine("is mapped to more than one SCC on side 2! ancestors are doomed.");
                        dag1.mark_ancestors_as_doomed(j);
                        changed = true;
                        break;
                }
            }
            return changed;
        }
        /// <summary>
        /// Purpose: Given two DAGs dag1 and dag2, we want to check whether the mapping 'mapm' between them is 
        ///    consistent in terms of the path, i.e., whether there is a path m1 -~-> m2 in dag1 and a path n1 -~-> n2 
        ///    in dag2, such that (m1,n2) \in mapm and (m2, n1) \in mapm. If yes we return false and later abort. The
        ///    check refers to nondoomed nodes only.
        ///    precondition: bijective mapping between the nodes of the SCCs. if (i,j) \in mapm then either both are 
        ///    doomed or both are not.
        ///    Algorithm: basically take the union of the graphs (matching nodes by mapm) and check for circularity. 
        ///    in practice this is done by adding edges to dag1. 
        /// </summary>
        /// <param name="dag1"> SCC dag of side 1 </param>
        /// <param name="dag2"> SCC dag of side 2 </param>
        /// <returns> true <-> the mapping between the nodes of dag1 / dag2 is consistent </returns>
        public bool is_map_consistent(DAG dag1, DAG dag2)
        {
            Console.WriteLine("\nChecking map consistency");
            List<int> children = new List<int>();
            for (int i = 0; i < dag1_size; ++i)
            {
                if (dag1.is_doomed[i] || mapm[i] < 0) continue;
                Debug.Assert(!dag2.is_doomed[mapm[i]]); // undoomed cannot be mapped to doomed
                children.Clear();
                dag2.get_children(mapm[i], ref children);
                for (int j = 0; j < children.Count; ++j)
                {
                    int target = dag1_size;
                    //! if we do not remove unmapped then add here: if (children[j] is unmapped add its children to children and continue)
                    int child = children[j];
                    if (!dag2.is_recursive[child])
                    {
                        int f = dag2.get_SCC_line(child)[0];
                        if (!is_mapped1(f))
                        {
                            List<int> grandchildren = new List<int>();
                            dag2.get_children(child, ref grandchildren);
                            children.InsertRange(children.Count, grandchildren);
                            continue;
                        }
                    }

                    for (int k = 0; k < dag1_size; ++k) if (mapm[k] == children[j]) { target = k; break; }
                    Debug.Assert(target < dag1_size); // assserting that we found it. 
                    dag1.edge(i, target);
                }
            }
            dag1.todotty("consistency_check", Options.SCC_PREFIX);
            mygraph local = new mygraph(dag1); // because is_cyclic destructs the object
            if (local.is_cyclic()) return false;
            return true;
        }

        bool compatible(HashSet<int> s0, HashSet<int> s1)
        {
            /******************************************************************************************************* 
            Name: compatible
            purpose: checks if s0 and s1 contain the same functions modulo mapf1
            *******************************************************************************************************/
            if (s0.Count != s1.Count) return false;
            HashSet<int> mapped_set = new HashSet<int>();
            foreach (int i in s0) mapped_set.Add(mapf1[i]);
            return mapped_set.SetEquals(s1);
        }

        public bool check_UF_compatibility(int f1, List<int> S, DAG dag1, DAG dag2, ref HashSet<int> inlined1, ref HashSet<int> inlined2,
            ref bool all_children_equiv, bool refine)
        {
            /******************************************************************************************************* 
            Name: check_UF_compatibility
            Purpose: checks that f1 and its counterpart (mapf1(f1)) call the same UFs. Otherwise this path will be 
            doomed. 
            Algorithm: builds lists uf1, uf2 of UFs: all the children that are equivalent or in S. BUT: because of
            inlining, the children of the inlined functions also matter. For example f -> g -> h, where we currently
            check f and g is inlined. If h is equivalent or in S then it will also enter uf1. 
            Note1: there are three types of inlining: 
            a. unmatched nonrecursive functions. These are eliminated before getting here, in remove_unmapped(). 
            b. matched nonrecursive that failed equivalence check.
            c. nodes in the SCC which are not in S. 
            Note2: when f1 + mapf1(f1) are not recursive, will be called with S = 0; 
            *******************************************************************************************************/

            List<int> children = new List<int>();
            HashSet<int> uf1 = new HashSet<int>(), uf2 = new HashSet<int>();
            mygraph cg1 = dag1.cg, cg2 = dag2.cg;

            // side 1
            cg1.get_children(f1, ref children);

            for (int i = 0; i < children.Count; ++i)
            {
                int child = children[i];
                if (is_equivalent1[child] && (!refine || dag1.get_is_SCC_recursive(cg1.map[child]))) { uf1.Add(child); continue; }
                if (S.Contains(child)) { uf1.Add(child); continue; }
                inlined1.Add(child);
                List<int> grandchildren = new List<int>();
                cg1.get_children(child, ref grandchildren);
                children.InsertRange(children.Count, grandchildren); // adds grandchildren to the end of the children list
                all_children_equiv = false;
            }

            // side 2
            List<int> S2 = new List<int>(); // The S set for side 2
            for (int j = 0; j < S.Count; ++j) S2.Add(mapf1[S[j]]);
            children.Clear();
            cg2.get_children(mapf1[f1], ref children);

            for (int i = 0; i < children.Count; ++i)
            {
                int child = children[i];
                if (is_equivalent2[child] && (!refine || dag2.get_is_SCC_recursive(cg2.map[child]))) { uf2.Add(child); continue; }
                if (S2.Contains(child)) { uf2.Add(child); continue; }
                inlined2.Add(child);
                List<int> grandchildren = new List<int>();
                cg2.get_children(child, ref grandchildren);
                children.InsertRange(children.Count, grandchildren);
                all_children_equiv = false;
            }


            if (compatible(uf1, uf2))
            {	// example: let f2 = mapf1[f1]. Suppose f1,f2 are in S, but f1 has self loop and f2 doesn't. Then f1 calls a UF(f1) which f2 doesn't. Such cases have little chance to succeed.
                Console.Write("Side 1: calls to ");
                Utils.print_set(uf1);
                Console.WriteLine(" are replaced with UFs");
                Console.Write("Side 1: the following are inlined:");
                Utils.print_set(inlined1);
                Console.WriteLine();
                Console.Write("Side 2: calls to ");
                Utils.print_set(uf2);
                Console.WriteLine(" are replaced with UFs");
                Console.Write("Side 2: the following are inlined:");
                Utils.print_set(inlined2);
                Console.WriteLine();
                return true;
            }
            else return false;
        }

        public bool Check(int f1, List<int> S, DAG dag1, DAG dag2)
        {
            Console.WriteLine("Check (" + f1 + "," + mapf1[f1] + ")");

            HashSet<int> inlined1 = new HashSet<int>(), inlined2 = new HashSet<int>(), 
                inlined1_prev = new HashSet<int>(), inlined2_prev = new HashSet<int>();
            bool all_children_equiv = true;
            bool refine = false;
            while (true)
            {
                if (!check_UF_compatibility(f1, S, dag1, dag2, ref inlined1, ref inlined2, ref all_children_equiv, refine))
                {
                    Console.WriteLine("Side1: " + f1 + " and Side2: " + mapf1[f1] + " call different UFs.");
                    if (refine || !Options.Refine) return false;
                }
                if (refine && inlined1_prev.SetEquals(inlined1) && inlined2_prev.SetEquals(inlined2))
                {                  
                    Console.WriteLine("Nothing to refine");
                    return false; // we get here only if it failed the first time.
                }
                if (refine) Console.WriteLine("*  rechecking refined formula");
                Console.Write("Syntactic-equivalence test: ");
                if (syntactic_equivalent[f1] && all_children_equiv)
                {
                    Console.WriteLine("passed.");
                    return true;
                }
                else
                {
                    Console.WriteLine("failed.");
                    Console.WriteLine("Semantic equivalence check:");
                    Console.WriteLine("-*-*-*-*-*-*-*  In  -*-*-*-*-*-*-*-*-*-*-");
                    bool res = RVT.RVTCheck.RVTCheckEq(f1, inlined1, inlined2, dag1.get_is_SCC_recursive(dag1.cg.map[f1]));  // calling symdiff
                    Console.WriteLine("-*-*-*-*-*-*-*  Out -*-*-*-*-*-*-*-*-*-*-");
                    Console.WriteLine("Back from semantic equivalence check");
                    if (res || refine || !Options.Refine) return res;
                }
                Debug.Assert(Options.Refine);
                refine = true;
                Console.WriteLine("Refining (inlining nonrecursive functions)...");
                foreach (int i in inlined1) inlined1_prev.Add(i);
                foreach (int i in inlined2) inlined2_prev.Add(i);
            }
        }

        List<int> stub_find_S(List<int> scc1, List<int> scc2)
        {
            for (int i = 0; i < scc1.Count; ++i) if (!is_mapped(scc1[i])) scc1.RemoveAt(i);
            Console.Write("find_S: stub returns mapped elements in scc1 ");
            Utils.print_vec(scc1);
            Console.WriteLine();
            return scc1;
        }

        public void mark_equivalent(int i)
        {
            is_equivalent1[i] = true;
            is_equivalent2[mapf1[i]] = true;
            Console.WriteLine("mark_equivalent(" + i + "," + mapf1[i] + ")");
        }

        public void decompose(ref DAG dag1, ref DAG dag2)
        {
            // assumes DAG is sorted bottom up	
            List<int> S = new List<int>();
            Console.WriteLine("==== Decomposing ====");
            for (int scc_index = 0; scc_index < dag1.size(); ++scc_index)
            {
                Console.Write("\nNow solving SCC " + Options.SCC_PREFIX + scc_index + " ");
                if (dag1.is_doomed[scc_index])
                {
                    Console.WriteLine(": doomed");
                    continue;
                }
                List<int>
                    scc1 = dag1.get_SCC_line(scc_index),
                    scc2 = dag2.get_SCC_line(mapm[scc_index]);
                Utils.print_vec(scc1);
                if (!dag1.get_is_SCC_recursive(scc_index)) Console.Write(" -- non-recursive");
                Console.WriteLine();


                // if (m0,m1) \in mapm and one is recursive whereas the other is not, we doom the path.
                if (dag1.get_is_SCC_recursive(scc_index) != dag2.get_is_SCC_recursive(mapm[scc_index]))
                {
                    Console.Write("Side 1: S" + scc_index);
                    if (dag1.get_is_SCC_recursive(scc_index)) Console.Write(" is "); else Console.Write(" is not ");
                    Console.Write("recursive, whereas ");
                    Console.Write("Side 2: S" + mapm[scc_index]);
                    if (dag2.get_is_SCC_recursive(mapm[scc_index])) Console.Write(" is "); else Console.Write(" is not ");
                    Console.WriteLine(" recursive. Aborting branch.");
                    dag1.mark_ancestors_as_doomed(scc_index);
                    dag2.mark_ancestors_as_doomed(mapm[scc_index], true, false);
                    continue;
                }

                if (!dag1.get_is_SCC_recursive(scc_index))
                { // trivial MSSCs
                    S.Clear(); // This is the only difference from the recursive case.
                    if (Check(scc1[0], S, dag1, dag2)) mark_equivalent(scc1[0]);
                }
                else
                {
                    bool ok_flag;
                    mygraph cg1 = dag1.cg, cg2 = dag2.cg;
                    List<int>[] save_solutions = new List<int>[cg1.size()];
                    if (Options.S_OPTIMIZATION_FLAG) init_negated_solutions_file();
                    while (true)
                    {
                        int failing_node = -1;
                        ok_flag = true;
                        S = Find_S(scc_index, cg1, cg2, scc1, scc2);
                        // stub_find_S(scc0, scc1); // if we want to avoid minisat, can use this alternative, which returns the intersection between scc0, scc1. This is unsound if the intersection does not break all cycles.
                        if (S.Count == 0) { ok_flag = false; break; }
                        // "for all <f,g> \in S if !Check2(f,g,S) abort." 
                        for (int i = 0; i < S.Count; ++i)
                        {
                            if (Options.S_OPTIMIZATION_FLAG)
                            {
                                if (Utils.vec_contains(save_solutions[S[i]], S))
                                {
                                    Console.WriteLine("* Recycled solution for " + Options.NODE_PREFIX + S[i]);
                                    continue;
                                }
                                else
                                {
                                    ok_flag = Check(S[i], S, dag1, dag2);
                                    if (ok_flag) save_solutions[S[i]] = S;
                                }
                            }
                            else ok_flag = Check(S[i], S, dag1, dag2);
                            if (!ok_flag)
                            {
                                failing_node = S[i];
                                break;
                            }
                        }
                        if (ok_flag || !Options.S_OPTIMIZATION_FLAG || scc1.Count == 1) break;
                        Console.WriteLine("\nTrying a different set S");
                        add_negated_solution(S, scc1, cg1, failing_node);
                    }
                    if (!ok_flag)
                    {
                        Console.WriteLine("failed on recursive functions. Aborting this branch.");
                        dag1.mark_ancestors_as_doomed(scc_index, false);
                        dag2.mark_ancestors_as_doomed(mapm[scc_index], false, false);
                    }
                    //  for all <f,g> \in S mark <f,g> as "equivalent"
                    else
                        foreach (int i in S) mark_equivalent(i);
                }
            }
        }

        public bool is_mapped(int i) { return mapf1[i] >= 0; }

        public bool is_mapped1(int i) { return mapf2[i] >= 0; }

        public bool[] get_syntactic_equivalent2(int n2)
        {  // we only save this info for side 1. So this method converts this info to side 2.
            bool[] synt_equiv2 = new bool[n2];
            for (int i = 0; i < n2; ++i) synt_equiv2[i] = false;
            for (int i = 0; i < syntactic_equivalent.Length; ++i)
                if (syntactic_equivalent[i] && mapf1[i] >= 0) synt_equiv2[mapf1[i]] = true;
            return synt_equiv2;
        }


        /******************************** find_S *************************************************/

        string E(string a, string b, string c)
        {
            return a + "_" + b + "_" + c;
        }

        void map_var_to_idx(List<int> scc1, List<int> scc2)
        {
            int size1 = scc1.Count,
                size2 = scc2.Count;
            int idx = 1;
            StringBuilder s = new StringBuilder(), s1 = new StringBuilder();
            for (int i = 0; i < size1; ++i) { s.Append(scc1[i]); map_var2idx[node1 + s.ToString()] = idx++; s.Clear(); } // nodes side 1
            for (int i = 0; i < size2; ++i) { s.Append(scc2[i]); map_var2idx[node2 + s.ToString()] = idx++; s.Clear(); } // nodes side 2
            for (int i = 0; i < size1; ++i) // edges side 1
                for (int j = 0; j < size1; ++j)
                {
                    s.Append(scc1[i]); s1.Append(scc1[j]);
                    map_var2idx[E(Edge1_prefix, s.ToString(), s1.ToString())] = idx++;
                    s.Clear(); s1.Clear();
                }

            for (int i = 0; i < size2; ++i) // edges side 2
                for (int j = 0; j < size2; ++j)
                {
                    s.Append(scc2[i]); s1.Append(scc2[j]);
                    map_var2idx[E(Edge2_prefix, s.ToString(), s1.ToString())] = idx++;
                    s.Clear(); s1.Clear();
                }
        }

        void imply(string lhs1, string lhs2, string rhs)
        {
            cnf.WriteLine(" -1*v" + map_var2idx[lhs1] + "  -1*v" + map_var2idx[lhs2] + " +1*v" + map_var2idx[rhs] + " >= -1;");
        }

        void negunit(string st)
        {
            cnf.WriteLine("-1*v" + map_var2idx[st] + " >= 0;");
        }

        void make_equal(string s1, string s2)
        {
            cnf.WriteLine("+1*v" + map_var2idx[s1] + " -1*v" + map_var2idx[s2] + " >= 0;");
            cnf.WriteLine("-1*v" + map_var2idx[s1] + " +1*v" + map_var2idx[s2] + " >= 0;");
        }

        void add_negated_solution(List<int> S, List<int> scc1, mygraph cg1, int failing_node)
        {
            StringBuilder s = new StringBuilder();
            s.Append("echo ");
            S = cg1.get_neighbors(S, scc1, failing_node); // optimization. Generalizes the counterexample.
            for (int i = 0; i < S.Count; ++i)
            {
                int j;
                for (j = 0; j < scc1.Count; ++j) if (scc1[j] == S[i]) break;
                int idx = j;
                Debug.Assert(idx < scc1.Count); // we found it;
                s.Append(" +1*v");
                j = idx + 1;
                s.Append(j);
            }
            s.Append(" ^>= 1;>> " + Options.Negated_solutions_file + "\n"); // the '^>' produces '>' in windows.

            Utils.Run(s.ToString());

        }

        void add_constraints(mygraph cg1, mygraph cg2, List<int> scc1, List<int> scc2)
        {
            int size1 = scc1.Count,
                size2 = scc2.Count;
            bool[] mapped = new bool[1 + size1 + size2];
            cnf.WriteLine("* minimize chosen mapped nodes:");
            cnf.Write("min: ");

            for (int i = 0; i < size1; i++)
            {
                if (is_mapped(scc1[i]))
                {
                    cnf.Write("+1*v");
                    int t = i + 1; // the +1 is because the variables begin with 1, not 0.
                    cnf.Write(t);
                    // now we store which variables are mapped:
                    StringBuilder s0 = new StringBuilder(), s1 = new StringBuilder();
                    int j0, j1;
                    s0.Append(scc1[i]);
                    j0 = map_var2idx[node1 + s0.ToString()];
                    s1.Append(mapf1[scc1[i]]);
                    j1 = map_var2idx[node2 + s1.ToString()];
                    Debug.Assert(j0 <= size1 + size2 && j1 <= size1 + size2); // based on the assumption that the nodes are mapped to the lower indices of variables.
                    mapped[j0] = mapped[j1] = true;
                }
            }
            cnf.WriteLine(";");
            cnf.WriteLine("* unmapped variables are in:");
            for (int i = 1; i <= size1 + size2; ++i)  // unmapped variables are in.
                if (!mapped[i]) cnf.WriteLine("+1*v" + i + " >= 1;");

            cnf.WriteLine("* edges side 1:");
            for (int i = 0; i < size1; ++i) // edges side 1
                for (int j = 0; j < size1; ++j)
                {
                    if (cg1.is_edge(scc1[i], scc1[j]))
                    {
                        StringBuilder s = new StringBuilder(), s1 = new StringBuilder();
                        s.Append(scc1[i]);
                        s1.Append(scc1[j]);
                        imply(node1 + s.ToString(), node1 + s1.ToString(), E(Edge1_prefix, s.ToString(), s1.ToString()));
                    }
                }
            cnf.WriteLine("* edges side 2:");
            for (int i = 0; i < size2; ++i) // edges side 2
                for (int j = 0; j < size2; ++j)
                {
                    if (cg2.is_edge(scc2[i], scc2[j]))
                    {
                        StringBuilder s = new StringBuilder(), s1 = new StringBuilder();
                        s.Append(scc2[i]);
                        s1.Append(scc2[j]);
                        imply(node2 + s.ToString(), node2 + s1.ToString(), E(Edge2_prefix, s.ToString(), s1.ToString()));
                    }
                }

            cnf.WriteLine("* transitive closure side 1:");
            for (int i = 0; i < size1; ++i) // transitive closure side 1
                for (int j = 0; j < size1; ++j)
                {
                    if (i == j) continue;
                    for (int k = 0; k < size1; ++k)
                    {
                        if (j == k) continue;
                        StringBuilder s = new StringBuilder(), s1 = new StringBuilder(), s2 = new StringBuilder();
                        s.Append(scc1[i]);
                        s1.Append(scc1[j]);
                        s2.Append(scc1[k]);
                        imply(E(Edge1_prefix, s.ToString(), s1.ToString()), E(Edge1_prefix, s1.ToString(), s2.ToString()), E(Edge1_prefix, s.ToString(), s2.ToString()));
                        s.Clear(); s1.Clear(); s2.Clear();
                    }
                }

            cnf.WriteLine("* transitive closure side 2:");
            for (int i = 0; i < size2; ++i) // transitive closure side 2
                for (int j = 0; j < size2; ++j)
                {
                    if (i == j) continue;
                    for (int k = 0; k < size2; ++k)
                    {
                        if (j == k) continue;
                        StringBuilder s = new StringBuilder(), s1 = new StringBuilder(), s2 = new StringBuilder();
                        s.Append(scc2[i]);
                        s1.Append(scc2[j]);
                        s2.Append(scc2[k]);
                        imply(E(Edge2_prefix, s.ToString(), s1.ToString()), E(Edge2_prefix, s1.ToString(), s2.ToString()), E(Edge2_prefix, s.ToString(), s2.ToString()));
                        s.Clear(); s1.Clear(); s2.Clear();
                    }
                }

            cnf.WriteLine("* side1: self loops not allowed:");
            for (int i = 0; i < size1; ++i)
            { // side1: self loops not allowed					
                StringBuilder s = new StringBuilder();
                s.Append(scc1[i]);
                negunit(E(Edge1_prefix, s.ToString(), s.ToString()));
            }

            cnf.WriteLine("* side2: self loops not allowed:");
            for (int i = 0; i < size2; ++i)
            { // side2: self loops not allowed				
                StringBuilder s = new StringBuilder();
                s.Append(scc2[i]);
                negunit(E(Edge2_prefix, s.ToString(), s.ToString()));
            }

            cnf.WriteLine("* force mapping:");
            for (int i = 0; i < scc1.Count; ++i)
            {  // force mapping
                StringBuilder s = new StringBuilder(), s1 = new StringBuilder();
                if (is_mapped(scc1[i]))
                {
                    s.Append(scc1[i]);
                    s1.Append(mapf1[scc1[i]]);
                    make_equal(node1 + s.ToString(), node2 + s1.ToString());
                }
            }
        }

        List<int> extract_minisat_solution(string file_name, List<int> scc1)
        {
            /*
            Assumptions about minisat+'s solution: has the form v -v1 v4 v2 -v5 ... // not ordered.
            */
            StringBuilder s = new StringBuilder();
            s.Append("grep v " + file_name + " > assignment");
            if (Utils.Run(s.ToString()) != 0) Utils.Abort("minisat failed.");
            System.IO.StreamReader reader = new System.IO.StreamReader("assignment");
            string assignment = reader.ReadToEnd();
            reader.Close();
            string[] split = assignment.ToString().Split(new Char[] { 'v', ' ' });
            bool neg = false;
            int num = 0;
            List<int> solution = new List<int>();
            foreach (string st in split)
            {
                string s1 = st.Trim();
                if (s1 == "") continue;
                if (s1.Equals("-")) neg = true;
                else
                {
                    try { num = Convert.ToInt32(s1); }
                    catch (FormatException) { Utils.Abort("Something wrong in output of minisat+."); }
                    if (num - 1 < scc1.Count)
                    {
                        if (neg) solution.Add(scc1[num - 1]);
                    }
                    neg = false;
                }
            }


            Console.Write("Solution: "); Utils.print_vec(solution); Console.WriteLine();
            return solution;
        }

        List<int> Find_S(int n, mygraph cg1, mygraph cg2, List<int> scc1, List<int> scc2)
        {
            StringBuilder s = new StringBuilder(), s1 = new StringBuilder();
            List<int> res = new List<int>();

            //optimization for singleton scc1
            if (scc1.Count == 1 && scc2.Count == 1)
            {
                Console.WriteLine("Sccs of size 1, skipping minisat...");
                res.Add(scc1[0]);
                return res;
            }

            string TMP_FILE = "tmp";
            s.Append("S" + n + ".opb");
            cnf = new System.IO.StreamWriter(s.ToString());
            map_var_to_idx(scc1, scc2);
            add_constraints(cg1, cg2, scc1, scc2);
            cnf.Close();
            if (Options.S_OPTIMIZATION_FLAG)
            {
                s1.Append("cat " + Options.Negated_solutions_file + " >> " + s.ToString());
                Utils.Run(s1.ToString());
                s1.Clear();
            }
            s1.Append("dos2unix " + s.ToString()); // minisat cannot read CR, apparently
            Utils.Run(s1.ToString());
            s1.Clear();
            s1.Append(Options.COMMAND + " " + s.ToString() + " > " + TMP_FILE);
            Console.WriteLine("running: " + s1.ToString());
            Utils.Run(s1.ToString());
            s1.Clear();
            s1.Append("grep UNSAT " + TMP_FILE);
            int ret = Utils.Run(s1.ToString());
            Console.Write("Result: ");
            if (ret != 0)
            {
                Console.WriteLine("sat ");
                res = extract_minisat_solution(TMP_FILE, scc1);
            }
            else Console.WriteLine("unsat! Cannot find S. ");
            return res; // will be empty if unsat.
        }

    }

    static class RVT_Decompose
    {
        /// <summary>
        /// interface for the decomposition algorithm.
        /// </summary>
        /// <param name="CG1_SIZE"> number of nodes (functions) in the call graph, side 1 </param>
        /// <param name="CG2_SIZE"> number of nodes (functions) in the call graph, side 2 </param>
        /// <param name="edges_1"> edges defining the call graph, side 1 </param>
        /// <param name="edges_2"> edges defining the call graph, side 2 </param>
        /// <param name="loop_functions_1"> nodes coresponding to functions that were originally loops, side 1 </param>
        /// <param name="loop_functions_2"> nodes coresponding to functions that were originally loops, side 2 </param>
        /// <param name="mapf"> mapping between the functions on the two sides </param>
        /// <param name="syntactic_equivalent_list"> functions on side 1 that are syntact. equiv. to the their counterparts</param>
        /// <param name="names1"> names of functions, side 1 </param>
        /// <param name="names2"> names of functions, side 2 </param>
        public static void Decompose_main(
            int CG1_SIZE, int CG2_SIZE,
            List<Tuple<int, int>> edges_1, List<Tuple<int, int>> edges_2,
            List<int> loop_functions_1, List<int> loop_functions_2,
            List<Tuple<int, int>> mapf,
            List<int> syntactic_equivalent_list,
            List<int> empty1, List<int> empty2,
            string[] names1, string[] names2
        )
        {
            Debug.Assert(names1.Length == CG1_SIZE && names2.Length == CG2_SIZE);
            mygraph cg1 = new mygraph(CG1_SIZE), cg2 = new mygraph(CG2_SIZE);
            DAG dag1 = new DAG(cg1), dag2 = new DAG(cg2);
            Solve sl = new Solve(CG1_SIZE, CG2_SIZE);

            cg1.declare(edges_1); cg2.declare(edges_2);
            cg1.todotty("cg1"); cg2.todotty("cg2");

            sl.map_functions(CG1_SIZE, CG2_SIZE, mapf, empty1, empty2, cg1, cg2);

            dag1.compute_SCCs(); dag2.compute_SCCs();
            dag1.build_DAG(); dag2.build_DAG();
            dag1.todotty("dag1", Options.SCC_PREFIX); dag2.todotty("dag2", Options.SCC_PREFIX);

            sl.dag1_size = dag1.size();
            while (sl.build_SCC_map(ref dag1, ref dag2)) ; // builds map while removing doomed, until fixpoint.
            if (!sl.is_map_consistent(dag1, dag2)) Utils.Abort("main(): SCC mapping is cyclic.");

            sl.declare_syntactic_equivalent(syntactic_equivalent_list);
            sl.decompose(ref dag1, ref dag2); // This is the main workhorse.

            cg1.todotty_final("final1", dag1, sl.is_equivalent1, sl.syntactic_equivalent, loop_functions_1, sl.mapf1, names1, names2);
            cg2.todotty_final("final2", dag2, sl.is_equivalent2, sl.get_syntactic_equivalent2(CG2_SIZE), loop_functions_2, sl.mapf2, names2, names1);
            Console.WriteLine("Final graphs written to final1.gv and final2.gv");
        }
    }
}
