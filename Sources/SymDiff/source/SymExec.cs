
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

namespace SDiff.SymEx
{
  public class SymbolicBlock: IEmittable
  {
    public readonly Block Source;
    public List<SymbolicCmd> SCmds;

    public SymbolicBlock(Block source)
    {
      this.Source = source;
      SCmds = new List<SymbolicCmd>();

    }

    public void Emit(TokenTextWriter t)
    {
      t.WriteLine(Source.Label + ":");
      foreach (SymbolicCmd c in SCmds)
        c.Emit(t);
    }
  }

  public class SymbolicCmd: IEmittable
  {
    public Cmd Source;
    public Constraint Cons;
    public List<SymbolicStore> Gammas;

    public SymbolicCmd(Cmd source)
    {
      this.Source = source;
      Cons = Constraint.True;
      Gammas = new List<SymbolicStore>();
    }

    public void AddCons(Expr e)
    {
      if (Cons == Constraint.True)
        Cons = new Constraint();
      Cons.Add(e);
    }

    public void AddGamma(SymbolicStore gamma)
    {
      Gammas.Add(gamma);
    }

    public void Emit(TokenTextWriter t)
    {
      Console.Write("\t");
      Source.Emit(t, 0);
      if (!Cons.IsTrue())
      {
        t.WriteLine("\t\tPre: ");
        t.Write("\t\t\t");
        Cons.Emit(t);
        t.WriteLine();
      }
      if (Gammas.Count != 0)
      {
        t.WriteLine("\t\tGammas:");
        for (int i = 0; i < Gammas.Count; i++)
        {
          if(Gammas.Count > 1)
            t.WriteLine("\t\t\t" + i + ": ");
          Gammas[i].Emit(t);
          t.WriteLine("===============");
        }
      }
    }
  }

  public class SymbolicTrace : List<SymbolicBlock>
  {
    public SymbolicCmd LastSCmd()
    {
      if (Count == 0)
        return null;
      SymbolicBlock last = null;
      foreach (var sb in this)
        if (sb.SCmds.Count != 0)
            if(sb.SCmds.Last().Gammas.Count != 0) // added due to boogie new API - hemr
          last = sb;
      if (last != null)
      {
          var tmp = last.SCmds.Last();
          return last.SCmds.Last();
      }
      return null;
    }

    public SymbolicCmd FirstSCmd()
    {
      if (Count == 0)
        return null;
      foreach(var sb in this)
        if (sb.SCmds.Count != 0)
          return sb.SCmds.First();
      return null;
    }
  }

  public class SymbolicStore : Dictionary<StoreLhs, Expr>, IEmittable
  {
    public SymbolicStore()
      : base()
    { }

    public SymbolicStore(SymbolicStore s)
      : base(s)
    { }

    public void Emit(TokenTextWriter t)
    {
      foreach (var kv in this)
      {
        t.Write("\t\t\t" + kv.Key.ToString() + ": ");
        kv.Value.Emit(t);
        Console.WriteLine();
      }
    }

    //returns a deep copy of the structure with cloned KEYS ONLY
    //public SymbolicStore CloneByKeys()
    //{
    //  var duper = new Duplicator();
    //  var newStore = new SymbolicStore();
    //  foreach(var entry in this)
    //    newStore.Add(entry.Key.Clone(), entry.Value);
    //  return newStore;
    //}
  }

  public class StoreLhs
  {
    public readonly Variable Var;

    public StoreLhs(Variable var)
    {
      this.Var = var;
    }

    public static Duple<StoreLhs, Expr> Make(AssignLhs alhs, Expr e)
    {
      if (alhs is SimpleAssignLhs)
        return new Duple<StoreLhs, Expr>(new StoreLhs(alhs.DeepAssignedVariable), e);
      if (alhs is MapAssignLhs)
      {
        var mlhs = alhs as MapAssignLhs;
        var var = mlhs.DeepAssignedVariable;

        var curLhs = mlhs.Map;
        var curExpr = Expr.Store(SelectOfAssignLhs(curLhs), mlhs.Indexes, e);
        if (curLhs is MapAssignLhs)
          return Make(curLhs, curExpr);
        return new Duple<StoreLhs, Expr>(new StoreLhs(var), curExpr);
      }

      return null; //impossible!
    }

    public static Expr SelectOfAssignLhs(AssignLhs lhs)
    {
      if (lhs is MapAssignLhs)
        return Expr.Select(SelectOfAssignLhs(((MapAssignLhs)lhs).Map), ((MapAssignLhs)lhs).Indexes);
      else
        return Expr.Ident(lhs.DeepAssignedVariable);
    }

    public override bool Equals(object obj)
    {
      if (obj is SimpleAssignLhs)
        return ((SimpleAssignLhs)obj).DeepAssignedVariable == Var;
      if (obj is StoreLhs)
        return ((StoreLhs)obj).Var == Var;
      if (obj is IdentifierExpr)
        return ((IdentifierExpr)obj).Decl == Var;
      if (obj is Variable)
        return obj == Var;
      return base.Equals(obj);
    }

