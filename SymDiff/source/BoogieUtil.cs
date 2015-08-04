using System;
using System.Collections.Generic;
//using PureCollections;
using Microsoft.Boogie;
using SDiff;
using SymDiffUtils;

namespace SDiff.Boogie
{

  public static class C
  {
    public static TransferCmd dmyTransferCmd = new ReturnCmd(Token.NoToken);
    public static StructuredCmd dmyStructuredCmd = new BreakCmd(Token.NoToken, "");


    public static List<Variable> empVariableSeq = new List<Variable>();
    public static List<TypedIdent> empTypeIdentSeq = new List<TypedIdent>();
    public static List<TypeVariable> empTypeVariableSeq = new List<TypeVariable>();


    public static List<Expr> empExprSeq = new List<Expr>();
    public static List<IdentifierExpr> empIdentifierExprSeq = new List<IdentifierExpr>();
    public static List<Requires> empRequiresSeq = new List<Requires>();
    public static List<Ensures> empEnsuresSeq = new List<Ensures>();

    public static Cmd dmyCmd = new AssumeCmd(Token.NoToken, Expr.True);
  }

  public static class U
  {
    public static Expr BigAnd(Expr[] es)
    {
      Expr a = Expr.True;
      foreach (Expr e in es)
        a = Expr.And(e, a);
      return a;
    }

    public static IdentifierExpr[] IdentifierExprsOfVariableSeq(List<Variable> vs)
    {
      IdentifierExpr[] ids = new IdentifierExpr[vs.Count];
      for (int i = 0; i < vs.Count; i++)
        ids[i] = Expr.Ident(vs[i]);
      return ids;
    }

    public static List<IdentifierExpr> IdentifierExprSeqOfVariableSeq(List<Variable> vs)
    {
      return new List<IdentifierExpr>(IdentifierExprsOfVariableSeq(vs));
    }

    public static List<Expr> ExprSeqOfVariableSeq(List<Variable> vs)
    {
      return new List<Expr>(IdentifierExprsOfVariableSeq(vs));
    }

    public static Variable[] VariablesOfVariableSeq(List<Variable> vs)
    {
      Variable[] vas = null;
      if (vs == null)
        return vas;

      vas = new Variable[vs.Count];
      for(int i = 0; i < vs.Count; i++)
        vas[i] = vs[i];
      return vas;
    }

    public static void NameFunctionArgs(Function f)
    {
      int i = 0;
      foreach (Variable v in f.InParams)
        if (v.Name.Equals(""))
          v.Rename("arg_" + i++);
      if (f.OutParams[0].Name.Equals(""))
        f.OutParams[0].Name = "ret";
    }
  }

  public class NamedDeclarationEqualityComparer : IEqualityComparer<NamedDeclaration>
  {
    public bool Equals(NamedDeclaration a, NamedDeclaration b)
    {
      return a.Name == b.Name;
    }

    public int GetHashCode(NamedDeclaration a)
    {
      return a.Name.GetHashCode();
    }
  }

  //variable factory
  public static class Factory
  {
    public static GlobalVariable MakeGlobal(string name, Microsoft.Boogie.Type t)
    {
      return new GlobalVariable(Token.NoToken, new TypedIdent(Token.NoToken, name, t));
    }

    public static LocalVariable MakeLocal(string name, Microsoft.Boogie.Type t)
    {
      return new LocalVariable(Token.NoToken, new TypedIdent(Token.NoToken, name, t));
    }

    public static Formal MakeFormal(string name, Microsoft.Boogie.Type t, bool incoming)
    {
      return new Formal(Token.NoToken, new TypedIdent(Token.NoToken, name, t), incoming);
    }

    public static Constant MakeConstant(string name, Microsoft.Boogie.Type t)
    {
      return new Constant(Token.NoToken, new TypedIdent(Token.NoToken, name, t));
    }

