using System;
using System.Collections.Generic;
using Microsoft.Boogie;

using SymDiffUtils;

namespace SDiff
{
  public abstract class CallGraphVisitor
  {
    protected HashSet<CallGraphNode> Visited;

    public CallGraphVisitor()
    {
      Visited = new HashSet<CallGraphNode>();
    }

    //base visit does a DFS
    public virtual CallGraphNode Visit(CallGraphNode node)
    {
      Visited.Add(node);

      for(int i = 0; node.Callees != null && i < node.Callees.Count; i++)
        if (!Visited.Contains(node.Callees[i]))
          node.Callees[i] = Visit(node.Callees[i]);

      return node;
    }
  }

  public class PostOrder : CallGraphVisitor
  {
    public List<CallGraphNode> ordering;

    public PostOrder()
    {
      ordering = new List<CallGraphNode>();
    }

    public override CallGraphNode Visit(CallGraphNode node)
    {
      base.Visit(node);
      ordering.Add(node);
      return node;
    }
  }

  public class ReadWriteSetDecorator : CallGraphVisitor
  {
    private CallGraph CGraph;

    private ReadWriteSetDecorator()
    {
    }

    public static void DoDecorate(CallGraph cg)
    {
      var decorator = new ReadWriteSetDecorator();
      decorator.CGraph = cg;

      foreach (var root in cg.Roots)
        decorator.Visit(root);
    }

    public override CallGraphNode Visit(CallGraphNode node)
    {
      if (node.Impl == null && node.Proc == null)
      {
        Log.Out(Log.Error, "RWSetDecorator hit incomplete callgraph");
        return node;
      }

      base.Visit(node);

      node.ReadSet = new HashSet<Variable>();
      node.WriteSet = new HashSet<Variable>();

      //if there's a node with only a signature, we'll use the signature's modifies set to determine the read/write set
      //changed to eliminate the existing modifies set instead.
      if (node.Impl == null && node.Proc != null)
      {
          //DEBUG
          foreach (IdentifierExpr ie in node.Proc.Modifies)
          {
              node.WriteSet.Add(ie.Decl);
              node.ReadSet.Add(ie.Decl);
          }
        return node;
      }

      var writes = new VariableCollector();
      var reads = new VariableCollector();

      foreach (Block b in node.Impl.Blocks)
      {
        foreach (Cmd c in b.Cmds)
        {
          //if it's been written to already, the read is of a new value
          //and hence shouldn't be counted
          reads.Exempt = new HashSet<Variable>(writes.Vars);

          var assgn = c as AssignCmd;
          if (assgn != null)
          {
            for (int i = 0; i < assgn.Rhss.Count; i++)
              reads.VisitExpr(assgn.Rhss[i]);
            for (int i = 0; i < assgn.Lhss.Count; i++)
            {
              //map write operations are also implicit reads
              //(since one of the update parameters is the current map)
              if (assgn.Lhss[i] is MapAssignLhs)
                reads.VisitExpr(assgn.Lhss[i].AsExpr);
              //BUG:the write should only collect the top-level expr
              //writes.VisitExpr(assgn.Lhss[i].AsExpr);
              writes.Vars.Add(assgn.Lhss[i].DeepAssignedVariable);
            }
          }

          var call = c as CallCmd;
          if (call != null)
          {
            call.Ins.Iterate(x => reads.Visit(x));
            call.Outs.Iterate(x => writes.Visit(x));

            var calleeNode = CGraph.NodeOfName(call.Proc.Name);
            if (calleeNode != node)
            {
              //if (calleeNode.ReadSetGlobals.Count == 0)
              //  Log.Out(Log.Warning, "Child node " + call.Proc.Name + " of " + node.Name + " has null Read set");
              //else
              reads.Vars.AddRange(CGraph.NodeOfName(call.Proc.Name).ReadSetGlobals);
              //if (calleeNode.WriteSetGlobals.Count == 0)
              //  Log.Out(Log.Warning, "Child node " + call.Proc.Name + " of " + node.Name + " has null Write set");
              //else
              writes.Vars.AddRange(CGraph.NodeOfName(call.Proc.Name).WriteSetGlobals);
            }
          }

          var assrt = c as AssertCmd;
          if (assrt != null)
            reads.Visit(assrt.Expr);

          var assme = c as AssumeCmd;
          if (assme != null)
            reads.Visit(assme.Expr);



        }
      }

      node.ReadSet.UnionWith(reads.Vars); //|| x is Constant)); this is sound as long as the constant sets are the same
      node.WriteSet.UnionWith(writes.Vars);

      return node;
    }
  }

  public class VoidDetector : CallGraphVisitor
  {
    public override CallGraphNode Visit(CallGraphNode node)
    {
      if (node.WriteSet != null && node.Impl != null)
        foreach (Variable v in node.Impl.OutParams)
          if (!node.WriteSet.Contains(v))
            node.IgnoreSet.Add(v);
      return base.Visit(node);
    }
  }

  public class CycleDetector
  {
    private readonly HashSet<CallGraphNode> visited;
    public bool HasCycle;

    public CycleDetector()
    {
      visited = new HashSet<CallGraphNode>();
      HasCycle = false;
    }

    public void Visit(CallGraphNode node)
    {
      if (visited.Contains(node))
        HasCycle = true;
      foreach (var child in node.Callees)
        if (child != node) Visit(child);
    }
  }

  public class CallGraphEmitter : CallGraphVisitor
  {
    public override CallGraphNode Visit(CallGraphNode node)
    {
      foreach (var child in node.Callees)
        Console.WriteLine(node.Name + " -> " + child.Name);
      return base.Visit(node);
    }
  }
}