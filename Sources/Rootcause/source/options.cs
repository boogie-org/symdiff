using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Boogie;
using Microsoft.Boogie.VCExprAST;
using VC;
using Microsoft.BaseTypes;
using SymDiffUtils;
using BType = Microsoft.Boogie.Type;


namespace Rootcause
{
    public enum FilterAction { Allow, Drop, Only};

    public static class Options
    {
        //Options: Add them to ParseAndRemoveNonBoogieOptions
        public static int verbose = 0;
        public static bool stats = false;

        //older options
        public static bool groupStatementsTogether = false;
        public static bool blurStatments = true;
        public static bool trackUninterpreted = false; //true;
        public static bool useSetAxioms = false; //true;
        public static bool matchPairs = false;
        public static bool fatDatatypes = false;//true;
        public static bool predicateAssumes = true;
        public static bool penalizeAssumes = false;
        public static bool addGoodInputs = false; //constrain the rootcauses to take the good tests into account

        //newer options
        public static bool binarySearch = false;
        public static bool constrainLeftPath = false;
        public static bool constrainRightPath = false;
        public static bool assumeToSkip = false;
        public static bool disableMaxsat = false;
        public static bool checkConsistency = false;
        public static bool applyLeftFilter = false;
        public static bool applyRightFilter = false;
        public static List<int> lineFilterLeftLine = new List<int>(); //-1
        public static List<int> lineFilterRightLine = new List<int>(); //-1
        public static int newAssertLeftLine = -1;
        public static int newAssertRightLine = -1;
        public static int maxsatLimit = int.MaxValue;
        public static int callAlignWindow = -1;
        public static bool findEarliestAssertionByMapMismatch = false;
        public static bool findEarliestAssertionByLine = false;
        public static bool pruneAfterMapMismatch = false;
        public static bool pruneFailingEqualities = false;
        public static bool prunePassingInequalities = false;
        public static bool demonizeUninterpreted = false;
        public static bool liftConditionals = false;
        public static string htmlInput = ""; //input html with a trace
        public static string htmlTag = ""; //input html with a trace
        public static string outputPath = @"."; //path for dump files model.dmp, tmp.bpl

        public static bool test = false;
        public static bool runningCompiler = false;

        //Filters
        public static FilterAction singleFilter = FilterAction.Allow;
        public static FilterAction parallelFilter = FilterAction.Allow;
        public static FilterAction trivialFilter = FilterAction.Allow;
        public static FilterAction independantFilter = FilterAction.Allow;
        public static FilterAction immediateFilter = FilterAction.Allow;
        public static FilterAction literalFilter = FilterAction.Allow;
        public static FilterAction arithmeticFilter = FilterAction.Allow;
        public static FilterAction lineNumberFilter = FilterAction.Allow;
        public static FilterAction conditionalFilter = FilterAction.Allow;
        public static FilterAction calleeFilter = FilterAction.Allow;
        public static FilterAction loadFilter = FilterAction.Allow;
        public static FilterAction storeFilter = FilterAction.Allow;
        public static FilterAction movFilter = FilterAction.Allow;
        public static FilterAction procedureCallFilter = FilterAction.Allow;

        //Rootcause algorithm switch
        public static bool equalityFixes = false; //to add extra assumes about equality and do maxsat
        public static bool cegis = false;
        public static bool useUnsatCoresFromFailures = false;
        public static int rootcauseTimeout = 1000; //timeout in seconds
        public static int boogieTimeout = 200;    //timeout for Boogie


