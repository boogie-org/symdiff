using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using Microsoft.Boogie;
using SymDiffUtils;

namespace SDiff
{
    public static class Options
    {
        public enum INFER_OPT { NO_INFER, HOUDINI, ABS_HOUDINI };
        /// <summary>
        /// Options for DAC encoding
        /// DAC_LINEAR: only consider ith callsite of foo with ith callsite of foo' in some order
        /// DAC_NORMAL: consider all callsites of foo with all callsites of foo' 
        /// </summary>
        public enum DAC_ENCODING_OPT { DAC_LINEAR, DAC_NORMAL }; 

        #region Some internal options
        //set these at compile time
        public static bool VerboseBoogieEnvironment = false;
        public const bool TraceVerify = false;
        public const bool PrintZ3Model = false;
        public const bool DumpBeforeVerifying = false;
        public static bool PropagateEquivs = true; //Changed to non constant to allow bogus modular checking
        public const bool UnsoundRecursion = true;
        public const bool DumpSymTrace = false;
        public static bool DoSymEx = true;
        public const bool CheckOutputsForMaps = false;
        public const bool DumpValidTraces = false;
        public const bool EraseUFArgumentsOnPrintout = true;
        public const bool DontPrintDuplicateConstraintConjuncts = true;
        public static bool DifferentialInline = false; //RS:changed to off by default
        public static bool PropagateSingleDifference = false;
        public static bool PreciseDifferentialInline = true;
        public static bool EnumerateAllPaths = false; //setting to true means we check assert(F) in EQ
        public static bool RVTOption = false; //RVT option
        public static string LoopStringIdentifier = "_loop_"; // if a function name contains this string we assume it was a loop converted into a recursive function.
        //mode where a procedure is inlined when not equal (non-recursive only) [For evaluation of diff inlining]
        public const bool InlineWhenFail = false; //make sure DifferentialInline is turned off
        #endregion

        #region Static variables, not options
        public static string MergedProgramOutputFile = "mergedProgSingle.bpl";
        public static HashSet<string> OutputVars = new HashSet<string>();
        public static string BoogieUserOpts = "/doModSetAnalysis";
        public static bool ok; // *
        #endregion

        #region Cmd line options for user

        //different modes to check
        public static bool oneproc;
        public static bool localcheck;
        public static bool nonModularMode;
        public static bool checkAssertsOnly;

        //mutual summaries
        public static bool mutualSummaryMode;
        public static bool useMutualSummariesAsAxioms;
        public static bool dontUseHoudiniForMS;
        public static bool useAbstractHoudiniInference;
        public static bool checkMutualPrecondNonTerminating; //use dependencies and Houdini to check for equivalence
        public static bool dontTypeCheckMergedProg;
        public static bool callCorralOnMergedProgram; //invoke corral to check the candidates in mutual summary procedures (for equivalence checking)
        public static bool checkEquivWithDependencies = false;
        public static bool invokeHoudiniDirectlyOnMergedBpl = false; //an option to test houdini
        public static DAC_ENCODING_OPT dacEncoding =  DAC_ENCODING_OPT.DAC_NORMAL;
        public static int dacConsiderChangedProcsUptoDistance = -1;
        public static int inlineDepthInferContracts = 0;

        //rt check
        public static string useAltMSFile = null;
        public static bool doRTCheck = false;
        //taint analysis
        public static bool refinedStmtTaint; //use SymDiff to check for non-tainted statements when inlined (works with nonModularMode + splitEquality)

        //procedures/outputs to consider
        public static bool justMain; //run Boogie only on main (rest are skip)
        public static bool OnlyConsiderReturnAsOutput = false;
        public static bool splitOutputEqualities = false;  // if true, splits one ensures into n ensures for each output var


        //default values 
        public static int inlineAllRecursionDepth = 1;
        public static int Timeout = 200; //default timeout for each check
        public static int NumCex = -1; //-1 denotes find all cex
        public static HashSet<string> syntacticEqProcs = new HashSet<string>();
        public static string changeListFile = null;  //file containing change_list.txt

