using System;
using System.IO;
using System.Collections.Generic;
using Microsoft.Boogie;


//note:
// file format:

// globals: (file1.id1, file2.id2); (file1.id3, file2.id4); ...
// types: (same as above)
// constants: (same as above)
// procedure: (file1.procname1, file2.procname2) / (arg1, arg2); (arg3, arg4); ...
// function: (same as above)

namespace SDiff
{
  public static class BadGlobalState
  {
    public static int MaxUFArgs = 0;
    public static int SumUFArgs = 0;
    public static int NumUFs = 0;

    public static int MaxCex = 0;
    public static int SumCex = 0;

    public static int NumProcDiffs = 0;
    public static int SumProcDiffs = 0;

    public static long MaxTime = 0;
    public static long SumTime = 0;
  }


  public class ConfigParserException : Exception
  {
    public ConfigParserException(string a) : base(a) { }
  }

  public class ProcedureMap : List<Duple<HDuple<string>, ParamMap>>
  {
    public readonly string prefix;

    public ProcedureMap(string prefix)
      : base()
    {
      this.prefix = prefix;
    }

    public bool AddFromArray(string[] fs, string[] ps)
    {
      HDuple<string> d = HDuple<string>.OfArray(fs);
      ParamMap p = ParamMap.OfArray(ps);

      if (d == null)
        return true;

      if (p == null)
        p = new ParamMap();

      Add(new Duple<HDuple<string>, ParamMap>(d, p));
      return false;
    }

    public List<HDuple<string>> ToProcedureAssocList()
    {
      return this.Map(x => x.fst);
    }

    public Dictionary<string, string> ToProcedureDictionary()
    {
      var dict = new Dictionary<string, string>();
      foreach (var d in this)
        dict.Add(d.fst.fst, d.fst.snd);
      return dict;
    }

    public ParamMap FindPair(string s1, string s2)
    {
      foreach (var p in this)
        if (p != null && p.fst.fst == s1 && p.fst.snd == s2)
          return p.snd;
      return null;
    }

    public override string ToString()
    {
      string r = "";
      foreach (var proc in this)
        if (proc != null)
          r += prefix + ": " + proc.fst + " / " + proc.snd + "\n";
      return r;
    }
  }

  public class ParamMap : List<HDuple<string>>
  {
    public ParamMap() {}

    public ParamMap(List<HDuple<string>> p)
      : base(p)
    {
    }

    public ParamMap(HDuple<string>[] p)
      : this(new List<HDuple<string>>(p))
    {
    }

    public static ParamMap OfArray(string[] ps)
    {
      ParamMap m = new ParamMap();
      try
      {
        foreach (string p in ps)
        {
          var pr = HDuple<string>.OfArray(p.Split(','));
          if (pr != null)
            m.Add(pr);
        }
      }
      catch
      {
        return null;
      }
      return (ParamMap)m.Maybe();
    }

    public string MapsTo(string s)
    {
      //rewrite with find
      foreach (HDuple<string> d in this)
      {
        if (d == null)
          Log.Out(Log.Error, "Null in parameter map! Dumping:" + this);

        if (s == d.fst)
          return d.snd;
      }
      return null;
    }

    public ParamMap Filter(Predicate<HDuple<string>> f)
    {
      var npm = new ParamMap();
      foreach (var m in this)
        if (f(m))
          npm.Add(m);
      return npm;
    }

    public override string ToString()
    {
      string r = "";
      foreach (var ss in this)
        if (ss != null)
          r += ss + ";";
      return r;
    }

    public Dictionary<string, string> GetParamDictionary()
    {
        var dict = new Dictionary<string, string>();
        foreach (var d in this)
            dict.Add(d.fst, d.snd);
        return dict;

    }
  }

  public class Config
  {
    private ProcedureMap procMap;
    private ProcedureMap functionMap;
    public ProcedureMap FunctionMap
    {
      get { return functionMap; }
    }

    private ParamMap globalMap;
    public ParamMap GlobalMap
    {
      get { return new ParamMap(globalMap); }
    }

    private ParamMap typeMap;
    public ParamMap TypeMap
    {
      get { return new ParamMap(typeMap); }
    }