    public static Variable Copy(Variable v)
    {
      if (v is Formal)
        return MakeFormal(v.Name, v.TypedIdent.Type, !v.IsMutable);
      if (v is LocalVariable)
        return MakeLocal(v.Name, v.TypedIdent.Type);
      if (v is GlobalVariable)
        return MakeGlobal(v.Name, v.TypedIdent.Type);
      if (v is Constant)
        return MakeConstant(v.Name, v.TypedIdent.Type);
      return null; //impossible!
    }
  }

  public class ConstantFactory
  {
    private static ConstantFactory instance = null;

    public readonly Dictionary<Microsoft.Boogie.Type, Constant> ConstantsByType;
    public readonly List<Constant> Constants;

    private ConstantFactory()
    {
      Constants = new List<Constant>();
      ConstantsByType = new Dictionary<Microsoft.Boogie.Type, Constant>();
    }

    public static ConstantFactory Get()
    {
      if (instance == null)
        instance = new ConstantFactory();
      return instance;
    }

    public Constant Make(Microsoft.Boogie.Type t)
    {
      Constant c;
      ConstantsByType.TryGetValue(t, out c);
      if (c == null)
      {
        c = Factory.MakeConstant("AA_CONST_" + t.ToString(), t);
        ConstantsByType.Add(t, c);
        Constants.Add(c);
      }
      return c;
    }

    public Constant Make(Variable v)
    {
      return Make(v.TypedIdent.Type);
    }

  }

  public static class SeqExt
  {
    public static List<Variable> Map(this List<Variable> vs, Converter<Variable, Variable> f)
    {
      var nvs = new List<Variable>();
      foreach (Variable v in vs)
        nvs.Add(f(v));
      return nvs;
    }
    public static List<Variable> Append(this List<Variable> vs, List<Variable> os)
    {
      var ns = new List<Variable>(vs);
      ns.AddRange(os);
      return ns;
    }
  }

  public static class BlockSeqExt
  {
    public static bool HasByLabel(this List<Block> bs, Block y)
    {
      if (y == null)
        return false;
      foreach (Block b in bs)
        if (b.Label.Equals(y.Label))
          return true;
      return false;
    }

    public static bool HasByLabelSuffix(this List<Block> bs, Block y)
    {
      if (y == null)
        return false;
      foreach (Block b in bs)
        if (b.Label.EndsWith(y.Label))
          return true;
      return false;
    }
  }


  public static class VariableExt
  {
    public static void Rename(this Variable v, string name)
    {
      v.Name = name;
      v.TypedIdent.Name = name;
    }
  }

  public static class ExprExt
  {
    public static bool StringEquals(this Expr e, object oo)
    {
      Expr o = oo as Expr;
      if (o == null)
        return false;
      var os = Util.BufEmit(o.Emit);
      var es = Util.BufEmit(e.Emit);
      return (es.Equals(os));
    }
  }

  public static class Process
  {
    public static Dictionary<string, Declaration> BuildProgramDictionary(List<Declaration> decls)
    {
      List<Declaration> dupeFree;
      Dictionary<string, Declaration> dict;
      DeclarationDictionary(decls, out dict, out dupeFree);
      return dict;
    }

    public static List<Declaration> RemoveDuplicateDeclarations(List<Declaration> decls)
    {
      List<Declaration> dupeFree;
      Dictionary<string, Declaration> dict;
      DeclarationDictionary(decls, out dict, out dupeFree);
      return dupeFree;
    }

    public static void DeclarationDictionary(List<Declaration> decls,
                                             out Dictionary<string, Declaration> dict,
                                             out List<Declaration> dupeFreeDecls)
    {
      dict = new Dictionary<string, Declaration>();
      dupeFreeDecls = new List<Declaration>();

      foreach (var decl in decls)
      {
        var nd = decl as NamedDeclaration;
        if (nd != null)
        {
          var ndName = nd.Name;
          if (decl is Variable)
              ndName += "$VAR";
          else if (decl is Implementation)
              ndName += "$IMPL";
          else if (decl is Procedure)
              ndName += "$PROC";
          else if (decl is TypeCtorDecl)
              ndName += "$TypeCtorDecl"; 

          if (dict.ContainsKey(ndName))
            continue;
          else
          {
            dupeFreeDecls.Add(nd);
            dict.Add(ndName, decl);
          }
        }
        else
          dupeFreeDecls.Add(decl);
      }
    }

