using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Boogie;
using Microsoft.Boogie.GraphUtil;
using System.IO;
using System.Diagnostics;

namespace Dependency
{
    class Utils
    {

        public static List<object> GetAttributeVals(QKeyValue attributes, string key)
        {
            for (QKeyValue attr = attributes; attr != null; attr = attr.Next)
                if (attr.Key == key)
                    return attr.Params;

            return new List<object>();
        }

        public static bool ParseProgram(string fname, out Program prog)
        {
            prog = null;
            int errCount;
            try
            {
                errCount = Parser.Parse(fname, new List<string>(), out prog);
                if (errCount != 0 || prog == null)
                {
                    Console.WriteLine("WARNING: {0} parse errors detected in {1}", errCount, fname);
                    return false;
                }
            }
            catch (IOException e)
            {
                Console.WriteLine("WARNING: Error opening file \"{0}\": {1}", fname, e.Message);
                return false;
            }
            errCount = prog.Resolve();
            if (errCount > 0)
            {
                Console.WriteLine("WARNING: {0} name resolution errors in {1}", errCount, fname);
                return false;
            }
            errCount = prog.Typecheck();
            if (errCount > 0)
            {
                Console.WriteLine("WARNING: {0} type checking errors in {1}", errCount, fname);
                return false;
            }
            return true;
        }

        static public HashSet<Variable> ImplInputsToProcInputs(Implementation impl, HashSet<Variable> vars)
        {
            var result = new HashSet<Variable>();
            foreach (var v in vars)
            {
                if (impl.InParams.Contains(v))
                {// replace Implemetation inputs with Procedure inputs
                    result.Add(impl.Proc.InParams[impl.InParams.IndexOf(v)]);
                }
                else if (v is GlobalVariable || impl.Proc.InParams.Contains(v))
                {
                    result.Add(v);
                }
            }
            return result;
        }
        static public Variable ImplOutputToProcOutput(Implementation node, Variable v)
        {
            var index = node.OutParams.IndexOf(v);
            if (index >= 0) // replace Implemetation outputs with Procedure outputs
                return node.Proc.OutParams[index];
            else
                return v; // leave non-outputs as is
        }

        static public string GetSourceFile(AssertCmd node)
        {
            if (node == null) return null;
            // TODO: magic strings
            var file = QKeyValue.FindStringAttribute(node.Attributes, "sourceFile");
            if (file == null) file = QKeyValue.FindStringAttribute(node.Attributes, "sourcefile");
            return file;
        }

        static public int GetSourceLine(AssertCmd node)
        {
            if (node == null) return -1;
            // TODO: magic strings
            var line = QKeyValue.FindIntAttribute(node.Attributes, "sourceLine", -1);
            if (line == -1) line = QKeyValue.FindIntAttribute(node.Attributes, "sourceline", -1);
            return line;
        }

        // returns the source line adhering to the end of the implementaition
        static public string GetImplSourceFile(Implementation node)
        {
            string sourcefile = null;
            foreach (var b in node.Blocks.Where(b => b.Cmds.Count > 0 && b.Cmds[0] is AssertCmd))
            {
                sourcefile = GetSourceFile((AssertCmd)b.Cmds[0]);
                if (sourcefile != null)
                    break;
            }
            return sourcefile;
        }

        public class StatisticsHelper
        {
            List<Tuple<string, Procedure, Dependencies>> procDependencies = null;

            public StatisticsHelper(List<Tuple<string, Procedure, Dependencies>> pd) 
            {
                procDependencies = pd;
            }


