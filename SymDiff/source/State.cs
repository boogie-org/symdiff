using System;
using System.Collections.Generic;
using Microsoft.Boogie;
using SymDiffUtils;

namespace SDiff
{
  public class StateBlock
  {
    public enum StateKind { Local, Global, FormalIn, FormalOut }

    private StateKind kind;
    public StateKind Kind
    {
      get { return kind; }
    }

    private int count;
    public int Count
    {
      get { return vars.Length; }
    }

    private string baseName;

    protected TypedIdent[] vars;
    public TypedIdent[] Vars
    {
      get { return vars; }
    }

    private Variable[] decls;
    public Variable[] Decls
    {
      get
      {
        if (decls == null && initialized)
          decls = Vars.Map<TypedIdent, Variable>(x => VarOfKind(x, kind));
        return decls;
      }
    }

    private Variable VarOfKind(TypedIdent x, StateKind k)
    {
      switch (k)
      {
        case StateKind.Local:
          return new LocalVariable(Token.NoToken, x);
        case StateKind.Global:
          return new GlobalVariable(Token.NoToken, x);
        case StateKind.FormalIn:
          return new Formal(Token.NoToken, x, true);
        case StateKind.FormalOut:
          return new Formal(Token.NoToken, x, false);
      }
      return null; //impossible!
    }

    public IdentifierExpr[] Idents
    {
      get
      {
        //boogie prefers it when IdentifierExprs are referentially unique
        return Decls.Map(x => Expr.Ident(x));
      }
    }

    protected bool initialized;

    public StateBlock(int numVars, StateKind kind)
    {
      baseName = UniqueNumber.GetName("AA_TEMP");
      this.vars = new TypedIdent[numVars];
      decls = null;
      //idents = null;
      initialized = false;
      this.kind = kind;
    }

    public StateBlock(int numVars) : this(numVars, StateKind.Local) { }

    public bool Initialize(Microsoft.Boogie.Type[] varts)
    {
      if (varts.Length != Count || initialized)
        return false;

      for (int i = 0; i < Count; i++)
        vars[i] = new TypedIdent(Token.NoToken, baseName + i, varts[i]);

      return initialized = true;
    }

    public bool Initialize(Microsoft.Boogie.Type t)
    {
      return Initialize(new Microsoft.Boogie.Type[Count].Stuff(t));
    }

    public bool Initialize(List<Duple<string, Microsoft.Boogie.Type>> vars)
    {
      if (vars.Count != Count || initialized)
        return false;

      this.vars = vars.Map(x => new TypedIdent(Token.NoToken, x.fst, x.snd)).ToArray();

      return initialized = true;
    }
  }


  public class SaveBlock : StateBlock
  {
    public SaveBlock(int numVars) : base(numVars, StateKind.Local) { }
    public SaveBlock(int numVars, StateKind kind) : base(numVars, kind) { }

    public Cmd[] EmitSave(Variable[] varsToSave)
    {
      //try initializing
      Initialize(varsToSave.Map(x => x.TypedIdent.Type));
      //bail if it doesn't take
      if (!initialized)
        return new Cmd[0];

      return State.EmitCopyVars(Decls, varsToSave);
    }

    public Cmd[] EmitRestore(Variable[] varsToRestoreInto)
    {
      if (varsToRestoreInto.Length != Count || !initialized)
        return new Cmd[0];

      //let the typechecker work it out
      //for (int i = 0; i < Count; i++)
      //  if (varsToRestoreInto[i].Type != vars[i].Type)
      //    return new Cmd[0];
      return State.EmitCopyVars(varsToRestoreInto, Decls);
    }
  }

  public static class State
  {
    public static Cmd[] EmitCopyVars(Variable[] from, Variable[] into)
    {
      if (from.Length != into.Length)
        return new Cmd[0];
      AssignCmd[] assigns = new AssignCmd[from.Length];
      for (int i = 0; i < from.Length; i++)
        assigns[i] = Cmd.SimpleAssign(Token.NoToken,
          Expr.Ident(from[i]),
          Expr.Ident(into[i]));
      return assigns;
    }
  }
}