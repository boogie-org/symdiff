using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.Boogie;
using B = SDiff.Boogie;
using SDiff.Boogie;
using SymDiffUtils;

/* High level code transformation */

namespace SDiff
{

  public class Transform
  {
    public delegate Variable CreateVariable(string name, Microsoft.Boogie.Type t);

    public static Program MergePrograms(List<Declaration> code_block, List<Declaration> p1, List<Declaration> p2)
    {
      var ds = p2.Partition(x => x is GlobalVariable);
      var mergedDecls = ds.fst;
      mergedDecls.AddRange(p1);
      mergedDecls.AddRange(ds.snd);
      mergedDecls.AddRange(code_block);

      Program mp = new Program();
      mp.TopLevelDeclarations = mergedDecls;
      return mp;
    }

    public static List<Variable> FreshVariables(List<Variable> vs, CreateVariable f)
    {
      var nvs = new List<Variable>();
      foreach (Variable v in vs)
        nvs.Add(f(v.TypedIdent.Name, v.TypedIdent.Type));
      return nvs;
    }

    public static List<Variable> DuplicateVariableSeq(List<Variable> vs)
    {
      var nvs = new List<Variable>();
      foreach (Variable v in vs)
        nvs.Add(B.Factory.Copy(v));
      return nvs;
    }

    //merges two variable sequences using a map. returns mapped seqs and their union
    //node map is ordered by argument order
    public static void MergeVariableSequencesByMap(List<Variable> v1, List<Variable> v2, ParamMap map, out List<Variable> newV1, out List<Variable> union, out List<Variable> inter)
    {
      var renamer = new VariableRenamer(map, v2);
      newV1 = renamer.VisitVariableSeq(new List<Variable>(v1));

      union = new List<Variable>(v2);
      inter = new List<Variable>();

      foreach (Variable v in newV1)
        if (!v2.Contains(v))
          union.Add(v);
        else
          inter.Add(v);
    }

    public static Variable CustomClone(Variable v) {
      return new LocalVariable(v.tok, 
        new TypedIdent(v.TypedIdent.tok, v.TypedIdent.Name.Clone() as string, v.TypedIdent.Type.Clone() as Microsoft.Boogie.Type));
    }

