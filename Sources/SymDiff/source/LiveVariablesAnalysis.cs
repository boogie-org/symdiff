using System.Collections.Generic;
using System.Diagnostics.Contracts;
using System.Linq;
using Microsoft.Boogie;
using Microsoft.Boogie.GraphUtil;

namespace SymDiff.source;

public class LiveVariableAnalysis
{
  private CoreOptions options;

  public LiveVariableAnalysis(CoreOptions options)
  {
    this.options = options;
  }

  public static void ClearLiveVariables(Implementation impl)
  {
    Contract.Requires(impl != null);
    foreach (Block /*!*/ block in impl.Blocks)
    {
      Contract.Assert(block != null);
      block.LiveVarsBefore = null;
    }
  }

  public void ComputeLiveVariables(Implementation impl, HashSet<GlobalVariable> globals)
  {
    Contract.Requires(impl != null);
    Microsoft.Boogie.Helpers.ExtraTraceInformation(options, "Starting live variable analysis");
    Graph<Block> dag = Program.GraphFromBlocks(impl.Blocks, false);
    IEnumerable<Block> sortedNodes;

    sortedNodes = dag.TopologicalSort(true);

    foreach (Block /*!*/ block in sortedNodes)
    {
      Contract.Assert(block != null);
      HashSet<Variable /*!*/> /*!*/
        liveVarsAfter = new HashSet<Variable /*!*/>();

      globals.ForEach(v => liveVarsAfter.Add(v));
      // Add output parameters as always live
      foreach (Variable v in impl.OutParams)
      {
        Contract.Assert(v != null);
        liveVarsAfter.Add(v);
      }

      // The injected assumption variables should always be considered to be live.
      foreach (var v in impl.InjectedAssumptionVariables.Concat(impl.DoomedInjectedAssumptionVariables))
      {
        liveVarsAfter.Add(v);
      }

      if (block.TransferCmd is GotoCmd)
      {
        GotoCmd gotoCmd = (GotoCmd) block.TransferCmd;
        if (gotoCmd.LabelTargets != null)
        {
          foreach (Block /*!*/ succ in gotoCmd.LabelTargets)
          {
            Contract.Assert(succ != null);
            Contract.Assert(succ.LiveVarsBefore != null);
            liveVarsAfter.UnionWith(succ.LiveVarsBefore);
          }
        }
      }

      List<Cmd> cmds = block.Cmds;
      int len = cmds.Count;
      for (int i = len - 1; i >= 0; i--)
      {
        if (cmds[i] is CallCmd)
        {
          Procedure /*!*/
            proc = ((CallCmd /*!*/) cmds[i]).Proc;
          if (InterProcGenKill.HasSummary(proc.Name)) // TODO: this is always false! InterProcGenKill.ComputeLiveVars is never called.
          {
            liveVarsAfter =
              InterProcGenKill.PropagateLiveVarsAcrossCall(options, (CallCmd /*!*/) cmds[i], liveVarsAfter);
            continue;
          }
        }

        Propagate(cmds[i], liveVarsAfter);
      }

      block.LiveVarsBefore = liveVarsAfter;
    }
  }

  // perform in place update of liveSet
  public void Propagate(Cmd cmd, HashSet<Variable /*!*/> /*!*/ liveSet)
  {
    Contract.Requires(cmd != null);
    if (cmd is AssignCmd) {
      AssignCmd /*!*/
        assignCmd = (AssignCmd) cmd;
      // I must first iterate over all the targets and remove the live ones.
      // After the removals are done, I must add the variables referred on 
      // the right side of the removed targets

      AssignCmd simpleAssignCmd = assignCmd.AsSimpleAssignCmd;
      HashSet<int> indexSet = new HashSet<int>();
      int index = 0;
      foreach (AssignLhs /*!*/ lhs in simpleAssignCmd.Lhss)
      {
        Contract.Assert(lhs != null);
        SimpleAssignLhs salhs = lhs as SimpleAssignLhs;
        Contract.Assert(salhs != null);
        Variable var = salhs.DeepAssignedVariable;
        if (var != null && liveSet.Contains(var))
        {
          indexSet.Add(index);
          liveSet.Remove(var);
        }

        index++;
      }

      index = 0;
      foreach (Expr /*!*/ expr in simpleAssignCmd.Rhss)
      {
        Contract.Assert(expr != null);
        if (indexSet.Contains(index))
        {
          VariableCollector /*!*/
            collector = new VariableCollector();
          collector.Visit(expr);
          liveSet.UnionWith(collector.usedVars);
        }

        index++;
      }
    }
    else if (cmd is HavocCmd)
    {
      HavocCmd /*!*/
        havocCmd = (HavocCmd) cmd;
      foreach (IdentifierExpr /*!*/ expr in havocCmd.Vars)
      {
        Contract.Assert(expr != null);
        if (expr.Decl != null && !(expr.Decl.Attributes.FindBoolAttribute("assumption") &&
                                   expr.Decl.Name.StartsWith("a##cached##")))
        {
          liveSet.Remove(expr.Decl);
        }
      }
    }
    else if (cmd is PredicateCmd)
    {
      Contract.Assert((cmd is AssertCmd || cmd is AssumeCmd));
      PredicateCmd /*!*/
        predicateCmd = (PredicateCmd) cmd;
      if (predicateCmd.Expr is LiteralExpr)
      {
        LiteralExpr le = (LiteralExpr) predicateCmd.Expr;
        if (le.IsFalse)
        {
          liveSet.Clear();
        }
      }
      else
      {
        VariableCollector /*!*/
          collector = new VariableCollector();
        collector.Visit(predicateCmd.Expr);
        liveSet.UnionWith(collector.usedVars);
      }
    }
    else if (cmd is CommentCmd)
    {
      // comments are just for debugging and don't affect verification
    }
    else if (cmd is CallCmd)
    { // a CallCmd is also a SugaredCmd, but simpler to handle here
      CallCmd /*!*/
        callCmd = (CallCmd)cmd;
      var outVars = callCmd.Outs.Select(v => v.Decl);
      var isLive = outVars.Any(liveSet.Contains);
      liveSet.RemoveWhere(outVars.Contains);

      foreach (var expr in callCmd.Ins)
      {
        VariableCollector /*!*/
          collector = new VariableCollector();
        collector.Visit(expr);
        liveSet.UnionWith(collector.usedVars);
      }
    }
    else if (cmd is SugaredCmd)
    {
      SugaredCmd /*!*/
        sugCmd = (SugaredCmd) cmd;
      Propagate(sugCmd.GetDesugaring(options), liveSet);
    }
    else if (cmd is StateCmd)
    {
      StateCmd /*!*/
        stCmd = (StateCmd) cmd;
      List<Cmd> /*!*/
        cmds = stCmd.Cmds;
      int len = cmds.Count;
      for (int i = len - 1; i >= 0; i--)
      {
        Propagate(cmds[i], liveSet);
      }

      foreach (Variable /*!*/ v in stCmd.Locals)
      {
        Contract.Assert(v != null);
        liveSet.Remove(v);
      }
    }
    else
    {
      {
        Contract.Assert(false);
      }
    }
  }
}