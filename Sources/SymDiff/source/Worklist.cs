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
  //public class WorklistNodeComparer : IEqualityComparer<WorklistNode>
  //{
  //  public bool Equals(WorklistNode a, WorklistNode b)
  //  {
  //    return a.Name == b.Name;
  //  }

  //  public int GetHashCode()
  //  {
  //    return a.Name.GetHashCode();
  //  }
  //}

  public class WorklistNode : ISimpleGraphNode
  {
    public CallGraphNode fst;
    public CallGraphNode snd;

    public string FirstName
    {
      get { return Worklist.Firstify(fst.Name); }
    }

    public string LastName
    {
      get { return Worklist.Secondify(snd.Name); }
    }

    public string GetName() { return FirstName + "." + LastName; }

    public enum EqState { OK, NOK, UNK }

    private EqState equiv;
    public EqState Equiv
    {
      get { return equiv; }
    }

    public List<CallGraphNode> LeftChildren
    {
      get { return fst.Callees; }
    }

    public List<CallGraphNode> RightChildren
    {
      get { return snd.Callees; }
    }

    public List<WorklistNode> children;
    public List<WorklistNode> Children
    {
      get { return new List<WorklistNode>(children); }
    }
    public IEnumerable<ISimpleGraphNode> GetChildren()
    {
      return (IEnumerable<ISimpleGraphNode>)Children;
    }

    public bool SetChildrenWithWorklist(Worklist w)
    {
      foreach (var c in LeftChildren)
      {
        WorklistNode node;
        w.nodes.TryGetValue(Worklist.Firstify(c.Name), out node);
        //if (node == null)
        //{ ... }
        //else
      }

      foreach (var c in RightChildren)
      {
        WorklistNode node;
        w.nodes.TryGetValue(Worklist.Secondify(c.Name), out node);

      }
      return false;
    }

    public WorklistNode(CallGraphNode fst, CallGraphNode snd)
    {
      if (fst == null || snd == null)
        Log.Out(Log.Urgent, "Constructing worklist node with null members");
      this.fst = fst;
      this.snd = snd;
      this.children = new List<WorklistNode>();
      equiv = EqState.UNK;
    }
   
  }

  public class Worklist
  {
    public static string Firstify (string n) { return "fst::" + n; }
    public static string Secondify (string n) { return "snd::" + n; }

    public Dictionary<string, WorklistNode> nodes;

    private CallGraphNode root;
    public CallGraphNode Root
    {
      get
      {
        var roots = SimpleGraph.FindRoots((IEnumerable<ISimpleGraphNode>)nodes.ToList()).Cast<CallGraphNode>();
        if (roots == null)
          return root = null;
        return root = roots.First();
      }
    }


    public Worklist Make(CallGraph c1, CallGraph c2, Config cfg)
    {
      var c1Roots = SimpleGraph.FindRoots((IEnumerable<ISimpleGraphNode>)c1.GetNodes()).Cast<CallGraphNode>();
      var c2Roots = SimpleGraph.FindRoots((IEnumerable<ISimpleGraphNode>)c2.GetNodes()).Cast<CallGraphNode>();

      if (c1Roots.Count() != c2Roots.Count())
        Log.Out(Log.Urgent, "Unequal number of nodes at root level in worklist construction");

      //for(int i = 0; i < c1Roots.Count; i++)
      //  c1Roots[i].Name
      return null;
    }

    public bool AddNode(WorklistNode node)
    {
      if (node == null)
      {
        Log.Out(Log.Urgent, "Adding a null node to the Worklist?");
        return true;
      }
      nodes.Add(node.FirstName, node);
      nodes.Add(node.LastName, node);
      return false;
    }

    //assumes |l1| == |l2|
    public List<WorklistNode> MatchLevel(List<CallGraphNode> l1, List<CallGraphNode> l2, Config cfg)
    {
      var newNodes = new List<WorklistNode>();
      foreach (var fst in l1)
      {
        var sndName = cfg.LookupFunction(fst.Name);
        var snd = l2.Find(x => x.Name == sndName);
        newNodes.Add(new WorklistNode(fst, snd));
      }
      return newNodes;
       
    }

  }








}