    public static Duple<Procedure, Implementation> CustomEqualityReduction(Implementation i1,
                                                                           Implementation i2,
                                                                           ParamMap argMap,
                                                                           HashSet<Variable> ignoreSet,
                                                                           Program mergedProgram,
                                                                           out List<Variable> outputVarsForVFTask,
                                                                           out EqualityProcedureParameterInfo eqParamInfo)
    {
      Procedure
        d1 = i1.Proc,
        d2 = i2.Proc;

      var globals = new List<Variable>();
      foreach (IdentifierExpr ie in d1.Modifies)
        globals.Add(ie.Decl);
      foreach (IdentifierExpr ie in d2.Modifies)
        if(!globals.Contains(ie.Decl))
          globals.Add(ie.Decl);

      string
        d1n = d1.Name,
        d2n = d2.Name;

      // Discern the names of the two output sets to be compared
      List<Variable> d1OutClones = d1.OutParams.Select(x => CustomClone(x)).ToList();
      List<Variable> d2OutClones = d2.OutParams.Select(x => CustomClone(x)).ToList();

      foreach (var x in d1OutClones) {
        x.TypedIdent.Name = x.TypedIdent.Name + "1";
      }
      foreach (var x in d2OutClones) {
        x.TypedIdent.Name = x.TypedIdent.Name + "2";
      }

      // Discern the names of the two input sets to be compared

      List<Variable> d1InClones = d1.InParams.Select(x => CustomClone(x)).ToList();
      List<Variable> d2InClones = d2.InParams.Select(x => CustomClone(x)).ToList();

      foreach (var x in d1InClones) {
        x.TypedIdent.Name = x.TypedIdent.Name + "1";
      }
      foreach (var x in d2InClones) {
        x.TypedIdent.Name = x.TypedIdent.Name + "2";
      }


      List<Variable>
        outs1 = FreshVariables(d1OutClones, B.Factory.MakeLocal),
        outs2 = FreshVariables(d2OutClones, B.Factory.MakeLocal),
        ins1 = FreshVariables(d1InClones, (x, y) => B.Factory.MakeFormal(x, y, true)),
        ins2 = FreshVariables(d2InClones, (x, y) => B.Factory.MakeFormal(x, y, true));

      var locals = new List<Variable>();
      locals.AddRange(outs1);
      locals.AddRange(outs2);

      // Both sets of vars included to support input heap comparisons from two different heaps
      List<Variable> unionIns = new List<Variable>();
      unionIns.AddRange(ins1);
      unionIns.AddRange(ins2);

      /***** Emit function calls *****/

      var c1Ins = B.U.ExprSeqOfVariableSeq(ins1);
      var c1Outs = B.U.IdentifierExprSeqOfVariableSeq(outs1);
      var c2Ins = B.U.ExprSeqOfVariableSeq(ins2);
      var c2Outs = B.U.IdentifierExprSeqOfVariableSeq(outs2);

      CallCmd
        c1 = new CallCmd(Token.NoToken, d1n, c1Ins, c1Outs),
        c2 = new CallCmd(Token.NoToken, d2n, c2Ins, c2Outs);

      /***** Emit comparison, outputVars *****/
      var outputVars = new List<Duple<string, Variable>>();

      eqParamInfo = new EqualityProcedureParameterInfo(new List<string>(), new List<string>(), 
        new List<string>(), new List<string>(), new List<string>(), new List<string>(), new List<string>());

      outputVarsForVFTask = new List<Variable>();

      /***** Compile procedure body ****/

      var body = new List<Cmd>();
      
      List<Ensures> outputPostConditions = new List<Ensures>();

      var eqModifies = new List<IdentifierExpr>(d1.Modifies);
      eqModifies.AddRange(d2.Modifies);

      var procName = mkEqProcName(d1.Name, d2.Name);

      var eqProc =
        new Procedure(Token.NoToken, procName, B.C.empTypeVariableSeq, unionIns,
        new List<Variable>(), isPure:false,
        B.C.empRequiresSeq, eqModifies, new List<Ensures>(outputPostConditions));

      var bl =
        new BigBlock(Token.NoToken, "AA_INSTR_EQ_BODY", body, null, B.C.dmyTransferCmd);
      var bll = new List<BigBlock> { bl };

      
      /***** CUSTOM HEAP COMPARISON PREDICATES *****/

      var heapVarsForSize = mergedProgram.TopLevelDeclarations.OfType<GlobalVariable>().Where(
        d => ((d.TypedIdent.Name.Contains("arrSizeHeap")) || (d.TypedIdent.Type is CtorType))
              && !(d.TypedIdent.Name.Contains("type") || d.TypedIdent.Name.Contains("Type"))
      );

      foreach (var x in heapVarsForSize) {
        if (!globals.Contains(x)) {
          globals.Add(x);
        }
      }

      List<Formal> globalsToPropagate = globals.Select(x => new Formal(x.tok, x.TypedIdent, true)).ToList();

      // Add the pre-call assumptions about the inputs
      Options.GenerateComparisons(globalsToPropagate, B.U.IdentifierExprSeqOfVariableSeq(ins1), B.U.IdentifierExprSeqOfVariableSeq(ins2), 
        mergedProgram, mergedProgram, bl, locals, true);

      // Add the procedure calls
      body.Add(c1);
      body.Add(c2);

      // Add the post-call assertions about return values
      Options.GenerateComparisons(globalsToPropagate, c1Outs, c2Outs, mergedProgram, mergedProgram, bl, locals, false);

      /***** END CUSTOM HEAP COMPARISON PREDICATES *****/

      var eqImp =
        new Implementation(Token.NoToken, procName, B.C.empTypeVariableSeq, unionIns,
        new List<Variable>(),
        locals, new StmtList(bll, Token.NoToken));

      var l = new List<Declaration>();

      return new Duple<Procedure, Implementation>(eqProc, eqImp);
    }

