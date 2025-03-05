using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using Microsoft.Boogie;
using Bpl = Microsoft.Boogie;
using B = SDiff.Boogie;

using SymDiffUtils;

namespace SDiff
{

  public class CallGraphNodeComparer : IEqualityComparer<CallGraphNode>
  {
    public bool Equals(CallGraphNode a, CallGraphNode b)
    {
      return a.Name == b.Name;
    }

    public int GetHashCode(CallGraphNode n)
    {
      return n.Name.GetHashCode();
    }
  }


  public class CallGraphNode : ISimpleGraphNode
  {
    public readonly string Name;
    public string GetName() { return Name; }

    private Procedure proc;
    public Procedure Proc
    {
      get { return proc; }
    }

    private Implementation impl;
    public Implementation Impl
    {
      get { return impl; }
    }

    private List<CallGraphNode> callees;
    public List<CallGraphNode> Callees
    {
      get { return callees; }
    }
    public List<Procedure> CalleesAsProcedures
    {
      get { return Callees.Map(x => x.Proc); }
    }

    public List<List<CallGraphNode>> SCCs;

    public IEnumerable<ISimpleGraphNode> GetChildren()
    {
      return Callees.Filter(p => p != this);
    }

    public HashSet<Variable> ReadSet;
    public List<Variable> ReadSetGlobals
    {
      get
      {
        if (ReadSet == null)
          return new List<Variable>();
        return ReadSet.FilterList(x => x is GlobalVariable);
      }
    }
    public HashSet<Variable> WriteSet;
    public List<Variable> WriteSetGlobals
    {
      get
      {
        if (WriteSet == null || Options.OnlyConsiderReturnAsOutput)
          return new List<Variable>();
        return WriteSet.FilterList(x => x is GlobalVariable);
      }
    }

    //variables to ignore completely when comparing
    public HashSet<Variable> IgnoreSet;

    public CallGraphNode(string name)
    {
      this.Name = name;
      proc = null;
      impl = null;
      ReadSet = null;
      WriteSet = null;
      IgnoreSet = new HashSet<Variable>();
      callees = new List<CallGraphNode>();
      SCCs = null;
    }

    public bool UseImplementation(CallGraph cg, Implementation i)
    {
      if (i == null || cg == null)
        return false;

      if (Name != i.Name)
        return false;

      impl = i;
      
      CalleeCollector collect = new CalleeCollector();
      collect.Visit(i);
      callees = new List<CallGraphNode>();
      foreach (var callee in collect.Callees)
      {
        var cnode = cg.NodeOfName(callee.Name);
        if (!callees.Contains(cnode))
          callees.Add(cnode);
      }
      return true;
    }

    public bool UseProcedure(Procedure p)
    {
      proc = p;
      return true;
    }

    public bool IsSinglyRecursive()
    {
      foreach (var node in Callees)
        if (node == this)
          return true;
      return false;
    }
  }

  public class CallGraph
  {
    protected Dictionary<string, CallGraphNode> nodes;
    public List<CallGraphNode> GetNodes()
    {
      return nodes.ValuesToList();
    }
    
    public IEnumerable<CallGraphNode> Roots
    {
      get
      {
        return SimpleGraph.FindRoots(GetNodes().Cast<ISimpleGraphNode>()).Cast<CallGraphNode>();
      }
    }

    public CallGraph()
    {
      nodes = new Dictionary<string, CallGraphNode>();
    }

    public void AddDeclaration(Declaration decl)
    {
      AddProcedure(decl as Procedure);
      AddImplementation(decl as Implementation);
    }

    public static CallGraph Make(Program program)
    {
      if (program == null)
        return null;

      CallGraph cg = new CallGraph();

      program.TopLevelDeclarations.ForEach(x => cg.AddDeclaration(x));

      return cg;
    }