            public void GenerateCSVOutput(string outFileName)
            {
                TextWriter output = new StreamWriter(outFileName);
                output.WriteLine("Filename, Procedure, Overall, Num Globals, Sum Globals, Inputs(Globals), Num Outputs, Sum Outputs, Inputs(Outputs)");
                // for each tuple, grouped by filename
                foreach (var depsInFile in procDependencies.GroupBy(x => x.Item1))
                {
                    foreach (var pd in depsInFile)
                    {
                        var overall = pd.Item3.Sum(x => x.Value.Count); // overall size of dependencies (\Sigma_{v} Deps(v))
                        var numGlobals = pd.Item3.Where(x => x.Key is GlobalVariable).Count();
                        var sumGlobals = pd.Item3.Where(x => x.Key is GlobalVariable).Sum(x => x.Value.Count); // size of global vars dependencies
                        HashSet<Variable> inputsGlobals = new HashSet<Variable>();
                        foreach (var depSet in pd.Item3.Where(x => x.Key is GlobalVariable))
                            foreach (var v in depSet.Value)
                                if (pd.Item2.InParams.Contains(v))
                                    inputsGlobals.Add(v);
                        var numOutputs = pd.Item3.Where(x => pd.Item2.OutParams.Contains(x.Key)).Count();
                        var sumOutputs = pd.Item3.Where(x => pd.Item2.OutParams.Contains(x.Key)).Sum(x => x.Value.Count); // size out outputs dependencies
                        HashSet<Variable> inputsOutputs = new HashSet<Variable>();
                        foreach (var depSet in pd.Item3.Where(x => pd.Item2.OutParams.Contains(x.Key)))
                            foreach (var v in depSet.Value)
                                if (pd.Item2.InParams.Contains(v))
                                    inputsOutputs.Add(v);
                        output.WriteLine("{0},{1},{2},{3},{4},{5},{6},{7},{8}", pd.Item1, pd.Item2, overall, numGlobals, sumGlobals, inputsGlobals.Count, numOutputs, sumOutputs, inputsOutputs.Count);
                    }
                }
                output.Close();
            }

            public static void GenerateCSVOutputForSemDep(List<Tuple<string, string, int, int, int>> sd, string outFileName)
            {
                TextWriter output = new StreamWriter(outFileName);
                output.WriteLine("Filename, Procedure, Data + Control, Data Only, Refined");
                foreach (var fileDeps in sd.GroupBy(x => x.Item1))
                    foreach (var procDeps in fileDeps)
                        output.WriteLine("{0},{1},{2},{3},{4}", procDeps.Item1, procDeps.Item2, procDeps.Item3, procDeps.Item4, procDeps.Item5);
                output.Close();
            }
        }

        public class DisplayHtmlHelper
        {
            List<Tuple<string, string, int>> changedLines;  //{(file, func, line),..}
            List<Tuple<string, string, int, List<string>>> taintedLines; //{(file, func, line, {v1,..vn}), ..}
            List<Tuple<string, string, int, string>> dependenciesLines; //{(file, func, line, {v1 <- {...},... vn <- {...}})}
            public DisplayHtmlHelper(List<Tuple<string, string, int>> changes, List<Tuple<string, string, int, List<string>>> taints, List<Tuple<string, string, int, string>> dependencies)
            {
                changedLines = changes;
                taintedLines = taints;
                dependenciesLines = dependencies;
            }
            public void GenerateHtmlOutput(string outFileName)
            {
                Func<string, string, string> MkLink = delegate(string s, string t)
                {
                    return @"<a href=" + t + @">" + s + @"</a>";
                };

                TextWriter output = new StreamWriter(outFileName);
                output.WriteLine("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 3.2//EN\">");
                output.WriteLine("<html>");
                output.WriteLine("<head>");
                output.WriteLine("<title>Tainted outputs</title>");
                output.WriteLine("<style type=\"text/css\"> "
                    + "div.code {font-family:monospace; font-size:100%;} </style>");
                output.WriteLine("<style type=\"text/css\"> "
                    + "span.trace { background:yellow; color:red; font-weight:bold;} </style>");
                output.WriteLine("<style type=\"text/css\"> "
                    + "span.values { background:lightgray; color:black; font-weight:bold;} </style>");
                output.WriteLine("<style type=\"text/css\"> "
                    + "span.report { background:lightgreen; color:black; font-weight:bold;} </style>");
                output.WriteLine("<style type=\"text/css\"> "
                    + "span.reportstmt { background:lightgreen; color:red; font-weight:bold;} </style>");
                output.WriteLine("</head>");
                output.WriteLine("<body>");
                output.WriteLine("");
                output.WriteLine("<h1> Statements that are tainted given the taint source </h1> ");

                //for each file f in the dependency set
                //  for each sourceline l in f
                //     if changed(l) then change-marker l
                //     elseif tainted(l) then tainted-marker l
                //     elseif l is last line then l proc-deps 
                var changesByFile = changedLines.GroupBy(x => x.Item1).ToDictionary(x => x.Key, x => x);
                foreach (var depsInFile in dependenciesLines.GroupBy(x => x.Item1))
                {
                    string srcFile = depsInFile.Key;
                    StreamReader sr = null;
                    try
                    {
                        sr = new StreamReader(srcFile);
                    }
                    catch (Exception)
                    {
                        Console.WriteLine("Could not generate HTML for file " + srcFile + ". (file not found)");
                        continue;
                    }
                    string ln;
                    List<string> srcLines = new List<string>();
                    while ((ln = sr.ReadLine()) != null)
                        srcLines.Add(ln);
                    sr.Close();
                    var changes = new HashSet<int> ();
                    if (changesByFile.ContainsKey(srcFile))
                        foreach(var x in changesByFile[srcFile]) 
                            changes.Add(x.Item3);
                    var depLines = depsInFile.Select(x => x.Item3);                   
                    for (int i = 0; i < srcLines.Count; ++i)
                    {
                        var l = srcLines[i];
                        string str = l;
                        if (changes.Contains(i+1))
                            str = string.Format("<b> <i> {0}  </i> </b>", l);

                        else if (taintedLines.Find(x => x.Item3 == i + 1) != null)
                            {
                            string vars = "[ ";
                            foreach (var t in depsInFile.Where(x => x.Item3 == i + 1))
                            {
                                foreach (var v in t.Item4)
                                {
                                    vars += v + " ";
                                }
                            }
                            vars += "]";
                            str = string.Format("<b> <u> {0} </u> </b>", l/*, vars*/);
                        }
                            
                        else if (depLines.Contains(i + 1))
                        {
                            foreach (var dep in dependenciesLines.Where(x => x.Item3 == i + 1))
                                str += string.Format("<pre> {0} </pre>", dep.Item4);
                        }

                        output.Write("[{0}] &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;  {1} <br>", i+1, str);
                    }
                }

                output.WriteLine("</body>");
                output.WriteLine("</html>");
                output.Close();
            }

        }

