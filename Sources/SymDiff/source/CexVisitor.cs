using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using Microsoft.Boogie;
using Bpl = Microsoft.Boogie;
using B = SDiff.Boogie;
using SymDiffUtils;




//two concrete TODOs: 1) initialize the first symstore with constants
//                    2) treat map assigns properly
//                                 - extract the map variable, stick it into the LHS
//                                 - assign to the map update of the previous value for the map

namespace SDiff.SymEx
{
  public class CexDumper
  {
    public static void PrintTrace(List<Block> e)
    {
      foreach (Block b in e)
        b.Emit(new TokenTextWriter(Console.Out, true, BoogieUtils.BoogieOptions), 0);
    }

    public static void PrintCindyTrace(List<Block> e, string filename)
    {
      var ttt = new TokenTextWriter(filename, true, BoogieUtils.BoogieOptions);

      foreach (Block b in e)
        b.Emit(ttt, 0);
      ttt.Close();
    }

    public static void PrintSymbolicTrace(SymbolicTrace st)
    {
      foreach (SymbolicBlock b in st)
        b.Emit(new TokenTextWriter(Console.Out, true, BoogieUtils.BoogieOptions));
    }
  }

  //visits each command in a trace to produce a new trace
  public class TraceVisitor
  {
    public List<Block> VisitTrace(List<Block> trace)
    {
      var newTrace = new List<Block>();

      foreach (Block b in trace)
        newTrace.Add(VisitBlock(b));
      return newTrace;
    }

    public virtual Block VisitBlock(Block block)
    {
      var newCmds = new List<Cmd>();
      foreach (Cmd c in block.Cmds)
        newCmds.AddRange(VisitCmd(c));

      var newBlock = new Block(block.tok, block.Label, newCmds, block.TransferCmd);
      return newBlock;
    }

    public virtual List<Cmd> VisitCmd(Cmd cmd)
    {
      return new List<Cmd>{cmd} ;
    }
  }

  //extracts any line source/line metadata from assert statements embedded in a trace
  public class TraceExtractor : TraceVisitor
  {
    public List<Duple<string, int>> metaTrace;

    public TraceExtractor()
    {
      metaTrace = new List<Duple<string, int>>();
    }

    public override List<Cmd> VisitCmd(Cmd cmd)
    {
      var asst = cmd as AssertCmd;
      if (asst != null)
      {
        string file = "";
        int line = -1;
        var cur = asst.Attributes;
        for (var kv = asst.Attributes; kv != null; kv = kv.Next)
        {
          if (kv.Key.Equals("sourcefile"))
            file = kv.Params[0].ToString();
          if (kv.Key.Equals("sourceline"))
            line = Int32.Parse(kv.Params[0].ToString());
        }

        if (line != -1 && !file.Equals(""))
          metaTrace.Add(new Duple<string, int>(file, line));
      }
      return base.VisitCmd(cmd);
    }
  }

  public class DesugarCallCmds : TraceVisitor
  {

    public DesugarCallCmds()
    {
    }

    public override List<Cmd> VisitCmd(Cmd cmd)
    {
      if (cmd is CallCmd)
        return DesugarCallCmd(cmd as CallCmd);
      return base.VisitCmd(cmd);
    }
    
    public List<Cmd> DesugarCallCmd(CallCmd c)
    {
      var retCmds = new List<Cmd>(((StateCmd)c.GetDesugaring(BoogieUtils.BoogieOptions)).Cmds);
      for (int i = 0; i < retCmds.Count; i++)
      {
        if (retCmds[i] is HavocCmd)
          retCmds[i] = new CommentCmd("Procedure call desugaring");
        //we're going to translate all assume of the form (temp == uf_fun(...)) into assignments
        else if (retCmds[i] is AssumeCmd)
        {
          try
          {
            var assume = retCmds[i] as AssumeCmd;
            var eq = assume.Expr as NAryExpr;
            if (eq != null && eq.Args.Count == 2 && ((BinaryOperator)eq.Fun).Op == BinaryOperator.Opcode.Eq)
            {
              var lhs = new List<AssignLhs>();
              lhs.Add(new SimpleAssignLhs(eq.Args[0].tok, ((IdentifierExpr)eq.Args[0])));
              var rhs = new List<Expr>();
              rhs.Add(eq.Args[1]);
              retCmds[i] = new AssignCmd(assume.tok, lhs, rhs);
            }
          }
          catch
          {
          }
        }
      }

      return retCmds;
    }
  }