    public static Duple<Procedure, Implementation> EqualityReduction(Implementation i1,
                                                                     Implementation i2,
                                                                     ParamMap argMap,
                                                                     HashSet<Variable> ignoreSet,
                                                                     Program mergedProgram,
                                                                     out List<Variable> outputVarsForVFTask,
                                                                     out EqualityProcedureParameterInfo eqParamInfo)
    {
      // If using custom heap comparison predicates for this comparison, do this
      if (Options.CustomHeapComparison) {
        return CustomEqualityReduction(i1, i2, argMap, ignoreSet, mergedProgram, out outputVarsForVFTask, out eqParamInfo);
      }

      //map ins1
      //map outs1
      //save globals (1)
      //...
      //call
      //...
      //save outs
      //save globals (2)
      //restore globals (1)
      //...
      //call
      //...
      //compare

      Procedure
        d1 = i1.Proc,
        d2 = i2.Proc;

      var globals = new List<Variable>();
      foreach (IdentifierExpr ie in d1.Modifies)
        globals.Add(ie.Decl);
      foreach (IdentifierExpr ie in d2.Modifies)
        if(!globals.Contains(ie.Decl))
          globals.Add(ie.Decl);

      /***** Produce mapped list of identifiers *****/

      string
        d1n = d1.Name,
        d2n = d2.Name;

      List<Variable>
        outs1 = FreshVariables(d1.OutParams, B.Factory.MakeLocal),
        outs2 = FreshVariables(d2.OutParams, B.Factory.MakeLocal),
        ins1 = FreshVariables(d1.InParams, (x, y) => B.Factory.MakeFormal(x, y, true)),
        ins2 = FreshVariables(d2.InParams, (x, y) => B.Factory.MakeFormal(x, y, true));

      /***** Compute correspondence between d1's ins/outs and d2's ins/outs *****/

      List<Variable>
        unionIns,
        unionOuts,
        newIns1,
        newOuts1,
        interIns,
        interOuts;

      MergeVariableSequencesByMap(ins1, ins2, argMap, out newIns1, out unionIns, out interIns);
      MergeVariableSequencesByMap(outs1, outs2, argMap, out newOuts1, out unionOuts, out interOuts);

      ins1 = newIns1;
      outs1 = newOuts1;

      /***** Map ignore set to the new variables *****/

      for (int i = 0; i < i2.OutParams.Count; i++)
        if (ignoreSet.Contains(i2.OutParams[i]))
        {
          Log.Out(Log.Warning, "Equality reduction ignoring variable: " + outs2[i].Name);
          ignoreSet.Add(outs2[i]);
        }

      /***** Emit instructions for saving and restoring *****/

      SaveBlock savedInitialGlobals = new SaveBlock(globals.Count);
      SaveBlock savedc1Globals = new SaveBlock(globals.Count);
      SaveBlock savedOutputs = new SaveBlock(interOuts.Count);
      SaveBlock savedIns1 = new SaveBlock(ins1.Count);
      SaveBlock savedIns2 = new SaveBlock(ins2.Count);

      var globalsArr = B.U.VariablesOfVariableSeq(globals);

      Cmd[]
        prec1Copy = savedInitialGlobals.EmitSave(globalsArr),
        postc1Copy = savedc1Globals.EmitSave(globalsArr),
        postc1Restore = savedInitialGlobals.EmitRestore(globalsArr),
        prec2Copy = savedOutputs.EmitSave(B.U.VariablesOfVariableSeq(interOuts)),
        ins1Copy = savedIns1.EmitSave(ins1.ToArray()),
        ins2Copy = savedIns2.EmitSave(ins2.ToArray());
        


      /***** Emit function calls *****/

      var c1Ins = B.U.ExprSeqOfVariableSeq(ins1);
      var c1Outs = B.U.IdentifierExprSeqOfVariableSeq(outs1);
      var c2Ins = B.U.ExprSeqOfVariableSeq(ins2);
      var c2Outs = B.U.IdentifierExprSeqOfVariableSeq(outs2);

      CallCmd
        c1 = new CallCmd(Token.NoToken, d1n, c1Ins, c1Outs),
        c2 = new CallCmd(Token.NoToken, d2n, c2Ins, c2Outs);

      /***** Emit comparison, outputVars *****/
      var outputVars = new List<Duple<string, Variable>>();
      int numComparables = savedOutputs.Count + savedc1Globals.Count;

      //wait! if there aren't any comparable values, don't bother emitting a comparator
      if (numComparables == 0)
      {
        Log.Out(Log.Verifier, "No outputs: skipping (" + d1n + ", " + d2n +")");
        outputVarsForVFTask = null;
        eqParamInfo = null;
        return null;
      }

      if (Options.CheckOutputsForMaps)
      {
          foreach (Variable v in savedOutputs.Decls)
          {
              if (v.TypedIdent.Type is MapType)
                  Log.Out(Log.MapEquivs, v.Name + " in " + i1.Name + " is a map comparable!");
          }
         foreach (Variable v in savedc1Globals.Decls)
        {
            if (v.TypedIdent.Type is MapType || v.TypedIdent.Type is TypeSynonymAnnotation)
                Log.Out(Log.MapEquivs, v.Name + " global is a map comparable!");
        }
      }

      StateBlock outputEqualityState = new StateBlock(numComparables, StateBlock.StateKind.FormalOut);
      Tuple<Expr,Variable>[] outputEqualityExprs = new Tuple<Expr,Variable>[numComparables];
      outputEqualityState.Initialize(Microsoft.Boogie.Type.Bool);

      IdentifierExpr[]
        comparisonPostc1Vars = savedc1Globals.Idents,
        comparisonPrec2Vars = savedOutputs.Idents;

      List<IdentifierExpr>
        comparisonOutIds = B.U.IdentifierExprSeqOfVariableSeq(outs2),
        comparisonGlobals = B.U.IdentifierExprSeqOfVariableSeq(globals);

      eqParamInfo = new EqualityProcedureParameterInfo(
        savedIns1.Idents.Select(v => v.Name).ToList(),
        savedOutputs.Idents.Select(v => v.Name).ToList(),
        savedIns2.Idents.Select(v => v.Name).ToList(),
        outs2.Select(v => v.Name).ToList(),
        globals.Select(v => v.Name).ToList(),
        savedInitialGlobals.Idents.Select(v => v.Name).ToList(),
        savedc1Globals.Idents.Select(v => v.Name).ToList());

      for (int i = 0; i < savedOutputs.Count; i++)
      { 
        outputEqualityExprs[i] = Tuple.Create(EmitEq(comparisonPrec2Vars[i], comparisonOutIds[i], ignoreSet), comparisonOutIds[i].Decl);
        outputVars.Add(new Duple<string, Variable>("Output_of_" + d1.Name + "_" + outs1[i].Name, savedOutputs.Decls[i]));
        outputVars.Add(new Duple<string, Variable>("Output_of_" + d2.Name + "_" + outs2[i].Name, outs2[i]));
      }
      for (int i = 0; i < savedc1Globals.Count; i++)
      {
        outputEqualityExprs[savedOutputs.Count + i] = Tuple.Create(EmitEq(comparisonPostc1Vars[i], comparisonGlobals[i], ignoreSet), comparisonGlobals[i].Decl);
        outputVars.Add(new Duple<string, Variable>("Output_of_" + d1.Name + "_" + globals[i].Name, savedc1Globals.Decls[i]));
        outputVars.Add(new Duple<string, Variable>("Output_of_" + d2.Name + "_" + globals[i].Name, globals[i]));
      }
      //new: we translate equalities as havoc lhs; lhs := lhs || x == x'; to enable diff counterexamples for each equality
      //havoc all lhs
      HavocCmd hcmd = new HavocCmd(Token.NoToken, outputEqualityState.Idents.ToList());
      List<Expr> rhs = new List<Expr>(outputEqualityExprs.Map(i => i.Item1));
      for (int i = 0; i < rhs.Count; ++i)
          rhs[i] = Expr.Or(outputEqualityState.Idents[i], rhs[i]); 
      List<AssignLhs> lhs =
        new List<AssignLhs>(outputEqualityState.Idents.Map(x => new SimpleAssignLhs(Token.NoToken, x)));
      Cmd assgnCmd = new AssignCmd(Token.NoToken, lhs, rhs);

      /***** Save outputVars as globals (outputVarsForVFTask) *****/
      //note that this list is order dependent. later code will assume that variables are paired

      SaveBlock leftRightOutputs = new SaveBlock(outputVars.Count, StateBlock.StateKind.Global);
      leftRightOutputs.Initialize(outputVars.Map(x => new Duple<string, Microsoft.Boogie.Type>(x.fst, x.snd.TypedIdent.Type)));
      Cmd[] saveOutputsIntoGlobals = leftRightOutputs.EmitSave(outputVars.Map(x => x.snd).ToArray());
      outputVarsForVFTask = leftRightOutputs.Decls.ToList();

      /***** Compile procedure body ****/

      var body = Enumerable.ToList(ins1Copy);
      body.AddRange(ins2Copy);
      body.AddRange(prec1Copy);
      body.Add(c1);
      body.AddRange(postc1Copy);
      body.AddRange(postc1Restore);
      body.AddRange(prec2Copy);
      body.Add(c2);
      body.AddRange(saveOutputsIntoGlobals);
      body.Add(hcmd);
      body.Add(assgnCmd);

      //special hack to limit outvar to {:stmtTaintCollectorGlobalVar}
      if (Options.refinedStmtTaint)
      {
          Options.OutputVars.Clear();
          globals.Where(x => QKeyValue.FindBoolAttribute(x.Attributes, "stmtTaintCollectorGlobalVar")).ForEach(x => Options.OutputVars.Add(x.ToString()));
      }

      List<Ensures> outputPostConditions = new List<Ensures>();
      if (Options.splitOutputEqualities)
      {
          outputPostConditions.AddRange(outputEqualityState.Idents.Map(y => new Ensures(false, y)));
          System.Diagnostics.Debug.Assert(outputEqualityState.Count == outputEqualityExprs.Length);
          for (int i = 0; i < outputPostConditions.Count; ++i)
          {
              var name = outputEqualityExprs[i].Item2.Name;
              //check if name matches with at least one of the outputVars patterns
              if (Options.OutputVars.Count() > 0 && !Options.OutputVars.Any(x => name.Contains(x)))
                  outputPostConditions[i] = new Ensures(true, outputPostConditions[i].Condition);
              outputPostConditions[i].Attributes =
                  new QKeyValue(Token.NoToken, "EqVar", new List<object>() { name }, null);
          }
      }
      else if (!Options.EnumerateAllPaths)
          outputPostConditions.Add(new Ensures(false, B.U.BigAnd(outputEqualityState.Idents)));
      else //assert(false) causes all the paths to be enumerated
          outputPostConditions.Add(new Ensures(false, Expr.False)); //to get exhaustive paths
      
      var eqModifiesDupe = new List<IdentifierExpr>(d1.Modifies);
      eqModifiesDupe.AddRange(d2.Modifies);
      foreach (var v in leftRightOutputs.Decls)
        eqModifiesDupe.Add(Expr.Ident(v));
      
      //uniqueify eqModifies
      var eqModifiesUn = new List<IdentifierExpr>();
      var eqModifiesVars = new HashSet<Variable>();
      var eqModifies = new List<IdentifierExpr>();
      foreach (IdentifierExpr ie in eqModifiesDupe)
      {
        if (!eqModifiesVars.Contains(ie.Decl))
          eqModifies.Add(ie);
        eqModifiesVars.Add(ie.Decl);
      }
      

      //var procName = "EQ_" + d1.Name + "__xx__" + d2.Name;
      var procName = mkEqProcName(d1.Name, d2.Name);

      var eqProc =
        new Procedure(Token.NoToken, procName, B.C.empTypeVariableSeq, unionIns,
          new List<Variable>(outputEqualityState.Decls), isPure:false,
          B.C.empRequiresSeq, eqModifies, new List<Ensures>(outputPostConditions));

      var bl =
        new BigBlock(Token.NoToken, "AA_INSTR_EQ_BODY", body, null, B.C.dmyTransferCmd);
      var bll = new List<BigBlock> { bl };

      var locals = Enumerable.ToList(savedOutputs.Decls);
      locals.AddRange(savedIns1.Decls);
      locals.AddRange(savedIns2.Decls);
      locals.AddRange(savedc1Globals.Decls);
      locals.AddRange(savedInitialGlobals.Decls);
      locals.AddRange(unionOuts);

      var eqImp =
        new Implementation(Token.NoToken, procName, B.C.empTypeVariableSeq, unionIns,
          new List<Variable>(outputEqualityState.Decls),
          locals, new StmtList(bll, Token.NoToken));

      var l = new List<Declaration>();

      return new Duple<Procedure, Implementation>(eqProc, eqImp);
    }