    private ParamMap constMap;
    public ParamMap ConstMap
    {
      get { return new ParamMap(constMap); }
    }

    public Config(string filename) : this()
    {
      StreamReader in_s = new StreamReader(filename);

      string l;
      while (!in_s.EndOfStream)
      {
        l = in_s.ReadLine().Trim();
        if (l.StartsWith("#")) //comment
          continue;
        if (l.StartsWith("globals:"))
          ParseGlobals(l.Substring(8));
        else if (l.StartsWith("types:"))
          ParseTypes(l.Substring(6));
        else if (l.StartsWith("constants:"))
          ParseConstants(l.Substring(11));
        else if (l.StartsWith("function:"))
          ParseFunction(l.Substring(10));
        else if (l.StartsWith("procedure:"))
          ParseProcedure(l.Substring(11));
        else
          continue;
      }

      return;
    }

    public Config()
    {
      procMap = new ProcedureMap("procedure");
      functionMap = new ProcedureMap("function");
      globalMap = new ParamMap();
      typeMap = new ParamMap();
      constMap = new ParamMap();
    }

    public void AddProcedure(Duple<HDuple<string>, ParamMap> mapping)
    {
      procMap.Add(mapping);
    }

    public void AddFunction(Duple<HDuple<string>, ParamMap> mapping)
    {
      functionMap.Add(mapping);
    }

    public void AddGlobal(HDuple<string> mapping)
    {
      globalMap.Add(mapping);
    }

    public void AddType(HDuple<string> mapping)
    {
      typeMap.Add(mapping);
    }

    public void AddConstant(HDuple<string> mapping)
    {
      constMap.Add(mapping);
    }

    private bool ParseGlobals(string l)
    {
      globalMap.AddRange(ParseParamMap(l));
      return false;
    }

    private bool ParseTypes(string l)
    {
      typeMap.AddRange(ParseParamMap(l));
      return false;
    }

    private bool ParseConstants(string l)
    {
      constMap.AddRange(ParseParamMap(l));
      return false;
    }

    private ParamMap ParseParamMap(string l)
    {
      l = l.Replace("(", "").Replace(")", "").Replace(" ", "");
      string[] fs = l.Split(';');

      return new ParamMap(fs.Map(x => x.Split(',')).Map(x => HDuple<string>.OfArray(x))).Filter(x => x != null);
    }

    private bool ParseIntoProcedureMap(string l, ProcedureMap map)
    {
      //(n,n)/(n',n');...
      l = l.Replace("(","").Replace(")","").Replace(" ","");
      string[] fs = l.Split('/');

      if (fs == null) return false;
      string[] ps;
      if (fs.Length == 1)
        ps = new string[0];
      else
        ps = fs[1].Split(';');

      return map.AddFromArray(fs[0].Split(','), ps);
    }

    private bool ParseProcedure(string l)
    {
      ParseIntoProcedureMap(l, procMap);
      return false;
    }

    private bool ParseFunction(string l)
    {
      ParseIntoProcedureMap(l, functionMap);
      return false;
    }

    public ParamMap FindProcedure(string f1, string f2)
    {
      return procMap.FindPair(f1, f2);
    }

    public ParamMap FindFunction(string f1, string f2)
    {
      return functionMap.FindPair(f1, f2);
    }

    public List<HDuple<string>> GetProcedureAssocList()
    {
      return procMap.ToProcedureAssocList();
    }

    public Dictionary<string, string> GetProcedureDictionary()
    {
      return procMap.ToProcedureDictionary();
    }

    public string LookupFunction(string f)
    {
      foreach (var d in procMap)
        if (d.fst.fst == f)
          return d.fst.snd;
      return null;
    }

    public override string ToString()
    {
      var s = "";
      if (globalMap.Count != 0)
        s += "#globals\nglobals: " + globalMap + "\n";
      if (typeMap.Count != 0)
        s += "#types\ntypes: " + typeMap + "\n";
      if (constMap.Count != 0)
        s += "#constants\nconstants: " + constMap + "\n";
      if (functionMap.Count != 0)
        s += "#functions\n" + functionMap + "\n";
      if (procMap.Count != 0)
        s += "#procedures\n" + procMap + "\n";
      return s;
    }
  }




}