using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Boogie;
using System.IO;

namespace Dependency
{
    class Utils
    {
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
                if (impl.InParams.Contains(v)) // replace Implemetation inputs with Procedure inputs
                    result.Add(impl.Proc.InParams[impl.InParams.IndexOf(v)]);
                else if (v is GlobalVariable)
                    result.Add(v);
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

                //for each file f in the taint set
                //  for each sourceline l in f
                //     if changed(l) then change-marker l
                //     elseif tainted(l) then tainted-marker l
                //     else l
                var changesByFile = changedLines.GroupBy(x => x.Item1).ToDictionary(x => x.Key, x => x);
                foreach (var taintInFile in taintedLines.GroupBy(x => x.Item1))
                {
                    string srcFile = taintInFile.Key;
                    StreamReader sr = new StreamReader(srcFile);
                    string ln;
                    List<string> srcLines = new List<string>();
                    while ((ln = sr.ReadLine()) != null)
                        srcLines.Add(ln);
                    sr.Close();
                    var changes = new HashSet<int> ();
                    if (changesByFile.ContainsKey(srcFile))
                        foreach(var x in changesByFile[srcFile]) 
                            changes.Add(x.Item3);
                    var taints = taintInFile.Select(x => x.Item3);
                    for (int i = 0; i < srcLines.Count; ++i)
                    {
                        var l = srcLines[i];
                        string str = l;
                        if (changes.Contains(i+1))
                            str = string.Format("<b> <i> {0} </i> </b>", l);
                        else if (taints.Contains(i + 1))
                        {
                            string vars = "[ ";
                            foreach (var t in taintInFile.Where(x => x.Item3 == i + 1))
                            {
                                foreach (var v in t.Item4)
                                {
                                    vars += v + " ";
                                }
                            }
                            vars += "]";
                            str = string.Format("<b> <u> {0} </u> </b> \t {1} ", l, vars);
                        }
                        var dep = dependenciesLines.Find(x => x.Item3 == i);
                        if (dep != null)
                            str += string.Format("<pre> {0}", dep.Item4);
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
    }

}