    private static string sanitize(string s)
    { 
      return s.Replace("$", "");
    }

    public static string mkEqProcName(string p1, string p2)
    {
      // Currently this ignores `p2`, but it may make sense to include it
      // again at some point, so let's leave it in as an argument.
      return "EQ_" + sanitize(p1.Substring(p1.IndexOf(".") + 1));
    }

    public static void NormalizeProcedures(Procedure d1, Implementation i1, List<Variable> g1,
      Procedure d2, Implementation i2, List<Variable> g2)
    {
      if (d1.InParams.Count == d1.InParams.Count && d2.OutParams.Count == d2.OutParams.Count &&
          g1.Count == g2.Count)
        return;

      NormalizeVariables(d1.InParams, d2.InParams);

      for (int i = i1.InParams.Count; i < d1.InParams.Count; i++)
        i1.InParams.Add(B.Factory.Copy(d1.InParams[i]));
      for (int i = i2.InParams.Count; i < d2.InParams.Count; i++)
        i2.InParams.Add(B.Factory.Copy(d2.InParams[i]));

      NormalizeVariables(d1.OutParams, d2.OutParams);

      for (int i = i1.OutParams.Count; i < d1.OutParams.Count; i++)
        i1.OutParams.Add(B.Factory.Copy(d1.OutParams[i]));
      for (int i = i2.OutParams.Count; i < d2.OutParams.Count; i++)
        i2.OutParams.Add(B.Factory.Copy(d2.OutParams[i]));

      NormalizeVariables(g1, g2);
    }

