#nullable enable
using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.Boogie;
using SymDiffUtils;

namespace SymDiff.source;

public static class BoogieStructuralDiffManager
{
    /// <summary>
    /// Structurally compares two implementations with procedure call / variable
    /// renaming. If the two are structurally equivalent, maps of procedure
    /// and global variable names from this to other implementation that make
    /// the two structurally equivalent are returned.
    /// </summary>
    public static bool EqualsStructural(this Implementation? thisImpl,
                                        Implementation? otherImpl,
                                        out Dictionary<Procedure, Procedure> procedureMapping,
                                        out Dictionary<Variable, Variable> globalsMapping)
    {
        var implComparer = new ImplementationComparer();
        var res = implComparer.Compare(thisImpl, otherImpl);

        procedureMapping = implComparer.ProcedureMapping;
        globalsMapping = implComparer.GlobalVarMapping;
        return res;
    }
}

public class ImplementationComparer
{
    private Dictionary<Variable, Variable> localVarMapping = new();
    private Dictionary<Block, Block> blockMapping = new();
    public Dictionary<Variable, Variable> GlobalVarMapping = new();
    public Dictionary<Procedure, Procedure> ProcedureMapping = new();

    public bool Compare(Implementation? implA, Implementation? implB)
    {
        if (implA == null || implB == null
                          || implA.TypeParameters.Count != implB.TypeParameters.Count
                          || implA.InParams.Count != implB.InParams.Count
                          || implA.OutParams.Count != implB.OutParams.Count
                          || implA.Blocks.Count != implB.Blocks.Count)
        {
            return false;
        }

        // TODO: this could be improved. Instead of zipping and hoping for the
        // best, can start with the initial block and follow transfer commands,
        // building up a map (assuming loops are dealt with).
        foreach (var (blk1, blk2) in implA.Blocks.Zip(implB.Blocks))
        {
            if (!Compare(blk1, blk2))
            {
                // TODO: remove this check after applying above improvement
                foreach (var (bb1, bb2) in implA.Blocks.Zip(implB.Blocks))
                {
                    if (blockMapping.TryGetValue(bb1, out var mappedBlk) && mappedBlk != bb2)
                    {
                        Log.Out(Log.Warning,
                            $"The structural equality check for {implA.Name} and {implB.Name} " +
                            $"failed due to the simplistic block comparison!");
                        break;
                    }
                }
                return false;
            }
        }

        return true;
    }
    
    private bool Compare(Block blockA, Block blockB)
    {
        if (blockA.TransferCmd == null || blockB.TransferCmd == null ||
            blockA.TransferCmd.GetType() != blockB.TransferCmd.GetType())
            return false;

        if (blockA.TransferCmd is GotoCmd t1 &&
            blockB.TransferCmd is GotoCmd t2)
        {
            foreach (var (blkTarget1, blkTarget2) in t1.labelTargets.Zip(t2.labelTargets))
            {
                if (!blockMapping.ContainsKey(blkTarget1))
                {
                    blockMapping.Add(blkTarget1, blkTarget2);
                }
                else if (blockMapping[blkTarget1] != blkTarget2)
                {
                    return false;
                }
            }
        }

        var i = 0;
        var j = 0;
        while (i < blockA.Cmds.Count && j < blockB.Cmds.Count)
        {
            if (IsIrrelevantCommand(blockA.Cmds[i]))
            {
                i++;
                continue;
            }
            if (IsIrrelevantCommand(blockB.Cmds[j]))
            {
                j++;
                continue;
            }
            if (!Compare(blockA.Cmds[i], blockB.Cmds[j]))
                return false;
            i++;
            j++;
        }
        // Any remaining commands must be irrelevant
        for (; i < blockA.Cmds.Count; ++i)
        {
            if (!IsIrrelevantCommand(blockA.Cmds[i]))
                return false;
        }
        for (; j < blockB.Cmds.Count; ++j)
        {
            if (!IsIrrelevantCommand(blockB.Cmds[j]))
                return false;
        }

        return true;
    }

    private bool EqualsStructuralExpr(Expr exprA, Expr exprB)
    {
        var combinedMapping = localVarMapping.Concat(GlobalVarMapping).ToDictionary();
        var exprComparator = new ExprComparatorWithRenaming(combinedMapping);
        var res = exprComparator.Compare(exprA, exprB);
        var updatedMapping = exprComparator.GetUpdatedVariableMapping;

        // update the mappings
        foreach (var (v1, v2) in updatedMapping)
        {
            switch (v1)
            {
                case GlobalVariable:
                case Constant: // TODO: review
                    GlobalVarMapping.TryAdd(v1, v2);
                    break;
                default:
                    localVarMapping.TryAdd(v1, v2);
                    break;
            };
        }

        return res;
    }
    
    private bool Compare(Cmd? cmdA, Cmd? cmdB)
    {
        if (cmdA == null || cmdB == null) return cmdA == cmdB;
        if (cmdA.GetType() != cmdB.GetType()) return false;
        return (cmdA, cmdB) switch
        {
            (AssertCmd a, AssertCmd b) => EqualsStructuralExpr(a.Expr, b.Expr),
            (AssumeCmd a, AssumeCmd b) => EqualsStructuralExpr(a.Expr, b.Expr),
            (AssignCmd a, AssignCmd b) => EqualsStructuralAssign(a, b),
            (CallCmd   a, CallCmd   b) => EqualsStructuralCall(a, b),
            (HavocCmd  a, HavocCmd  b) => EqualsStructuralHavoc(a, b),
            _ => throw new Exception(
                $"Do not know how to compare commands {cmdA} and {cmdB}")
        };
    }