        public static bool StripContracts = true; //we currently have to strip contracts for correctness and (possibly) stability.
        public static bool freeContracts = false; //instead of dropping requires/ensures, makes them free requires/ensures

        #endregion 

        //flag and settings for generating C traces
        public const bool GenerateCTrace = true;

        public static string GetBoogieOptions()
        {
            string boogieOptions = "";
            if (!Options.splitOutputEqualities)
            {
                boogieOptions += " -z3multipleErrors ";
                if (Options.NumCex != -1)
                    boogieOptions += " -errorLimit:" + Options.NumCex + " ";
            }
            else
            {
                boogieOptions += " -errorLimit:100 "; //a large number as we count how many outs are disequal
            }

            boogieOptions += " -typeEncoding:m -timeLimit:" + Options.Timeout + " -removeEmptyBlocks:0  " + Options.BoogieUserOpts;
            if (Options.DoSymEx)
                boogieOptions += " -printModel:1 /printModelToFile:model.dmp "; // don't penalize enumerate all paths wiht printing z3 models
            return boogieOptions;
        }
    }

  //public static class Log
  //{
  //  public static int vLevel = 1;

  //  public const int Error = 10;
  //  public const int Normal = 1;
  //  public const int SymEx = 2;
  //  public const int Normalization = 3;
  //  public const int Verifier = 4;
  //  public const int Time = 5;
  //  public const int MapEquivs = 6;
  //  public const int Cex = 7;
  //  public const int Summary = 9;
  //  public const int MSummary = 100;
  //  public const int CTrace = 15;
  //  public const int VariableRenamer = -1;
  //  public const int TraceValidator = -2;
  //  public const int Urgent = 8;
  //  public const int Warning = 8;
  //  public const int Final = 200;

  //  public delegate void Emitter(TokenTextWriter t);
    
  //  public static string Header(int level)
  //  {
  //    if (level == Error)
  //      return "ERROR: ";
  //    if (level == Warning)
  //      return "WARNING: ";
  //    if (level == SymEx)
  //      return "SymEx[0]: ";
  //    if (level == Normalization)
  //      return "Norm[0]: ";
  //    if (level == VariableRenamer)
  //      return "VRenamer[0]: ";
  //    if (level == Verifier)
  //      return "Verifier[0]: ";
  //    if (level == TraceValidator)
  //      return "Validator[0]: ";
  //    if (level == Time)
  //      return "Time[0]: ";
  //    if (level == MapEquivs)
  //      return "Maps[0]: ";
  //    if (level == Cex)
  //      return "Counterexamples[0]: ";
  //    if (level == Summary)
  //      return "Summary[0]: ";
  //    if (level == MSummary)
  //      return "M[0]: ";
  //    if (level == CTrace)
  //      return "CTrace";
  //    if (level == Final)
  //        return "FinalStats: ";
  //    return "";
  //  }
  //  public static bool Out(int level, string msg)
  //  {
  //    if (level >= vLevel)
  //    {
  //      Console.WriteLine(Header(level) + msg);
  //      Console.Out.Flush();
  //    }
  //    return false;
  //  }

  //  public static bool LogEmit(int level, int numTabs, Emitter e)
  //  {
  //    var tabs = "";
  //    for (int i = 0; i < numTabs; i++)
  //      tabs += "\t";
  //    var s = Util.BufEmit(e);
  //    var ss = s.Split('\n');
  //    foreach (var line in ss)
  //      Console.WriteLine(Header(level) + tabs + line);
  //    //Console.Write(Header(level) + tabs);
  //    //e(LogWriter);
  //    //Log.LogWriter.Close();
  //    return true;
  //  }

  //  public static bool Gate(int level)
  //  {
  //    return level >= vLevel;
  //  }

  //  public static bool LogEmit(int level, Emitter e)
  //  {
  //    return LogEmit(level, 0, e);
  //  }

     


  //  public static TokenTextWriter LogWriter = new TokenTextWriter(Console.Out,true);
  //}
}


