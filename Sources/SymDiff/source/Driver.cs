using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using Microsoft.Boogie;
using Bpl = Microsoft.Boogie;
using B = SDiff.Boogie;
using SDiff.Boogie;
using SymDiffUtils;
using Util = SymDiffUtils.Util;


// This is the main procedure

//high/low level notes:
//
//    printing ASTs: see boogieutil.cs::Process.PrintProgram
//    also see Log.LogEmit, and Util.BufEmit
//
//wholeprogram.cs
//    symdiff's main
//visitor.cs
//    boogie AST visitors. especially see FixedVisitor class
//util.cs
//    general C# utility classes. many extension methods for system.collections.generic.* here
//transform.cs
//    low level boogie ast transformations. particular EqualityReduction (implements EQ) + uif construction
//    Cognizant of Boogie's internal invariants
//symexec.cs
//    definitional classes for symbolic execution
//state.cs
//    convenience class defining a block of boogie state. emits boogie code to save and restore
//    abstracts a set of Boogie variables
//simplecollections.cs
//    a simple graph class 
//proceduredriver.cs
//    deprecated
//worklist.cs
//    deprecated
//options.cs
//    logger and compile time options
//driver.cs *this file*
//    program front-end, many small utilities implemented here
//config.cs
//    config file parser and convenience methods
//cexvisitor.cs
//    action code for symbolic execution
//    used in BoogieVerify
//callgraphvisitor.cs
//    read write set analysis, mostly
//callgraph.cs
//    the callgraph data structure
//boogieverify.cs
//    glue code between symdiff and the boogie verifier
//    This is the API with Verify and Counterexamples from Boogie
//boogieutil.cs
//    convenience and utilities for boogie ASTs. also includes Process class, which contains some key AST transformers
//    Cognizant of Boogie's internal invariants


namespace SDiff
{
  public class Driver
  {
    public static int Main(string[] args)
    {
        CommandLineOptions.Install(new CommandLineOptions());

      if (args.Length == 0)
      {
        Console.WriteLine("Options:");
        Console.WriteLine("for option usage, run the option with no arguments");
        Console.WriteLine("for debugging, run the options a -break");
        Console.WriteLine("\nTop level options\n");
        Console.WriteLine("-inferConfig");
        Console.WriteLine("    guess the most obvious configuration for a pair of BPL files");
        Console.WriteLine("-allInOne");
        Console.WriteLine("    option to do analyze two BPL programs");
        Console.WriteLine("-loopUnroll");
        Console.WriteLine("    unroll loops in a boogie program");
        Console.WriteLine("-extractLoops[:n]");
        Console.WriteLine("    extracts loops as tail-recursive functions (optional :n makes extracted proc non-deterministic)");

        Console.WriteLine("\nHelper options\n");
        Console.WriteLine("-recurCheck");
        Console.WriteLine("    check a file for recursion (mutual or single)");
        Console.WriteLine("-tryParse");
        Console.WriteLine("    try to parse a bpl file");
        Console.WriteLine("-printCallGraph");
        Console.WriteLine("    print a callgraph in graphviz format");
        Console.WriteLine("-dumpeq");
        Console.WriteLine("    Dump the equivalent procedures in dump_f1_f2.txt");

        //RS: Display the new options
         return 1;
      }
      bool breakSeen = false;
      for (int i = 0; i < args.Length; i++)
      {
          if (breakSeen) { args[i - 1] = args[i]; args[i] = "-break"; }
          if (args[i] == "-break" || args[i] == "/break") breakSeen = true; //eat the "-break"
      }
      if (breakSeen)
          System.Diagnostics.Debugger.Launch();

      if (args[0].Equals("-inferConfig"))
      {
          if (args.Length < 3)
          {
              Console.WriteLine("Usage: SymDiff -inferConfig <a.bpl> <b.bpl>");
              return 1;
          }

          args[0] = args[1];
          args[1] = args[2];
          return GuessConfig(args);
      }
      else if (args[0].Equals("-allInOne"))
      {
          var nargs = new List<string>();
        for (int i = 0; i < args.Length - 1; i++)
           nargs.Add(args[i + 1]);     
          try   {
              return AllInOneDriver.AllInOneMain(nargs.ToArray());
          } catch (Exception e) {
              Console.WriteLine("Fatal error: SymDiff failed with exception " + e.Message);
              Console.WriteLine(e.StackTrace);
              return 1;
          }
      }
      else if (args[0].Equals("-loopUnroll"))
      {
        if (args.Length < 4)
        {
          Console.WriteLine("Usage: SymDiff -loopUnroll depth infile outfile");
          return 1;
        }
        return LoopUnroller(args);
      }
      else if (args[0].StartsWith("-extractLoops")) //can be -extractLoops:n to make non-det loop extract
      {
          if (args.Length < 3)
          {
              Console.WriteLine("Usage: SymDiff -extractLoops[:n] infile outfile //optional :n");
              return 1;
          }
          return ExtractLoops(args);
      }
      else if (args[0].Equals("-tryParse"))
      {
        if (args.Length < 2)
        {
          Console.WriteLine("Usage: Symdiff -tryParse infile");
          return 1;
        }
        var prog = BoogieUtils.ParseProgram(args[1]);
        if (prog == null)
          return 1;
        if (BoogieUtils.ResolveAndTypeCheckThrow(prog, args[1]))
          return 1;
        return 0;
      }
      else if (args[0].Equals("-recurCheck"))
      {
        if (args.Length < 2)
        {
          Console.WriteLine("Usage: SymDiff -recurCheck test.bpl");
          return 1;
        }
        return RecursionCheck(args[1]);
      }
      else if (args[0].Equals("-printCallGraph"))
      {
        if (args.Length < 2)
        {
          Console.WriteLine("Usage: Symdiff -printCallGraph test.bpl");
          return 1;
        }
        return PrintCallGraph(args[1]);
      }

      Console.WriteLine("Symdiff: run with no arguments to see options");
      return 0;
    }

