using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using Microsoft.Boogie;
using Microsoft.Boogie.GraphUtil;

namespace SymDiff.source;

public static class BoogieStructuralDiffManager
{
  // This is currently quite restrictive, but should work for simple changes
  // that do not change the control flow, and should be insensitive to block
  // labels.
  public static bool CanComputeDiff(this Implementation implA, Implementation implB,
                                    out Dictionary<Block, Block> blockMapping)
  {
    blockMapping = new Dictionary<Block, Block>();
    if (implA.Blocks == null || implB.Blocks == null || implA.Blocks.Count != implB.Blocks.Count) 
      return false;
    Graph<Block> graphA = Program.GraphFromImpl(implA);
    Graph<Block> graphB = Program.GraphFromImpl(implB);
    if (graphA.Edges.Count() != graphB.Edges.Count())
      return false;
    // TODO: use a graph isomorphism below rather than ordering by name!
    foreach (var ((blkA1, blkA2), (blkB1, blkB2)) in
             graphA.Edges.OrderBy(p => p.Item1.Label)
               .Zip(graphB.Edges.OrderBy(p => p.Item1.Label)))
    {
      var blocksToCompare = new List<(Block, Block)>{ (blkA1, blkB1), (blkA2, blkB2) };
      foreach (var (blkA, blkB) in blocksToCompare)
      {
        if (blockMapping.TryGetValue(blkA, out var blkInMap))
        {
          if (!blkInMap.Label.Equals(blkB.Label))
          {
            blockMapping.Clear();
            return false;
          }
        }
        else
        {
          blockMapping.Add(blkA, blkB);
        }
      }
    }

    return true;
  }
  
  public static Dictionary<Block, Block> GetBlocksThatDiffer(this Implementation implA,
                                                             Implementation implB,
                                                             Dictionary<Block, Block> blockMapping,
                                                             ReadOnlyDictionary<string, string> functionMapping)
  {
    Dictionary<Block, Block> blocksThatDiffer = new();
    var comparer = new ImplementationComparer(functionMapping);
    foreach (var (blkA, blkB) in blockMapping)
    {
      if (!comparer.Compare(blkA, blkB))
      {
        blocksThatDiffer.Add(blkA, blkB);
      }
    }
    
    foreach (var (blkA, blkB) in comparer.blockMapping)
      if (blockMapping[blkA] != blkB)
        throw new Exception("Inconsistent block mapping!");

    return blocksThatDiffer;
  }
}