    public override string ToString()
    {
      return Var.Name;
    }

    public override int GetHashCode()
    {
      return Var.GetHashCode();
    }
  }

  public class Constraint: IEmittable
  {
    public readonly List<Expr> Conjuncts;

    public Constraint(Constraint cons, bool copy)
    {
      if (!copy)
        Conjuncts = new List<Expr>(cons.Conjuncts);
      else
      {
        var duper = new Duplicator();
        Conjuncts = new List<Expr>(cons.Conjuncts.Count);
        foreach (var e in cons.Conjuncts)
          Conjuncts.Add(duper.VisitExpr(e));
      }
    }

    public Constraint(params Expr[] cs)
    {
      Conjuncts = new List<Expr>();
      foreach (Expr c in cs)
        Conjuncts.Add(c);
    }

    public void Emit(TokenTextWriter t)
    {
      if (Conjuncts.Count == 0)
        t.Write("true");
      else
      {
        var ss = new List<string>();
        foreach (var c in Conjuncts)
        {
          var cur = Util.BufEmit(c.Emit);
          if (Options.DontPrintDuplicateConstraintConjuncts)
          {
            if (!ss.Contains(cur))
              ss.Add(cur);
          }
          else
            ss.Add(cur);
        }
        var emit = ss[0] + "\n";
        for (int i = 1; i < ss.Count; i++)
          emit += " AND " + ss[i] + "\n";
        t.Write(emit);
      }

      //foreach (var e in Conjuncts)
      //{
      //  if (Util.BufEmit(e.Emit).Equals("0 == 0"))
      //    continue;
      //  t.Write(" AND ");
      //  e.Emit(t);
      //  t.WriteLine();
      //}
    }


      //Returns the conjunction of the Exprs in the list
    public Expr Conjoin()
    {
        if (Conjuncts.Count == 0)
            return Expr.False;
        else
        {
            Expr localExpr = Expr.True;
            foreach (var c in Conjuncts)
            {
                //TODO: remove duplicate conjucts from the list
                localExpr = Expr.And(localExpr, c);
            }
            return localExpr;
        }
    }


    public void Add(Expr e)
    {
      Conjuncts.Add(e);
    }

    public bool IsTrue()
    {
      foreach (var c in Conjuncts)
        if (!(c.Equals(Expr.True)))
          return false;
      return true;
    }

    public static Constraint True = new Constraint(Expr.True);
  }

  public static class ResolveSymExpr
  {
    public static Expr Resolve(Variable var, SymbolicStore store)
    {
      if (var == null || store == null)
        return null;

      var resolver = new ExprResolver(store);
      var duper = new Duplicator();
      var ret = store.Get(new StoreLhs(var));
      if (ret == null)
      {
        Log.Out(Log.Error, "Could not find " + var.Name + " in symbolic store!");
        return null;
      }

      ret = resolver.VisitExpr(ret);
      ret = duper.VisitExpr(ret);
      return ret;
    }

    public class ExprResolver : FixedVisitor
    {
      private SymbolicStore Store;

      public ExprResolver(SymbolicStore store)
      {
        this.Store = store;
      }

      public override Expr VisitIdentifierExpr(IdentifierExpr node)
      {
        var mapsTo = Store.Get(new StoreLhs(node.Decl));
        if (mapsTo == null)
          return node;
        else
          return VisitExpr(mapsTo);
      }
    }
  }

  public static class TraceValidator
  {
    //returns true if ERROR. in theory, should match convention of all other bool returns..
    public static bool Validate(List<Block> trace)
    {
      for(int i = 0; i < trace.Count; i++)
      {
        var tx = trace[i].TransferCmd;
        
        var jmp = tx as GotoCmd;
        if (jmp != null)
        {
          if (i + 1 < trace.Count)
            if (!jmp.labelTargets.HasByLabel(trace[i + 1]))
            {
              //boogie creates some "header" blocks that we can safely ignore. the condition for this is that
              // the actual next block is a suffix of the block it creates.
              if (jmp.labelTargets.HasByLabelSuffix(trace[i + 1]))
                continue;
              Log.Out(Log.Error, "Missing block in trace: jumps to " + jmp.labelTargets.ToString() + " but next block is " + trace[i + 1].Label);
              return true;
            }
          //if (jmp.labelTargets.Length != 1)
          //  Log.Out(Log.Warning, "Block ends in non-det goto. Labels: " + jmp.labelTargets.ToString());
        }

        var ret = tx as ReturnCmd;
        if (ret != null)
        {
          //if we're not at the end of the trace, there's a problem
          if (i + 1 == trace.Count)
            return false;
          else
            return true;
        }

        if (ret == null && jmp == null)
          Log.Out(Log.Error, "Blocks doesn't end in goto or return!");
      }
      return false;
    }
  }

}