    public static int PrintCallGraph(string filename)
    {
        var program = BoogieUtils.ParseProgram(filename);
      if (program == null)
      {
        Console.WriteLine("parse failed");
        return 1;
      }
      if (BoogieUtils.ResolveAndTypeCheckThrow(program, filename))
      if (program == null)
      {
        Console.WriteLine("check failed");
        return 1;
      }

      var cg = CallGraph.Make(program);
      Console.WriteLine("digraph G {");
      cg.Print();
      Console.WriteLine("}");

      return 0;
    }
     
    public static int RecursionCheck(string filename)
    {
        var program = BoogieUtils.ParseProgram(filename);
      if (program == null)
        return 1;
      BoogieUtils.ResolveAndTypeCheckThrow(program, filename);

      var flag = false;
      var mflag = false;
      var nflag = false;

      var cg = CallGraph.Make(program);

      var recs = cg.SinglyRecursiveFns();
      foreach (var node in recs)
        Console.WriteLine(node.Name);

      nflag = cg.HasCycle();

      foreach (var scc in cg.ComputeSCCs())
      {
        if ((scc.Count == 1 && scc[0].IsSinglyRecursive()))
          flag = true;
        if (scc.Count > 1)
          mflag = true;
      }

      if (flag)
        Console.WriteLine("Recursive.");
      if (mflag)
        Console.WriteLine("Multi_Recursive");
      if (nflag)
        Console.WriteLine("Naive cycle detector found a non-singleton cycle!");
      return 0;
    }

    public static int LoopUnroller(string[] args)
    {
      var filename = args[2];
      int iterationsToUnroll = Int16.Parse(args[1]);
      var outfilename = args[3];

      string boogieOptions = "/printInstrumented " + Options.BoogieUserOpts;
      //Log.Out(Log.Normal, "Initializing Boogie");
      if (SDiff.Boogie.Process.InitializeBoogie(boogieOptions))
        return 1;

      var program = BoogieUtils.ParseProgram(filename);
      if (program == null)
      {
        Log.Out(Log.Error, "Parse failed.");
        return 1;
      }
      if (BoogieUtils.ResolveAndTypeCheckThrow(program, filename))
      {
        Log.Out(Log.Error, "Check failed.");
        return 1;
      }
      
      program.UnrollLoops(iterationsToUnroll, false); //setting it to true breaks ex7

        
      var outchan = new TokenTextWriter(outfilename, true);
      program.Emit(outchan);
      outchan.Close();
      return 0;
    }