    public static Expr EmitEq(IdentifierExpr leftVar, IdentifierExpr rightVar, HashSet<Variable> ignoreSet)
    {

                   
       // just blocking poly map for now - hemr
       if (!(leftVar.Decl.TypedIdent.Type is MapType || leftVar.Decl.TypedIdent.Type is TypeSynonymAnnotation))
        return Expr.Eq(leftVar, rightVar);

       if (leftVar.Decl.TypedIdent.Type is TypeSynonymAnnotation)
       {
           var l = leftVar.Decl.TypedIdent.Type as TypeSynonymAnnotation;
           System.Diagnostics.Debug.Assert(!l.IsMap, "only handle non map typesynonymAnnotations, found " + l);
           return Expr.Eq(leftVar, rightVar);
       }


      List<Variable> bound = null;
      BoundVariable[] bvs = new BoundVariable[leftVar.Decl.TypedIdent.Type.AsMap.Arguments.Count];
      int i = 0;
      string polyMapName = "";
      foreach (Microsoft.Boogie.Type ts in leftVar.Decl.TypedIdent.Type.AsMap.Arguments)
      {
          if (leftVar.Decl.TypedIdent.Type is TypeSynonymAnnotation)
          {
              int index = 0;
              index = ts.ToString().IndexOf(" ");
              if (index >= 0)
                  polyMapName = ts.ToString().Substring(index + 1);
          }
          bound = new List<Variable>();
          var x = new BoundVariable(Token.NoToken, new TypedIdent(Token.NoToken, "_x"+i, ts));
         // bound.Add(x);
          bvs[i] = x;
          i++;
      }
        
      //var bound = new List<Variable>();
      //var x = new BoundVariable(Token.NoToken, new TypedIdent(Token.NoToken, "_x", leftVar.Decl.TypedIdent.Type.AsMap.Arguments[0]));
      //bound.Add(x);
     
      //var lhs = SelectExpr(leftVar, Expr.Ident(x).);
      //var rhs = SelectExpr(rightVar, Expr.Ident(x));
      IdentifierExpr[] idenExprs = new IdentifierExpr[bvs.Length];
      for (int j = 0; j < bvs.Length; j++)
      {
          BoundVariable bv = bvs[j];
          idenExprs[j] = Expr.Ident(bv);
      }

      var lhs = SelectExpr(leftVar, idenExprs);
      var rhs = SelectExpr(rightVar, idenExprs);
      bound = new List<Variable>(bvs);
      if (!polyMapName.Equals(""))
      {
          var forall = new ForallExpr(Token.NoToken, new List<TypeVariable>(new TypeVariable[] {new TypeVariable(Token.NoToken, polyMapName)}), bound, Expr.Eq(lhs, rhs));
          //var forall2 = new ForallExpr(Token.NoToken, new List<TypeVariable>(new TypeVariable(Token.NoToken, polyMapName)), bound, Expr.Eq(lhs, rhs));
          //return Expr.Or(Expr.Eq(leftVar, rightVar), forall);
          // as mentioned... blocking poly maps for now - hemr
          return Expr.Eq(leftVar, rightVar);
      }
      else
      {
          return Expr.Or(Expr.Eq(leftVar, rightVar), new ForallExpr(Token.NoToken, bound, Expr.Eq(lhs, rhs)));
      }
      //bound = new List<Variable>(bvs);
      //return Expr.Or(Expr.Eq(leftVar, rightVar), new ForallExpr(Token.NoToken, bound, Expr.Eq(lhs, rhs)));
      //return Expr.True;
    }

    private static Expr SelectExpr(IdentifierExpr var, IdentifierExpr [] index)
    {
      var args = new List<Expr>();
      args.Add(var);
      for (int i = 0; i < index.Length; i++)
      {
          IdentifierExpr ie = index[i];
          args.Add(ie);
      }
      return new NAryExpr(Token.NoToken, new MapSelect(Token.NoToken, index.Length), args);
    }

    public static void NormalizeVariables(List<Variable> v1, List<Variable> v2)
    {
      int num = Math.Abs(v1.Count - v2.Count);
      Variable t;

      var longer = (v1.Count > v2.Count ? v1 : v2);
      var shorter = (v1 == longer ? v2 : v1);
      for (int i = 0; i < num; i++)
      {
        t = B.Factory.Copy(longer[longer.Count - 1 - i]);
        t.Name = UniqueNumber.GetName("AA_IN");
        t.TypedIdent.Name = t.Name;
        shorter.Add(t);
      }
    }
  }

}