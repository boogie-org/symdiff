using Microsoft.Boogie;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SymDiffUtils{
  public static class Log
  {
    public static int vLevel = 1;

    public const int Error = 10;
    public const int Normal = 1;
    public const int SymEx = 2;
    public const int Normalization = 3;
    public const int Verifier = 4;
    public const int Time = 5;
    public const int MapEquivs = 6;
    public const int Cex = 7;
    public const int Summary = 9;
    public const int MSummary = 100;
    public const int CTrace = 15;
    public const int VariableRenamer = -1;
    public const int TraceValidator = -2;
    public const int Urgent = 8;
    public const int Warning = 8;
    public const int Final = 200;

    public delegate void Emitter(TokenTextWriter t);
    
    public static string Header(int level)
    {
      if (level == Error)
        return "ERROR: ";
      if (level == Warning)
        return "WARNING: ";
      if (level == SymEx)
        return "SymEx[0]: ";
      if (level == Normalization)
        return "Norm[0]: ";
      if (level == VariableRenamer)
        return "VRenamer[0]: ";
      if (level == Verifier)
        return "Verifier[0]: ";
      if (level == TraceValidator)
        return "Validator[0]: ";
      if (level == Time)
        return "Time[0]: ";
      if (level == MapEquivs)
        return "Maps[0]: ";
      if (level == Cex)
        return "Counterexamples[0]: ";
      if (level == Summary)
        return "Summary[0]: ";
      if (level == MSummary)
        return "M[0]: ";
      if (level == CTrace)
        return "CTrace";
      if (level == Final)
          return "FinalStats: ";
      return "";
    }
    public static bool Out(int level, string msg)
    {
      if (level >= vLevel)
      {
        Console.WriteLine(Header(level) + msg);
        Console.Out.Flush();
      }
      return false;
    }

    public static bool LogEmit(int level, int numTabs, Emitter e)
    {
      var tabs = "";
      for (int i = 0; i < numTabs; i++)
        tabs += "\t";
      var s = Util.BufEmit(e);
      var ss = s.Split('\n');
      foreach (var line in ss)
        Console.WriteLine(Header(level) + tabs + line);
      //Console.Write(Header(level) + tabs);
      //e(LogWriter);
      //Log.LogWriter.Close();
      return true;
    }

    public static bool Gate(int level)
    {
      return level >= vLevel;
    }

    public static bool LogEmit(int level, Emitter e)
    {
      return LogEmit(level, 0, e);
    }

     


    public static TokenTextWriter LogWriter = new TokenTextWriter(Console.Out,true);
  }

}