    public static int ExtractLoops(string[] args)
    {
        var filename = args[1];
        var outfilename = args[2];

        string boogieOptions = "/printInstrumented  " + Options.BoogieUserOpts;

        if (args[0] == "-extractLoops") //if -extractLoops:n then don't pass the flag (need to fix a bug 7/1/15)
            boogieOptions += " /deterministicExtractLoops ";

        //Log.Out(Log.Normal, "Initializing Boogie");
        if (SDiff.Boogie.Process.InitializeBoogie(boogieOptions))
            return 1;

        var program = BoogieUtils.ParseProgram(filename);
        if (program == null)
        {
            Log.Out(Log.Error, "Parse failed.");
            return 1;
        }
        if (BoogieUtils.ResolveAndTypeCheckThrow(program, filename))
        {
            Log.Out(Log.Error, "Check failed.");
            return 1;
        }

        Dictionary<string, Dictionary<string, Block>> tmp = program.ExtractLoops();

        // the hacks below should be history now with the deterministic Loop extract in Boogie 

        ///*
        // * iterate over each procedure in program 
        // * find the extracted procedures by name
        // * Find the exit block in the extracted procedure
        // * The name of the exit block is "exit"
        // * The exit block should have no statements
        // * add "assume false" as the single statement
        // * [FIXME] This is possibly buggy for the simple example {for(i=0..2) l++;} {for(i=0..3) l++;}
        // * [FIX for modular checking]: make the non-det deterministic (see email on Current Loop extract fix for SymDiff, 5/4/12)
        // * This fix may not be ok for the case of inlining, as all instances either execute the body or exit
        // */
        //List<Declaration> impls = program.TopLevelDeclarations.Where(x => x is Implementation);
        //TypedIdent tid = new TypedIdent(new Token(), "__loop_nondet_" /*+ impl.Name*/, new BasicType(SimpleType.Bool));
        //GlobalVariable loopNonDet = new GlobalVariable(new Token(), tid);
        //program.TopLevelDeclarations.Insert(0, loopNonDet);
        //foreach (Implementation impl in impls)
        //    if (impl.Name.Contains("_loop_")) //TODO: this is just too hacky
        //    {
        //        //add a boolean constant
        //        //HACK: We don't add the impl.Name to avoid mapping problems with different loop names
        //        //      This may cause problem if these functions are inlined more than once
        //        string loopHeadLabel = "";
        //        foreach (Block bl in impl.Blocks)
        //        {                    
        //            if (bl.Label == "entry")
        //                loopHeadLabel = FindLoopHeadLabel(bl); 
        //            if (bl.Label == loopHeadLabel) { 
        //                AssumeCmd ac = new AssumeCmd(Token.NoToken, Expr.Ident(loopNonDet));
        //                bl.Cmds = new List<Cmd>();
        //                bl.Cmds.Add(ac);
        //            }

        //            if (bl.Label == "exit") {
        //                //insert assume false
        //                //AssumeCmd ac = new AssumeCmd(Token.NoToken, Expr.False);
        //                AssumeCmd ac = new AssumeCmd(Token.NoToken, Expr.Not(Expr.Ident(loopNonDet)));
        //                bl.Cmds = new List<Cmd>();
        //                bl.Cmds.Add(ac);
        //            }
        //        }
        //        if (loopHeadLabel == "") {
        //            throw new Exception("Could not find loophead during loop extraction");
        //        }                
        //    }
            


        var outchan = new TokenTextWriter(outfilename,true);
        program.Emit(outchan);
        outchan.Close();
        return 0;
    }

    private static string FindLoopHeadLabel(Block bl)
    {
        //this block should have the following structure
        var cmd = bl.TransferCmd;
        var gcmd = cmd as GotoCmd;
        if (gcmd == null) return "";
        var blseq = ((GotoCmd)cmd).labelTargets;
        foreach(var b in blseq) {
            if (((Block)b).Label != "exit") //anything ohter than "exit"
                return ((Block)b).Label;
        }
        return "";
    }