        public static List<string> predFuns = new List<string>();

            
        #region Parsing routines
        public static bool ParseCommandLine(string clo)
        {
             //without the next line, it fails to find the right prover!!
             var boogieOptions = "-typeEncoding:m -timeLimit:" + boogieTimeout + " -removeEmptyBlocks:0 /printModel:1 /printInstrumented " + clo;
             boogieOptions += " /errorLimit:1 ";
             //var boogieOptions = "/typeEncoding:m -timeLimit:900  -removeEmptyBlocks:0 /errorLimit:1 /printInstrumented " + clo;
             var oldArgs = boogieOptions.Split(' ');
             string[] args;
             //Custom parser to look and remove RootCause specific options
             var help = ParseAndRemoveNonBoogieOptions(oldArgs, out args);
             BoogieUtils.InitializeBoogie("");
             BoogieUtils.BoogieOptions.RunningBoogieFromCommandLine = true;
             //Options.htmlTag, Options.outputPath gets parsed only after ParseAndRemove...
             var modelArgs = " /printModelToFile:" + Options.outputPath + @"\rootcause_model" + Options.htmlTag + @".dmp";
             var dumpVC = " /proverLog:" + Options.outputPath + @"\rootcause_vc" + Options.htmlTag + @".z3"; 
             args = (Enumerable.ToList(args)).Concat(new List<string> () {modelArgs, dumpVC}).ToArray();
             BoogieUtils.BoogieOptions.Parse(args);
             return !help;
        }
        
        public static bool CheckBooleanFlag(string s, string flagName, ref bool flag, bool valueWhenPresent)
        {
             if (s == "/" + flagName || s == "-" + flagName)
             {
                 flag = valueWhenPresent;
                 return true;
             }
             return false;
        }
        public static bool CheckBooleanFlag(string s, string flagName, ref bool flag)
        {
             return CheckBooleanFlag(s, flagName, ref flag, true)
                 || CheckBooleanFlag(s, flagName + "+", ref flag, true)
                 || CheckBooleanFlag(s, flagName + "-", ref flag, false);
        }

        public static bool CheckFilterOption(string s, string filterName, ref FilterAction filter, FilterAction action)
        {
            if (s == "/" + filterName || s == "-" + filterName)
            {
                filter = action;
                return true;
            }
            return false;
        }
        public static bool CheckFilterOption(string s, string filterName, ref FilterAction filter)
        {
            return CheckFilterOption(s, filterName, ref filter, FilterAction.Allow)
                || CheckFilterOption(s, filterName + "+", ref filter, FilterAction.Only)
                || CheckFilterOption(s, filterName + "-", ref filter, FilterAction.Drop);
        }

        public static bool CheckIntegerOption(string s, string flagName, ref int flag)
        {
            //eg. /hintline:1
            if (s.Contains("/" + flagName + ":"))
            {
                string numericString = s.Substring(flagName.Length + 2); //1 for / and 1 for :
                try
                {
                    flag = int.Parse(numericString); return true;
                }
                catch (Exception e) { Console.WriteLine(e);  return false; }
            }
            return false;
        }

        public static bool CheckIntegerListOption(string s, string flagName, ref List<int> flag)
        {
            //eg. /hintline:1
            if (s.Contains("/" + flagName + ":"))
            {
                string numericString = s.Substring(flagName.Length + 2); //1 for / and 1 for :
                try
                {
                    char[] delimiters = { '@' };
                    foreach (String linestr in numericString.Split(delimiters)) {
                        int line = int.Parse(linestr);
                        flag.Add(line);
                    }
                    return true;
                    //flag = int.Parse(numericString); return true;
                }
                catch (Exception e) { Console.WriteLine(e); return false; }
            }
            return false;
        }

        public static bool CheckStringOption(string s, string flagName, ref string flag)
        {
            //eg. /html:abc.html
            if (s.Contains("/" + flagName + ":"))
            {
                string str = s.Substring(flagName.Length + 2); //1 for / and 1 for :
                try
                {
                    flag = str;  return true;
                }
                catch (Exception e) { Console.WriteLine(e); return false; }
            }
            return false;
        }