    public static bool InitializeBoogie(string clo)
    {
      CommandLineOptions.Clo.RunningBoogieFromCommandLine = true;

      if (Options.refinedStmtTaint)
      {
          //IMPORTANT: need these two to make use of UNSAT cores!!
          CommandLineOptions.Clo.UseUnsatCoreForContractInfer = true; //ROHIT
          CommandLineOptions.Clo.ContractInfer = true; //ROHIT
          CommandLineOptions.Clo.ExplainHoudini = true; 
      }

      var args = clo.Split(' ');

      if (Options.VerboseBoogieEnvironment) 
      {
        Log.Out(Log.Normal, CommandLineOptions.Clo.Version);
        Log.Out(Log.Normal, "---Command arguments");
        foreach (string arg in args)
          Log.Out(Log.Normal, arg);
        Log.Out(Log.Normal, "--------------------");
      }

      CommandLineOptions.Clo.Parse(args);
    
      return false;
    }

    //call with null filename to print to console
    public static void PrintProgram(Program p, string filename)
    {
      TokenTextWriter outFile;
      if (filename != null)
        outFile = new TokenTextWriter(filename,true);
      else
        outFile = new TokenTextWriter(Console.Out,true);
      p.Emit(outFile);
      outFile.Close();
    }

    public static bool ResolveProgram(Program p, string filename)
    {
      //After p.Resolve, the AST is in p.topLevelDeclarations  
      int errorCount = p.Resolve();
      if (errorCount != 0)
        Console.WriteLine(errorCount + " name resolution errors in " + filename);
      return errorCount != 0;
    }

    public static bool TypecheckProgram(Program p, string filename)
    {
      //One of the sideeffect of p.Typecheck, it inlines 
      int errorCount = p.Typecheck();
      if (errorCount != 0)
        Console.WriteLine(errorCount + " type checking errors in " + filename);
      return errorCount != 0;
    }

    private static bool ResolveAndTypeCheck(Program p, string filename)
    {
      if (ResolveProgram(p, ""))
      {
        Log.Out(Log.Error, "Failed to resolve  program");
        return true;
      }
      if (TypecheckProgram(p, ""))
      {
        Log.Out(Log.Error, "Failed to typecheck program");
        //Log.LogEmit(Log.Normal, p.Emit);
        // PrintProgram(p, "");
        return true;
      }
      return false;
    }

    public static bool ResolveAndTypeCheckThrow(Program p, string filename)
    {
        if (ResolveAndTypeCheck(p, filename))
            throw new Exception("Program " + filename + " does not resolve/typecheck");
        return false;
    }


    public static Program ParseProgram(string f)
    {
      Program p = new Program();
      try
      {
//        if (Microsoft.Boogie.Parser.Parse(f, out p) != 0)
          //Boogie API has changed
          List<string> defs = new List<string>();
          if (Parser.Parse(f, defs, out p) != 0)
          {
          Console.WriteLine("Failed to read " + f);
          return null;
        }
      }
      catch (Exception e)
      {
        Console.WriteLine(e.ToString());
        return null;
      }
      return p;
    }


    public static bool SetModifies(List<Declaration> program, CallGraph cg)
    {
      foreach (var decl in program)
      {
        var p = decl as Procedure;
        if (p != null)
        {
          var cgNode = cg.NodeOfName(p.Name);
          if (cgNode == null)
          {
            Log.Out(Log.Error, "No callgraph node found for " + p.Name + "!");
            return true;
          }

          p.Modifies = U.IdentifierExprSeqOfVariableSeq(cgNode.WriteSetGlobals.ToVariableSeq());
        }
      }
      return false;
    }

    public static string UFofFunctionName(string functionName, string arg)
    {
      return "_uf_" + functionName + "_" + arg;
    }

    public static bool IsUFName(string name)
    {
      return name.StartsWith("_uf_");
    }

