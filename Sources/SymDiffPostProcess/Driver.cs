using Microsoft.Boogie;
using Microsoft.Boogie.GraphUtil;
using SymDiffUtils;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SymDiffPostProcess
{
    class Driver
    {
        static void Main(string[] args)
        {

            if(args.Count() != 4)
            {
                Console.WriteLine("The program is to be run as: SymDiffPostProcess.exe tainted.csv tainted.dac.csv v1.bpl_changed_lines.txt _v2.bpl");
                return;
            }
            if (args.ToList().Any(x => x == "-break")) Debugger.Launch();


            var taintDependency = args[0];
            var taintDac = args[1];
            var changedFile = args[2];
            var bplFile = args[3];


            Dictionary<string,HashSet<int>> procToDacTaint = getProcToLinesMap(taintDac);
            Dictionary<string,HashSet<int>> procToDepTaint = getProcToLinesMap(taintDependency);
            Dictionary<string, HashSet<int>> procToChange = getProcToLinesMap(changedFile);
            FilterChangedFromTainted(procToDacTaint, procToChange);
            FilterChangedFromTainted(procToDepTaint, procToChange);

            BoogieUtils.InitializeBoogie("");
            Program program = BoogieUtils.ParseProgram(bplFile);
            program.Resolve(BoogieUtils.BoogieOptions);
            program.Typecheck(BoogieUtils.BoogieOptions);
            var callGraph = CallGraphHelper.ComputeCallGraph(program);

            var lengths = BoogieUtils.FindProcsAtDistance(callGraph, procToChange.Keys.ToList());

            Dictionary<int, int> distanceToLinesDac = ComputeDistanceToLines(lengths, procToDacTaint);
            PrintDistanceBuckets(distanceToLinesDac, "dacTaintBuckets.csv");
            Dictionary<int, int> distanceToLinesDep = ComputeDistanceToLines(lengths, procToDepTaint);
            PrintDistanceBuckets(distanceToLinesDep, "depTaintBuckets.csv");

        }

        private static void PrintDistanceBuckets(Dictionary<int, int> distanceToLinesDac, string fn)
        {
            using (var file = new StreamWriter(fn))
            {
                foreach (var key in distanceToLinesDac.Keys)
                {
                    file.WriteLine("{0}, {1}", key, distanceToLinesDac[key]);
                }
            }
        }

        private static Dictionary<int, int> ComputeDistanceToLines(Dictionary<int, HashSet<string>> lengths, Dictionary<string, HashSet<int>> procToTaint)
        {
            Dictionary<int, int> distanceToLines = new Dictionary<int, int>();
            foreach (var len in lengths.Keys)
            {
                foreach (var proc in lengths[len])
                {
                    if (procToTaint.ContainsKey(proc))
                    {
                        if (!distanceToLines.ContainsKey(len))
                        {
                            distanceToLines.Add(len, 0);
                        }
                        distanceToLines[len] += procToTaint[proc].Count;
                    }    
                }
                
            }
            if (distanceToLines.ContainsKey(int.MaxValue))
            {
                distanceToLines.Remove(int.MaxValue);
            }
            return distanceToLines;
        }

        private static void FilterChangedFromTainted(Dictionary<string, HashSet<int>> procToTaint, Dictionary<string, HashSet<int>> procToChange)
        {
            foreach (var key in procToChange.Keys)
            {
                foreach (var item in procToChange[key])
                {
                    if (procToTaint.ContainsKey(key))
                    {
                        procToTaint[key].Remove(item);
                    }
                }
            }
        }

        

        private static Dictionary<string, HashSet<int>> getProcToLinesMap(string fn)
        {
            Dictionary<string, HashSet<int>> result = new Dictionary<string, HashSet<int>>();
            try
            {
                using (var file = new StreamReader(fn))
                {
                    while (!file.EndOfStream)
                    {
                        string line = file.ReadLine();
                        var components = line.Split(',');
                        var procName = components[0];
                        var lineNum = int.Parse(components[1]);
                        if (!result.ContainsKey(procName))
                        {
                            result.Add(procName, new HashSet<int>());
                        }
                        result[procName].Add(lineNum);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("[Error] Probably File Not Found: {0}", ex.Message);
                Environment.Exit(-1);
            }
            return result;
        }

    }
}