    private bool EqualsStructuralCall(CallCmd cmdA, CallCmd cmdB)
    {
        var procA = cmdA.Proc;
        if (ProcedureMapping.TryGetValue(procA, out var procB) && cmdB.Proc != procB)
            return false;

        procB = cmdB.Proc;

        if (procA.InParams.Count != procB.InParams.Count)
            return false;

        if (cmdA.Ins .Zip(cmdB.Ins) .Any(p => !EqualsStructuralExpr(p.First, p.Second)) ||
            cmdA.Outs.Zip(cmdB.Outs).Any(p => !EqualsStructuralExpr(p.First, p.Second)))
            return false;

        ProcedureMapping.TryAdd(procA, procB);
        return true;
    }

    private bool EqualsStructuralAssign(AssignCmd cmdA, AssignCmd cmdB)
    {
        if (cmdA.Lhss.Count != cmdB.Lhss.Count ||
            cmdA.Rhss.Count != cmdB.Rhss.Count)
            return false;
        
        if (cmdA.Lhss.Zip(cmdB.Lhss).Any(p => !EqualsStructuralExpr(p.First.AsExpr, p.Second.AsExpr)) ||
            cmdA.Rhss.Zip(cmdB.Rhss).Any(p => !EqualsStructuralExpr(p.First, p.Second)))
            return false;

        return true;
    }

    private bool EqualsStructuralHavoc(HavocCmd cmdA, HavocCmd cmdB)
    {
        return cmdA.Vars.Count == cmdB.Vars.Count &&
               cmdA.Vars.Zip(cmdB.Vars).All(p => EqualsStructuralExpr(p.First, p.Second));
    }

    private bool IsIrrelevantCommand(Cmd cmd)
    {
        return cmd is AssertCmd { Expr: LiteralExpr { asBool: true } } 
                   or AssumeCmd { Expr: LiteralExpr { asBool: true } } 
                   or CommentCmd;
    }
}

public class ExprComparatorWithRenaming(Dictionary<Variable, Variable> variableMapping)
{
    private readonly Dictionary<Variable, Variable> mapping = new(variableMapping);
    public Dictionary<Variable, Variable> GetUpdatedVariableMapping => mapping;

    public bool Compare(Expr? exprA, Expr? exprB)
    {
        if (exprA == null || exprB == null)
            return exprA == exprB;
        
        if (exprA.GetType() != exprB.GetType())
            return false;

        switch (exprA)
        {
            case LiteralExpr or BvExtractExpr:
                return exprA.Equals(exprB); // Expr.Equals works for these two
            case IdentifierExpr identifierA:
                return CompareIdentifierExpr(identifierA, (exprB as IdentifierExpr)!);
            case OldExpr oldA:
                return CompareOldExpr(oldA, (exprB as OldExpr)!);
            case BvConcatExpr bvConcatA:
                return CompareBvConcatExpr(bvConcatA, (exprB as BvConcatExpr)!);
            case NAryExpr nAryA:
                return CompareNAryExpr(nAryA, (exprB as NAryExpr)!);
            case BinderExpr binderA:
                return CompareBinderExpr(binderA, (exprB as BinderExpr)!);
            default:
                throw new NotSupportedException($"Expression type {exprA.GetType().Name}" +
                                                $" is not supported for syntactic equivalence check.");
        }
    }

    private bool CompareIdentifierExpr(IdentifierExpr a, IdentifierExpr b)
    {
        if (mapping.TryGetValue(a.Decl, out var bVar))
        {
            return b.Name.Equals(bVar.Name);
        }

        mapping.Add(a.Decl, b.Decl);
        return true;
    }

    private bool CompareOldExpr(OldExpr a, OldExpr b)
    {
        return Compare(a.Expr, b.Expr);
    }

    private bool CompareBvConcatExpr(BvConcatExpr a, BvConcatExpr b)
    {
        return Compare(a.E0, b.E0) && Compare(a.E1, b.E1);
    }

    private bool CompareNAryExpr(NAryExpr a, NAryExpr b)
    {
        if (!Equals(a.Fun, b.Fun) || a.Args.Count != b.Args.Count)
            return false;
        for (var i = 0; i < a.Args.Count; i++)
        {
            if (!Compare(a.Args[i], b.Args[i]))
                return false;
        }
        return true;
    }

    private bool CompareBinderExpr(BinderExpr a, BinderExpr b)
    {
        if (a.Kind != b.Kind
            || !a.TypeParameters.SequenceEqual(b.TypeParameters)
            || a.Dummies.Count != b.Dummies.Count)
            return false;

        // To handle dummies, we create a new ExprComparator only for this expr,
        // which contains the dummy mapping in the two expressions. After
        // comparison, we eliminate dummies but preserve any non-dummy variables
        // in the new mapping.
        Dictionary<Variable, Variable> mappingWithDummies = new(mapping);
        a.Dummies.Zip(b.Dummies)
            .ForEach(p => mappingWithDummies.Add(p.First, p.Second));
        var comp = new ExprComparatorWithRenaming(mappingWithDummies);
        var res = comp.Compare(a.Body, b.Body);
        var newMappingWithDummies = comp.GetUpdatedVariableMapping;
        var newKeysWithoutDummies = newMappingWithDummies.Keys.Except(mappingWithDummies.Keys);
        newKeysWithoutDummies.ForEach(k => mapping.Add(k, newMappingWithDummies[k]));
        return res;
    }
}