    public static int GuessConfig(string[] args)
    {
        string boogieOptions = Options.BoogieUserOpts;
        //Log.Out(Log.Normal, "Initializing Boogie");
        if (SDiff.Boogie.Process.InitializeBoogie(boogieOptions))
            return 1;


        string
          first = args[0],
          second = args[1];

        // First program
        Program p = BoogieUtils.ParseProgram(first);
        if (p == null)
            return 1;

        BoogieUtils.ResolveProgram(p, first);
        BoogieUtils.TypecheckProgram(p, first);

        // Second program
        Program q = BoogieUtils.ParseProgram(second);
        if (q == null)
            return 1;

        BoogieUtils.ResolveProgram(q, second);
        BoogieUtils.TypecheckProgram(q, second);


        first = Path.GetFileNameWithoutExtension(first) + '.';
        second = Path.GetFileNameWithoutExtension(second) + '.';

        Config config = new Config();

        //store the procs of q by name
        Dictionary<string, Declaration> qProcs = new Dictionary<string, Declaration>();
        Dictionary<string, HashSet<string>> qLoops = new Dictionary<string, HashSet<string>>();

        foreach (Declaration d in q.TopLevelDeclarations)
        {
            var proc = d as Procedure;
            if (proc != null)
            {
                qProcs.Add(proc.Name, proc);
                if (proc.Name.Contains("_loop_"))
                {
                    int indx = proc.Name.IndexOf("_loop_");
                    string loopProc = proc.Name.Substring(0, indx);
                    if (!qLoops.ContainsKey(loopProc))
                        qLoops.Add(loopProc, new HashSet<string>());
                    qLoops[loopProc].Add(proc.Name);

                }
            }
        }

        foreach (Declaration d in p.TopLevelDeclarations)
        {
            var proc = d as Procedure;
            if (proc != null)
            {

                if (Util.IsInlinedProc(proc))
                    continue;

                var pmap = new ParamMap();
                foreach (Variable v in proc.InParams)
                    pmap.Add(new HDuple<string>(v.Name, v.Name));
                foreach (Variable v in proc.OutParams)
                    pmap.Add(new HDuple<string>(v.Name, v.Name));

                //config.AddProcedure(new Duple<HDuple<string>, ParamMap>(new HDuple<string>(first + proc.Name, second + proc.Name), pmap));

                if (qProcs.ContainsKey(proc.Name))
                    config.AddProcedure(new Duple<HDuple<string>, ParamMap>(new HDuple<string>(first + proc.Name, second + proc.Name), pmap));
                else //match loops (A BIG HACK that pretends that the enclosing procedure has only one loop and the mappings are same)
                {
                    if (proc.Name.Contains("_loop_"))
                    {
                        int indx = proc.Name.IndexOf("_loop_");
                        string loopProc = proc.Name.Substring(0, indx);
                        if (qLoops.ContainsKey(loopProc) &&
                            qLoops[loopProc].Count == 1)
                        {
                            HashSet<string> matchQProcs = qLoops[loopProc];
                            string qProcName = "";
                            foreach (string s in matchQProcs) //ugly way to get the singleton string
                                qProcName = s;

                            config.AddProcedure(new Duple<HDuple<string>, ParamMap>(new HDuple<string>(first + proc.Name, second + qProcName), pmap));

                        }


                    }
                }
            }

            var global = d as GlobalVariable;
            if (global != null)
                config.AddGlobal(new HDuple<string>(first + global.Name, second + global.Name));
            
            var constant = d as Constant;
            if (constant != null)
                config.AddConstant(new HDuple<string>(first + constant.Name, second + constant.Name));

            var function = d as Function;
            if (function != null)
            {
                var pmap = new ParamMap();
                int i = 0;
                foreach (Variable v in function.InParams)
                {
                    if (v.Name.Trim().Equals(""))
                        v.Name = "arg_" + i++;
                    pmap.Add(new HDuple<string>(v.Name, v.Name));
                }
                if (function.OutParams[0].Name.Equals(""))
                    function.OutParams[0].Name = "out_ret";
                pmap.Add(new HDuple<string>(function.OutParams[0].Name, function.OutParams[0].Name));

                config.AddFunction(new Duple<HDuple<string>, ParamMap>(new HDuple<string>(first + function.Name, second + function.Name), pmap));
            }

            var typector = d as TypeCtorDecl;
            if (typector != null)
                config.AddType(new HDuple<string>(first + typector.Name, second + typector.Name));

            var typesyn = d as TypeSynonymDecl;
            if (typesyn != null)
                config.AddType(new HDuple<string>(first + typesyn.Name, second + typesyn.Name));
        }

        Console.WriteLine(config.ToString());
        return 0;
    }

    public static BigBlock BlockToBigBlock(Block b)
    {
      return new BigBlock(Token.NoToken, b.Label, b.Cmds, null, b.TransferCmd);
    }
  }
}