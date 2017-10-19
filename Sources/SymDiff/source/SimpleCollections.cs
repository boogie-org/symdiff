using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using Microsoft.Boogie;
using Bpl = Microsoft.Boogie;
using B = SDiff.Boogie;

namespace SDiff
{
  public class ISimpleGraphNodeComparer : IEqualityComparer<ISimpleGraphNode>
  {
    public bool Equals(ISimpleGraphNode a, ISimpleGraphNode b)
    {
      return a.GetName() == b.GetName();
    }

    public int GetHashCode(ISimpleGraphNode a)
    {
      return a.GetName().GetHashCode();
    }
  }

  public interface ISimpleGraphNode
  {
    string GetName();
    IEnumerable<ISimpleGraphNode> GetChildren();
  }

  public static class SimpleGraph
  {
    public static List<ISimpleGraphNode> FindRoots(IEnumerable<ISimpleGraphNode> nodes)
    {
      var roots = new HashSet<ISimpleGraphNode>(nodes, new ISimpleGraphNodeComparer());

      foreach (var n in nodes)
        foreach (var c in n.GetChildren())
          roots.Remove(c);
      return new List<ISimpleGraphNode>(roots);
    }
  }
}