        //currently only Boolean options are supported
        //returns true if help is required
        //TODO: make it parameterized by using Reflection
        public static bool ParseAndRemoveNonBoogieOptions(string[] args, out string[] newargs)
        {
             var retArgs = new List<string>();
             bool help = false;
             foreach (var a in args)
             {
                 if (CheckIntegerOption(a, "verbose", ref verbose)
                     || CheckBooleanFlag(a, "stats", ref stats)

                     || CheckBooleanFlag(a, "groupStatementsTogether", ref groupStatementsTogether)
                     || CheckBooleanFlag(a, "blurStatements", ref blurStatments)
                     || CheckBooleanFlag(a, "trackUninterpreted", ref trackUninterpreted)
                     || CheckBooleanFlag(a, "useSetAxioms", ref useSetAxioms)
                     || CheckBooleanFlag(a, "matchPairs", ref matchPairs)
                     || CheckBooleanFlag(a, "fatDatatypes", ref fatDatatypes)
                     || CheckBooleanFlag(a, "predicateAssumes", ref predicateAssumes)
                     || CheckBooleanFlag(a, "penalizeAssumes", ref penalizeAssumes)

                     || CheckBooleanFlag(a, "addGoodInputs", ref addGoodInputs)
                     || CheckBooleanFlag(a, "findEarliestAssertionByMapMismatch", ref findEarliestAssertionByMapMismatch)
                     || CheckBooleanFlag(a, "findEarliestAssertionByLine", ref findEarliestAssertionByLine)
                     || CheckBooleanFlag(a, "pruneAfterMapMismatch", ref pruneAfterMapMismatch)
                     || CheckBooleanFlag(a, "pruneFailingEqualities", ref pruneFailingEqualities)
                     || CheckBooleanFlag(a, "prunePassingInequalities", ref prunePassingInequalities)
                     || CheckBooleanFlag(a, "liftConditionals", ref liftConditionals)
                     || CheckStringOption(a, "htmlInput", ref htmlInput)
                     || CheckStringOption(a, "htmlTag", ref htmlTag)
                     || CheckStringOption(a, "outputPath", ref outputPath)

                     || CheckBooleanFlag(a, "constrainLeftPath", ref constrainLeftPath)
                     || CheckBooleanFlag(a, "constrainRightPath", ref constrainRightPath)
                     || CheckBooleanFlag(a, "assumeToSkip", ref assumeToSkip)
                     || CheckBooleanFlag(a, "disableMaxsat", ref disableMaxsat)
                     || CheckBooleanFlag(a, "checkConsistency", ref checkConsistency)
                     || CheckBooleanFlag(a, "applyLeftFilter", ref applyLeftFilter)
                     || CheckBooleanFlag(a, "applyRightFilter", ref applyRightFilter)
                     || CheckBooleanFlag(a, "demonizeUninterpreted", ref demonizeUninterpreted)
                     || CheckBooleanFlag(a, "binarySearch", ref binarySearch)
                     || CheckBooleanFlag(a, "runningCompiler", ref runningCompiler)
                     || CheckBooleanFlag(a, "test", ref test)

                     || CheckIntegerOption(a, "rootcauseTimeout", ref rootcauseTimeout)
                     || CheckIntegerOption(a, "maxsatLimit", ref maxsatLimit)
                     || CheckIntegerListOption(a, "lineFilterLeftLine", ref lineFilterLeftLine)
                     || CheckIntegerListOption(a, "lineFilterRightLine", ref lineFilterRightLine)
                     || CheckIntegerOption(a, "newAssertLeftLine", ref newAssertLeftLine)
                     || CheckIntegerOption(a, "newAssertRightLine", ref newAssertRightLine)
                     || CheckIntegerOption(a, "callAlignWindow", ref callAlignWindow)

                     || CheckFilterOption(a, "singleFilter", ref singleFilter)
                     || CheckFilterOption(a, "parallelFilter", ref parallelFilter)
                     || CheckFilterOption(a, "trivialFilter", ref trivialFilter)
                     || CheckFilterOption(a, "independantFilter", ref independantFilter)
                     || CheckFilterOption(a, "immediateFilter", ref immediateFilter)
                     || CheckFilterOption(a, "literalFilter", ref literalFilter)
                     || CheckFilterOption(a, "arithmeticFilter", ref arithmeticFilter)
                     || CheckFilterOption(a, "lineNumberFilter", ref lineNumberFilter)
                     || CheckFilterOption(a, "conditionalFilter", ref conditionalFilter)
                     || CheckFilterOption(a, "calleeFilter", ref calleeFilter)
                     || CheckFilterOption(a, "loadFilter", ref loadFilter)
                     || CheckFilterOption(a, "storeFilter", ref storeFilter)
                     || CheckFilterOption(a, "movFilter", ref movFilter)
                     || CheckFilterOption(a, "procedureCallFilter", ref procedureCallFilter)

                     || CheckBooleanFlag(a, "equalityFixes", ref equalityFixes)
                     || CheckBooleanFlag(a, "cegis", ref cegis)
                     || CheckBooleanFlag(a, "useUnsatCoresFromFailures", ref useUnsatCoresFromFailures)
                     ) continue;
                 if (a.StartsWith("/predFun:"))
                 {
                     predFuns.Add(a.Substring("/predFun:".Length));
                     continue;
                 }
                 retArgs.Add(a);
                 if (a == "-?" || a == "/?") { help = true; retArgs.Remove(a); continue; } //add it to Boogie as well
             }
             newargs = retArgs.ToArray();
             if (help)
             {
                 Console.WriteLine("\n  ---- Rootcause options ----------------------------------------\n");
                 Console.WriteLine("  Boolean options: \n\tuse /option or /option+ to set, use /option- to unset\n");
                 Console.WriteLine("  /break: \n\tBreak into the debugger\n");
                 Console.WriteLine("  To see additional Boogie options, use /help\n");
                 Console.WriteLine("  /verbose:  \n\tMakes output verbose (default {0})", verbose);
                 Console.WriteLine("  /stats:  \n\tCollect statistics without performing rootcause (default {0})", stats);
                 Console.WriteLine("  /groupStatementsTogether: \n\tGroups all statements in a source line for maxsat (default {0})", groupStatementsTogether);
                 Console.WriteLine("  /blurStatements: \n\tAllows for replacing statements with havocs (otherwise: skip only) (default {0})", blurStatments);
                 Console.WriteLine("  /matchPairs: \n\tTry to return pairs of related causes (default {0})", matchPairs);
                 Console.WriteLine("  /trackUninterpreted: \n\tUse datatypes to track results of functions with attribute ':uninterpreted' (default {0})", trackUninterpreted);
                 Console.WriteLine("  /useSetAxioms: \n\tEnable axioms to support trackUninterpreted (default {0})", useSetAxioms);
                 Console.WriteLine("  /fatDatatypes: \n\tAdd additional inputs to trackUninterpreted datatypes (default {0})", fatDatatypes);
                 Console.WriteLine("  /predicateAssumes: \n\tAllow assume statements to be considered causes (default {0})", predicateAssumes);
                 Console.WriteLine("  /penalizeAssumes: \n\tDiscourages causes that change paths (default {0})", penalizeAssumes);
                 Console.WriteLine("  \n\n");
                 Console.WriteLine("  /findEarliestAssertionByMapMismatch: \n\tFinds the pair of assignments where a maptype update differs (default {0})", findEarliestAssertionByMapMismatch);
                 Console.WriteLine("  /findEarliestAssertionByLine: \n\tFind earlier assertion (default {0})", findEarliestAssertionByLine);
                 Console.WriteLine("  /htmlInput:<file>: \n\tInput html file that contains the source trace over which the rootcause will be displayed (default {0})", htmlInput);
                 Console.WriteLine("                     \n\tNeed to have <foo>.analyze.html for the x86 generated html files");
                 Console.WriteLine("  /htmltag:<string>: \n\tA tag to identify output files (default {0})", htmlTag);
                 Console.WriteLine("  /outputPath:<string>: \n\tPath to dump rootcause_model.dmp, tmp.bpl, and rootcause_vc.z3 (default {0})", outputPath);
                 Console.WriteLine("\n  ----------------------------------------------------------------\n");
                 return true;
             }
             return false;
        }
         #endregion
    }
}
