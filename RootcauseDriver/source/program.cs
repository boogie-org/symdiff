using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;
using System.Diagnostics;
using System.IO;
using System.Threading;
using System.Threading.Tasks;

namespace RootcauseDriver
{
    /// <summary>
    /// This module runs rootcause.exe as a black box on a set of directories, with various options and 
    /// generates a HTML report of the results
    /// </summary>
    class RootcauseDriver
    {
        enum RootCauseResult { FOUND, NOTFOUND, UNKNOWN }; 

        static string rootcauseBinaryPath = "";             //path to rootcause.exe
        static Dictionary<Tuple<string, string, string>, List<Tuple<Tuple<string,string>, string, string, string, string, string>>> results; //(dir,bpl,cex) -> [((opt,tag), htmlOut, result)]
        static List<Tuple<Tuple<string, string, string>, Tuple<string, string>>> inputs;
        static Tuple<Tuple<string, string, string>, Tuple<string, string>, string, string, string, string, string>[] outputs; 

        private void Usage()
        {
            Console.WriteLine("Usage:\n");
            Console.WriteLine("RootcauseDriver.exe [options]");
        }
        static void Main(string[] args)
        {
            results = new Dictionary<Tuple<string, string, string>, List<Tuple<Tuple<string, string>, string, string, string, string, string>>>();
            inputs = new List<Tuple<Tuple<string, string, string>, Tuple<string, string>>>();

            rootcauseBinaryPath = GetBinaryPath();

            Options.CollectBenchmarks(ref inputs); //all benchmark options should be in options.cs to avoid changes to this file except for logic changes

            //allocate outputs based on the number of entries in inputs
            outputs = new Tuple<Tuple<string, string, string>, Tuple<string, string>, string, string, string, string, string>[inputs.Count + 1];
            RunTaskInParallel();

            MergeOutputs();
            var dateString = DateTime.Now.Ticks;
            GenerateHtmlOutput(@"RootcauseResultsSummary_" + dateString + ".html");
        }
        private static void RunTaskInParallel()
        {
            /*
            var timeout = 10000; //120 seconds
            var cts = new CancellationTokenSource();
            using (var t = new Timer(_ => cts.Cancel(), null, timeout, -1))
            {
                Parallel.For(0, inputs.Count, new ParallelOptions { CancellationToken = cts.Token },
                    i => RunDirectory(inputs[i].Item1, inputs[i].Item2, i));
            }
             * */
            Parallel.For(0, inputs.Count, new ParallelOptions { MaxDegreeOfParallelism = Options.maxParallel},
                i => RunDirectory(inputs[i].Item1, inputs[i].Item2, i));
        }
        private static void RunDirectory(Tuple<string, string, string> dirInfo, Tuple<string, string> options, int i)
        {
            //Don't change directories as this will be invoked in a TPL
            if (!Directory.Exists(dirInfo.Item1))
            {
                Console.WriteLine("Directory {0} does not exist", dirInfo.Item1);
                return;
            }
            else
            {
                Console.WriteLine("\n>>>>>>> Processing directory {0}.........", dirInfo.Item1);
            }

            Func<string, string> WrapPath = delegate(string s) { return dirInfo.Item1 + @"\" + s; };
            var htmlOutFile = dirInfo.Item3 + "." + options.Item2;
            var args = " " + WrapPath(dirInfo.Item2) + @" /htmlInput:" + WrapPath(dirInfo.Item3) + " " + options.Item1 + @" /htmlTag:" + options.Item2;
            args += @" /outputPath:" + dirInfo.Item1 + " ";
            args += @" /rootcauseTimeout:" + Options.timeoutPerProcess + " ";
            Tuple<string,string,string,string> o = ExecuteBinary(rootcauseBinaryPath + @"Rootcause.exe", args);
            var newOpt = Tuple.Create<string, string>(args, options.Item2); //we want to get the raw args here
            outputs[i] = Tuple.Create(dirInfo, newOpt, htmlOutFile, o.Item1, o.Item2, o.Item3, o.Item4);

            //RegisterResult(dirInfo, options, htmlOutFile, result, o, i);
        }
        private static string GetBinaryPath()
        {
            var asmbly = Assembly.GetExecutingAssembly();
            var path  =  asmbly.Location.Substring(0, asmbly.Location.IndexOf(asmbly.ManifestModule.Name));
            //Console.WriteLine("Current assembly is {0}, {1}, {2}", asmbly.FullName, asmbly.Location, path);
            return path + @"..\..\..\Rootcause\bin\Debug\";
        }
        private static Tuple<string, string, string, string> ExecuteBinary(string binaryName, string arguments)
        {
            //Func<string, string> ProcessOutput = delegate(string s) { return ("The number of lines in output = " + s.Split('\n').Count().ToString()); };
            Func<string, string> ProcessOutput = delegate(string s)
            {
                return s.Contains("Unable to find rootcause") ? "NOT-FOUND" : 
                    s.Contains("Cause ==>") ? "FOUND" :"UNKNOWN";                    
            };
            Func<string, string> ProcessLineNumber = delegate(string s)
            {
                if (s.Contains("Cause ==>"))
                {
                    string left = s.Split(new string[] { "leftAssignment sourceLine: " }, StringSplitOptions.None)[1].Split(new Char[] { '\n' })[0];
                    string right = s.Split(new string[] { "rightAssignment sourceLine: " }, StringSplitOptions.None)[1].Split(new Char[] { '\n' })[0];
                    return left + "," + right;
                }
                else { return "UNKNOWN"; }
            };
            Func<string, string> ProcessTime = delegate(string s)
            {
                string tstr = @"Total time for rootcause analysis = ";
                if (s.Contains(tstr))
                {
                    var t = s.Substring(s.IndexOf(tstr) + tstr.Length);
                    if (t.Contains("seconds"))
                        return t.Substring(0, t.IndexOf("seconds") + "seconds".Length);
                    else
                        return t;
                }
                else { return "UNKNOWN"; }
            };
            Func<string, string> ProcessHtmlMismatch = delegate(string s)
            {
                return s.Contains("Found CEX & HTML mismatch") ? "HTML-CEX-MISMATCH" : "";
            };
            Func<string, string> ProcessException = delegate(string s)
            {
                var str = @"Rootcause terminated with exception";
                if (s.Contains(str))
                {
                    var t = s.Substring(s.IndexOf(str) + str.Length);
                    return " [EXCEPTION = " + t.Substring(0, t.IndexOf("\n")) + "]";
                }
                return "";
            };
            Func<string, string> ProcessStats = delegate(string s)
            {
                string left_assigns = "", right_assigns = "", total_candidates = "", defaultpruning_candidates = "", defaultpruning_assigns = "",
                       passingFilterCount = "", failingFilterCount = "", callWindowFilterCount = "", cexFilterCount = "", earlierFilterCount = "",
                       passingcexs = "", binarysearch_assigns = "", binarysearch_candidates = "", maxsat_useful = "", maxsat_useless = "",
                       maxsat_assigns = "", bpl_lines = "", html_lines = "";

                if (s.Contains("stats_left_assigns")) { left_assigns = s.Split(new string[] { "stats_left_assigns: " }, StringSplitOptions.None)[1].Split(new Char[] { '\n' })[0]; }
                if (s.Contains("stats_right_assigns")) { right_assigns = s.Split(new string[] { "stats_right_assigns: " }, StringSplitOptions.None)[1].Split(new Char[] { '\n' })[0]; }
                if (s.Contains("stats_total_candidates")) { total_candidates = s.Split(new string[] { "stats_total_candidates: " }, StringSplitOptions.None)[1].Split(new Char[] { '\n' })[0]; }
                if (s.Contains("stats_defaultpruning_candidates")) { defaultpruning_candidates = s.Split(new string[] { "stats_defaultpruning_candidates: " }, StringSplitOptions.None)[1].Split(new Char[] { '\n' })[0]; }
                if (s.Contains("stats_defaultpruning_assigns")) { defaultpruning_assigns = s.Split(new string[] { "stats_defaultpruning_assigns: " }, StringSplitOptions.None)[1].Split(new Char[] { '\n' })[0]; }
                if (s.Contains("stats_passingFilterCount")) { passingFilterCount = s.Split(new string[] { "stats_passingFilterCount: " }, StringSplitOptions.None)[1].Split(new Char[] { '\n' })[0]; }
                if (s.Contains("stats_failingFilterCount")) { failingFilterCount = s.Split(new string[] { "stats_failingFilterCount: " }, StringSplitOptions.None)[1].Split(new Char[] { '\n' })[0]; }
                if (s.Contains("stats_callWindowFilterCount")) { callWindowFilterCount = s.Split(new string[] { "stats_callWindowFilterCount: " }, StringSplitOptions.None)[1].Split(new Char[] { '\n' })[0]; }
                if (s.Contains("stats_cexFilterCount")) { cexFilterCount = s.Split(new string[] { "stats_cexFilterCount: " }, StringSplitOptions.None)[1].Split(new Char[] { '\n' })[0]; }
                if (s.Contains("stats_earlierFilterCount")) { earlierFilterCount = s.Split(new string[] { "stats_earlierFilterCount: " }, StringSplitOptions.None)[1].Split(new Char[] { '\n' })[0]; }
                if (s.Contains("stats_passingcexs")) { passingcexs = s.Split(new string[] { "stats_passingcexs: " }, StringSplitOptions.None)[1].Split(new Char[] { '\n' })[0]; }
                if (s.Contains("stats_binarysearch_assigns")) { binarysearch_assigns = s.Split(new string[] { "stats_binarysearch_assigns: " }, StringSplitOptions.None)[1].Split(new Char[] { '\n' })[0]; }
                if (s.Contains("stats_binarysearch_candidates")) { binarysearch_candidates = s.Split(new string[] { "stats_binarysearch_candidates: " }, StringSplitOptions.None)[1].Split(new Char[] { '\n' })[0]; }
                if (s.Contains("stats_maxsat_useful")) { maxsat_useful = s.Split(new string[] { "stats_maxsat_useful: " }, StringSplitOptions.None)[1].Split(new Char[] { '\n' })[0]; }
                if (s.Contains("stats_maxsat_useless")) { maxsat_useless = s.Split(new string[] { "stats_maxsat_useless: " }, StringSplitOptions.None)[1].Split(new Char[] { '\n' })[0]; }
                if (s.Contains("stats_maxsat_assigns")) { maxsat_assigns = s.Split(new string[] { "stats_maxsat_assigns: " }, StringSplitOptions.None)[1].Split(new Char[] { '\n' })[0]; }
                if (s.Contains("stats_bpl_lines")) { bpl_lines = s.Split(new string[] { "stats_bpl_lines: " }, StringSplitOptions.None)[1].Split(new Char[] { '\n' })[0]; }
                if (s.Contains("stats_html_lines")) { html_lines = s.Split(new string[] { "stats_html_lines: " }, StringSplitOptions.None)[1].Split(new Char[] { '\n' })[0]; }
                
                string result = "";
                result += "left_assigns:" + left_assigns + ", ";
                result += "right_assigns:" + right_assigns + ", ";
                result += "total_candidates:" + total_candidates + ", ";
                result += "defaultpruning_candidates:" + defaultpruning_candidates + ", ";
                result += "defaultpruning_assigns:" + defaultpruning_assigns + ", ";
                result += "passingFilterCount:" + passingFilterCount + ", ";
                result += "failingFilterCount:" + failingFilterCount + ", ";
                result += "callWindowFilterCount:" + callWindowFilterCount + ", ";
                result += "cexFilterCount:" + cexFilterCount + ", ";
                result += "earlierFilterCount:" + earlierFilterCount + ", ";
                result += "passingcexs:" + passingcexs + ", ";
                result += "binarysearch_assigns:" + binarysearch_assigns + ", ";
                result += "binarysearch_candidates:" + binarysearch_candidates + ", ";
                result += "maxsat_useful:" + maxsat_useful + ", ";
                result += "maxsat_useless:" + maxsat_useless + ", ";
                result += "maxsat_assigns:" + maxsat_assigns + ", ";
                result += "bpl_lines:" + bpl_lines + ", ";
                result += "html_lines:" + html_lines + ", ";
                return result;
            };
            Console.WriteLine("\tSTART Executing {0} {1}", binaryName, arguments);
            try
            {
                ProcessStartInfo procInfo = new ProcessStartInfo();
                //System.Diagnostics.Process proc = new System.Diagnostics.Process();
                procInfo.UseShellExecute = false;
                procInfo.FileName = binaryName;
                procInfo.Arguments = arguments;
                procInfo.WindowStyle = ProcessWindowStyle.Hidden;
                procInfo.RedirectStandardOutput = true;
                Process proc = new Process();
                proc.StartInfo = procInfo;
                proc.EnableRaisingEvents = false;
                proc.Start();
                string output = "";
                output = proc.StandardOutput.ReadToEnd();
                proc.WaitForExit();
                # region deprecated logic for forcing a timeout
                //
                // Caution: Using proc.WaitForExit(1200000) causes processes to be idle
                //
                //bool exitInTime = proc.WaitForExit(1200000);
                //if (!exitInTime) { Console.WriteLine("TIMEOUT"); }
                //while (proc.StandardOutput.Peek() > -1)
                //{
                //    output = output + proc.StandardOutput.ReadLine() + "\n";
                //}
                //if (!exitInTime)
                //{
                //    proc.Kill();
                //    return new Tuple<string, string, string, string>("TIMEOUT", "UNKNOWN", "TIMEOUT", "TIMEOUT");
                //}
                #endregion 
                Console.WriteLine("\tEND Executing {0} {1}", binaryName, arguments);
                return new Tuple<string, string, string, string>(ProcessOutput(output), ProcessLineNumber(output), ProcessTime(output), ProcessHtmlMismatch(output) + ", " + ProcessException(output) + ", " + ProcessStats(output));
            }
            catch (Exception e)
            {
                Console.WriteLine("\tEND Executing {0} {1} with Exceptin {2}", binaryName, arguments, e);
                return new Tuple<string, string, string, string>("UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN");
            }
        }
        private static void MergeOutputs()
        {
            //merge different options for the same benchmark
            foreach (var o in outputs.ToList())
            {
                if (o == null) continue;
                var dirInfo = o.Item1;
                if (!results.ContainsKey(dirInfo))
                    results[dirInfo] = new List<Tuple<Tuple<string, string>, string, string, string, string, string>>();
                results[dirInfo].Add(Tuple.Create(o.Item2, o.Item3, o.Item4, o.Item5, o.Item6, o.Item7));
            }
        }
        private static void RegisterResult(Tuple<string, string, string> dirInfo, Tuple<string, string> options, string htmlOutFile, string outstring)
        {
            if (!results.ContainsKey(dirInfo))
                results[dirInfo] = new List<Tuple<Tuple<string, string>, string, string, string, string, string>>();
            results[dirInfo].Add(Tuple.Create(options, htmlOutFile, outstring,"","",""));
        }
        private static void GenerateHtmlOutput(string outFileName)
        {

            Func<string, string, string> MkLink = delegate(string s, string t) 
            { 
                return @"<a href=" + t + @">" + s + @"</a>"; 
            };

            TextWriter output = new StreamWriter(outFileName); 
            output.WriteLine("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 3.2//EN\">");
            output.WriteLine("<html>");
            output.WriteLine("<head>");
            output.WriteLine("<title>Rootcause statistics </title>");
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
            output.WriteLine("<h1> Output of rootcause for SymDiff equivalence failures </h1> ");

            //Output each line
            //<dir, @htmlInp, @htmlOut, Options, Result> where @ is a link
            foreach (var l in results)
            {
                var dir = l.Key.Item1;
                output.WriteLine("<hr> <p><b> {0} </b> &nbsp;&nbsp;&nbsp; {1}  </p> ",
                    dir, MkLink("Symdiff Counterexample", dir + @"\" + l.Key.Item3 + ".html"));
                foreach (var r in l.Value)
                {
                    output.WriteLine("<p> &nbsp;&nbsp;&nbsp;  {0} &nbsp;&nbsp;&nbsp; <b>Options</b>: ({1}) <b>Line</b>: ({2}) <b>Time</b>: ({3}) ",
                        MkLink("Rootcause: " + r.Item3, dir + @"\" + r.Item2 + ".rootcause.html"), r.Item1.Item1, r.Item4, r.Item5);
                    //if (r.Item1.Item1.Contains("stats"))
                    {
                        output.WriteLine(" &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <b>Stats</b>: {0} </p>", r.Item6);
                    }
                }
            }

            output.WriteLine("</body>");
            output.WriteLine("</html>");
            output.Close();
        }
    }
}