    public static bool InjectUninterpreted(Procedure left, Procedure right, Config cfg, CallGraph cg, List<Declaration> ufDeclarations,bool asserts=false)
    {
      if (left == null || right == null | ufDeclarations == null)
        return true;

      int i, j;

      var leftNode = cg.NodeOfName(left.Name);
      var rightNode = cg.NodeOfName(right.Name);
      if (leftNode == null)
      {
        Log.Out(Log.Error, "No callgraph node found for " + left.Name + "!");
        return true;
      }
      if (rightNode == null)
      {
        Log.Out(Log.Error, "No callgraph node found for " + right.Name + "!");
        return true;
      }
      if (left.InParams.Count != right.InParams.Count)
        return true;

      //use read and write sets to compute globals into UF
      var globalsIn = leftNode.ReadSetGlobals;
      foreach (var v in rightNode.ReadSetGlobals)
        if (!globalsIn.Contains(v))
          globalsIn.Add(v);
      var globalsLeftOut =
        leftNode.WriteSetGlobals;
      var globalsRightOut =
        rightNode.WriteSetGlobals;

      ParamMap paramMap = cfg.FindProcedure(left.Name, right.Name);

      //use formals of left, right to compute formals into UF
      //inParams is the union of the left, right inparams
      var rightInParams = new List<Variable>(right.InParams);
      var leftInParams = new List<Variable>(left.InParams);
      //map the left variables to their right correspondents
      var leftVRenamer = new VariableRenamer(paramMap, rightInParams);
      var leftInParamsMapped = leftVRenamer.VisitVariableSeq(new List<Variable>(leftInParams));
      var inParams = new List<Variable>(rightInParams);
      foreach (Variable v in leftInParamsMapped)
        if (!inParams.Contains(v))
          inParams.Add(v);

      //outParams is the intersection fo the left, right outparams
      var leftOutParamsO = new List<Variable>(left.OutParams);
      var rightOutParamsO = new List<Variable>(right.OutParams);
      
      //add globals to outputs
      leftOutParamsO.AddRange(globalsLeftOut.ToVariableSeq());
      rightOutParamsO.AddRange(globalsRightOut.ToVariableSeq());
      //map the left variables to their right correspondents again
      leftVRenamer.AddDecls(rightOutParamsO);
      var leftOutParamsMapped = leftVRenamer.VisitVariableSeq(new List<Variable>(leftOutParamsO));


      var outParams = new List<Variable>();
      foreach (Variable v in leftOutParamsMapped)
        if (rightOutParamsO.Contains(v))
          outParams.Add(v);

      //append globals to inputs
      int numNonGlobals = inParams.Count;
      inParams.AddRange(globalsIn.Map(x => x as Variable).ToVariableSeq());

      //instrumentation
      if (BadGlobalState.MaxUFArgs < inParams.Count)
        BadGlobalState.MaxUFArgs = inParams.Count;
      BadGlobalState.SumUFArgs += inParams.Count;
      BadGlobalState.NumUFs++;

      //now we have all the formals for the functions..
      //we build UFs for the left in the case that the two are not found equiv. the map is not used
      Dictionary<Variable, Function> formalToFunLeft, formalToFunRight;
      MakeUFs(leftOutParamsMapped.Append(rightOutParamsO), inParams, UFofFunctionName(right.Name, ""), ufDeclarations, out formalToFunRight);
      MakeUFs(leftOutParamsO, inParams, UFofFunctionName(left.Name, ""), ufDeclarations, out formalToFunLeft);
      
      //build arguments for the left side
      var leftArgsArray = new Expr[inParams.Count];
      leftArgsArray.InitNull();
      for (i = 0; i < leftInParamsMapped.Count; i++)
        for (j = 0; j < inParams.Count; j++)
          if (leftInParamsMapped[i] == inParams[j])
            leftArgsArray[j] = Expr.Ident(left.InParams[i]);
      for (i = 0; i < numNonGlobals; i++)
        if (leftArgsArray[i] == null)
          leftArgsArray[i] = Expr.Ident(ConstantFactory.Get().Make(inParams[i]));

      //build arguments for the right side
      var rightArgsArray = new Expr[inParams.Count];
      rightArgsArray.InitNull();
      for (i = 0; i < rightInParams.Count; i++)
        rightArgsArray[i] = Expr.Ident(right.InParams[i]);
      for (i = rightInParams.Count; i < numNonGlobals; i++)
        rightArgsArray[i] = Expr.Ident(ConstantFactory.Get().Make(inParams[i]));

      //finally, build the argument expressions for the globals
      for (i = numNonGlobals; i < inParams.Count; i++)
        leftArgsArray[i] = rightArgsArray[i] =
          new OldExpr(Token.NoToken, Expr.Ident(globalsIn[i - numNonGlobals]));

      var leftArgs = leftArgsArray.ToExprSeq();
      var rightArgs = rightArgsArray.ToExprSeq();

      List<Ensures> leftEnsures, rightEnsures;
      MakeUFPostconditions(formalToFunRight, leftOutParamsMapped, leftOutParamsO, leftArgs, out leftEnsures);
      MakeUFPostconditions(formalToFunRight, rightOutParamsO, rightOutParamsO, rightArgs, out rightEnsures);

          //left.Ensures = leftEnsures;
          //right.Ensures = rightEnsures;

          //add to the list of pre/post conditions
      left.Ensures.AddRange(leftEnsures);
      right.Ensures.AddRange(rightEnsures);
        
         return false;
    }