  public static class Cexecutor
  {
    //traverse down a trace (List<Block>). At each program point:
    // -Write the new SymbolicStore at each AssignCmd.
    // -Write the guard condition for each AssumeCmd.
    //the latter will be overwritten by an ExecUp
    public static SymbolicTrace ExecDown(List<Block> bs, List<Variable> args)
    {
      SymbolicStore
        curStore = new SymbolicStore(),
        nextStore;

      ////initialize args with symbolic values
      List<Variable> symbolicConstants = new List<Variable>();
      for (int i = 0; i < args.Count; i++)
      {
        var v = args[i];
        symbolicConstants.Add(B.Factory.MakeConstant(v.Name, v.TypedIdent.Type));
        curStore.Add(new StoreLhs(v), Expr.Ident(symbolicConstants[i]));
      }

      var newTrace = new SymbolicTrace();
      foreach (Block b in bs)
      {
          var tmp = ExecBlockDown(b, curStore, out nextStore);
        newTrace.Add(ExecBlockDown(b, curStore, out nextStore));
        curStore = nextStore;
      }
      return newTrace;
    }

    public static SymbolicBlock ExecBlockDown(Block b, SymbolicStore gammaIntoBlock, out SymbolicStore gammaOutOfBlock)
    {
      var duper = new Duplicator();
      var sb = new SymbolicBlock(b);

      SymbolicStore gammaIntoCmd = gammaIntoBlock;

      foreach (Cmd c in b.Cmds)
      {
        var sc = new SymbolicCmd(c);
        if (c is AssumeCmd)
        {
            if (!((AssumeCmd)c).Expr.Equals(Expr.True))
            {
                var tmp = ((AssumeCmd)c).Expr;
                sc.AddCons(((AssumeCmd)c).Expr);
            }
        }
        else if (c is AssignCmd)
        {
          SymbolicStore newGamma; //= new SymbolicStore(gammaIntoCmd);

          AssignCmd assgn = c as AssignCmd;
          if (assgn.Lhss.Count != assgn.Rhss.Count)
          {
            Console.WriteLine("Bizzare: uneven assignment command in ExecDown");
            continue;
          }
          //each AssignCmd contains a list of assignments
          for (int i = 0; i < assgn.Lhss.Count; i++)
          {
            var lhsrhs = StoreLhs.Make(assgn.Lhss[i], assgn.Rhss[i]);
            var lhs = lhsrhs.fst;
            var rhs = lhsrhs.snd;

            Expr oldrhs;
            gammaIntoCmd.TryGetValue(lhs, out oldrhs);

            //if lhs was uninitialized, we just add the new binding to the old gamma
            if (oldrhs == null)
            {
              newGamma = new SymbolicStore(gammaIntoCmd);
              newGamma.Add(lhs, rhs);
            }
            //otherwise we have to do substitution over everything
            else
            {
              newGamma = new SymbolicStore();
              newGamma.Add(lhs, Substituter.Apply(x => (x == lhs.Var) ? duper.VisitExpr(oldrhs) : null, rhs));

              //otherwise, we need to substitute the old value for lhs into Gamma
              foreach (var entry in gammaIntoCmd)
              {
                if (!entry.Key.Equals(lhs))
                  newGamma.Add(entry.Key, Substituter.Apply(x => (x == lhs.Var) ? duper.VisitExpr(oldrhs) : null, entry.Value));
              }
            }
            gammaIntoCmd = newGamma;
            sc.AddGamma(newGamma);
          }
        }
        else if (c is HavocCmd)
        {
          Log.Out(Log.Warning, "Help! HavocCmd in ExecBlockDown!");
        }
       
         // if(sc.Gammas.Count != 0)
        sb.SCmds.Add(sc);
      }

      gammaOutOfBlock = gammaIntoCmd;
      return sb;
    }

    public static Constraint ExecUp(SymbolicTrace trace)
    {
      var curCons = Constraint.True;
      for(int i = trace.Count - 1; i >= 0; i--)
        curCons = ExecBlockUp(trace[i], curCons);
      return curCons;
    }

    //completely clobbers all the existing SCmd constraints
    public static Constraint ExecBlockUp(SymbolicBlock sb, Constraint consIntoBlock)
    {
      var curCons = consIntoBlock;

      for (int i = sb.SCmds.Count - 1; i >= 0; i--)
      {
        var curCmd = sb.SCmds[i];

        var assume = curCmd.Source as AssumeCmd;
        if (assume != null)
        {
          curCmd.Cons = new Constraint(curCons, false);
          curCmd.Cons.Add(assume.Expr);
        }

        var assign = curCmd.Source as AssignCmd;
        if (assign != null)
        {
          curCmd.Cons = new Constraint(curCons, true);
          
          for (int j = 0; j < assign.Lhss.Count; j++)
          {
            var lhs = assign.Lhss[j];
            var gamma = curCmd.Gammas[j];

            var vToReplace = lhs.DeepAssignedVariable;
            var rExpr = gamma.Get(new StoreLhs(vToReplace));
            curCmd.Cons = 
              new Constraint(curCmd.Cons.Conjuncts.Map(y => Substituter.Apply(x => (x == vToReplace) ? rExpr : null, y)).ToArray());
          }
        }

        if (assign == null && assume == null)
          curCmd.Cons = new Constraint(curCons, true);
        else
          curCons = curCmd.Cons;
      }

      return curCons;
    }
  }
}