        public class VariableExtractor : StandardVisitor
        {
            public HashSet<Variable> vars = new HashSet<Variable>();
            public override Variable VisitVariable(Variable node)
            {
                vars.Add(node);
                return node;
            }
        }

        public class RemoveAsserts : StandardVisitor
        {
            public override Cmd VisitAssertCmd(AssertCmd node)
            {
                node.Expr = Expr.True;
                return base.VisitAssertCmd(node);
            }
        }


        static public class CallGraphHelper
        {
            static public Graph<Procedure> ComputeCallGraph(Program program)
            {
                Graph<Procedure> result = new Graph<Procedure>();

                foreach (Implementation impl in program.TopLevelDeclarations.Where(x => x is Implementation))
                {
                    result.AddSource(impl.Proc);
                    foreach (var b in impl.Blocks)
                        foreach (CallCmd c in b.Cmds.Where(c => c is CallCmd))
                            result.AddEdge(impl.Proc, c.Proc);
                }
                return result;
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
                output.Write(callGraph.ToDot(p => p.ToString() /*+ procDependencies[p].ToString()*/));
                output.Close();
            }
        }



        /// <summary>
        /// Converts dependency over prog1 to dependecy over prog2
        /// </summary>
        /// <param name="dependency"></param>
        /// <param name="prog1"></param>
        /// <param name="prog2"></param>
        /// <returns></returns>
        public static Dictionary<Procedure, Dependencies>  ResolveDependenciesAcrossPrograms
            (Dictionary<Procedure, Dependencies> dependencies,
            Program prog1,
            Program prog2)
        {
            throw new NotImplementedException();
        }

        static int replicateProgramCount = 0;
        public static Program ReplicateProgram(Program prog, string origFilename)
        {
            var filename = origFilename + ".tmp." + (replicateProgramCount++) + ".bpl";
            prog.Emit(new TokenTextWriter(filename, true));
            //Parsing stuff
            Program newProg;
            if (!Utils.ParseProgram(filename, out newProg)) return null;
            ModSetCollector c = new ModSetCollector();
            c.DoModSetAnalysis(newProg);
            return newProg;
        }
    }

}