    private static void MakeUFs(List<Variable> vs, List<Variable> inParams, string funName, List<Declaration> funs, out Dictionary<Variable, Function> dict)
    {
      dict = new Dictionary<Variable, Function>();
      foreach (Variable v in vs)
      {
        if (dict.ContainsKey(v))
          continue;

        int k = 0;
        var fun = new Function(Token.NoToken, funName + v.Name, 
          inParams.Map(xx => Factory.MakeFormal("arg_" + k++, xx.TypedIdent.Type, true)),
          Factory.MakeFormal("out_" + v.Name, v.TypedIdent.Type, false));
        funs.Add(fun);
        dict.Add(v, fun);
      }
    }

    private static void MakeUFPostconditions(Dictionary<Variable, Function> formalToFun,
                                                   List<Variable> mappedVars,
                                                   List<Variable> vars,
                                                   List<Expr> args, out List<Ensures> ensures)
    {
      ensures = new List<Ensures>();
      for (int i = 0; i < vars.Count; i++)
      {
        var fun = formalToFun.Get(mappedVars[i]);
        if (fun != null)
        {
          var functionCall =
            new FunctionCall(new IdentifierExpr(Token.NoToken, fun.Name, fun.OutParams[0].TypedIdent.Type));
          functionCall.Func = fun;
          var callExpr = new NAryExpr(Token.NoToken, functionCall, args);
          var eqExpr = Expr.Eq(Expr.Ident(vars[i]), callExpr);
          ensures.Add(new Ensures(true, eqExpr));
        }
      }
    }

    public static bool RewriteUninterpretedOnDiseq(VerificationTask vt, Dictionary<string, Declaration> progDict,List<string> InequalProc = null)
    {
      if (InequalProc==null || InequalProc.Count == 0)
      {
         if(vt.Result != VerificationResult.Error)
            return true;
         var fRenamer = new FunctionCallMapper(x => progDict.Get(x.Name.Replace(vt.Right.Name, vt.Left.Name)) as Function);
         fRenamer.Visit(vt.Left.Proc);
         return false;

      }
      if (InequalProc.Contains(vt.Left.Name.Split('.')[1]) && InequalProc.Contains(vt.Right.Name.Split('.')[1]))
      {
          var fRenamer = new FunctionCallMapper(x => progDict.Get(x.Name.Replace(vt.Right.Name, vt.Left.Name)) as Function);
          fRenamer.Visit(vt.Left.Proc);
          return false;
      }
      return true;
    }
  }
}