    public CallGraphNode NodeOfName(string name)
    {
      CallGraphNode node;
      nodes.TryGetValue(name, out node);
      if (node == null)
        nodes.Add(name, node = new CallGraphNode(name));
      return node;
    }

    public bool AddImplementation(Implementation i)
    {
      if (i == null)
        return false;

      CallGraphNode node = NodeOfName(i.Name);
      return node.UseImplementation(this, i);
    }

    public bool AddProcedure(Procedure p)
    {
      if (p == null)
        return false;

      CallGraphNode node = NodeOfName(p.Name);
      return node.UseProcedure(p);
    }

    public List<CallGraphNode> GetPostOrder()
    {
      var roots = SimpleGraph.FindRoots(GetNodes()).Cast<CallGraphNode>();
      var post = new SDiff.PostOrder();
      foreach (var root in roots)
        post.Visit(root);
      return post.ordering;
    }

    public List<List<CallGraphNode>> ComputeSCCs()
    {
      var sccv = new SCCVisitor();

      foreach (var node in Roots)
        sccv.Visit(node);

      return sccv.SCCs;
    }

    public List<CallGraphNode> SinglyRecursiveFns()
    {
      var l = new List<CallGraphNode>();
      foreach (var node in nodes)
        if (node.Value.IsSinglyRecursive())
          l.Add(node.Value);
      return l;
    }

    public bool HasCycle()
    {
      foreach (var node in nodes)
      {
        var cy = new CycleDetector();
        cy.Visit(node.Value);
        if (cy.HasCycle)
          return true;
      }
      return false;
    }

    public void SetIgnores()
    {
      var voids = new VoidDetector();
      foreach (var node in Roots)
        voids.Visit(node);
    }

    public void Print()
    {
      var emit = new CallGraphEmitter();
      foreach (var node in Roots)
        emit.Visit(node);
    }
    
    public void DumpDotGraph(string fileName)
    {
      var dotGraph = new StringBuilder();
      dotGraph.AppendLine("digraph G {");
      dotGraph.AppendLine("  node [shape=box, style=filled, color=lightblue];");
      foreach (var node in GetNodes())
      {
        dotGraph.AppendLine($"  \"{node.Name}\";");

        foreach (var child in node.Callees)
        {
          dotGraph.AppendLine($"  \"{node.Name}\" -> \"{child.Name}\";");
        }
      }
      dotGraph.AppendLine("}");
      File.WriteAllText(fileName + ".gv", dotGraph.ToString());
    }
  }

  public class SCCVisitor
  {
    public readonly List<List<CallGraphNode>> SCCs;
    public readonly Stack<CallGraphNode> Visited;
    public readonly Dictionary<CallGraphNode, int> Indices;
    public readonly Dictionary<CallGraphNode, int> Levels;
    public int CurIndex;
      
    public SCCVisitor()
    {
      CurIndex = 0;
      SCCs = new List<List<CallGraphNode>>();
      Visited = new Stack<CallGraphNode>();
      Indices = new Dictionary<CallGraphNode,int>();
      Levels = new Dictionary<CallGraphNode,int>();
    }

    public void Visit(CallGraphNode node)
    {
      if (!Visited.Contains(node))
      {
        Indices.Replace(node, CurIndex);
        Levels.Replace(node, CurIndex);
        CurIndex++;
        Visited.Push(node);

        foreach (var child in node.Callees)
        {
          if (!Visited.Contains(child))
          {
            Visit(child);
            Levels.Replace(node, Math.Min(Levels.Get(child), Levels.Get(node)));
          }
          else
            Levels.Replace(node, Math.Min(Levels.Get(node), Indices.Get(child)));
        }

        if (Levels.Get(node) == Indices.Get(node))
        {
          var scc = new List<CallGraphNode>();
          CallGraphNode next = Visited.Pop();
          scc.Add(node);
          while (next != node)
          {
            scc.Add(next);
            next = Visited.Pop();
          }
          SCCs.Add(scc);
        }
      }
    }
  }
}