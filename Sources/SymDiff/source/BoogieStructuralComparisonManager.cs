#nullable enable
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using Microsoft.Boogie;

namespace SymDiff.source;

public static class BoogieStructuralComparisonManager
{
    /// <summary>
    /// Structurally compares two implementations with procedure call / variable
    /// renaming. If the two are structurally equivalent, maps of procedure
    /// and global variable names from this to other implementation that make
    /// the two structurally equivalent are returned.
    /// </summary>
    public static bool EqualsStructural(this Implementation? thisImpl,
                                        Implementation? otherImpl,
                                        ReadOnlyDictionary<string, string> functionMapping,
                                        out Dictionary<Procedure, Procedure> procedureMapping,
                                        out Dictionary<Variable, Variable> globalsMapping,
                                        out Dictionary<Variable, Variable> localsMapping)
    {
        var implComparer = new ImplementationComparer(functionMapping);
        var res = implComparer.Compare(thisImpl, otherImpl);

        procedureMapping = implComparer.ProcedureMapping;
        globalsMapping = implComparer.GlobalVarMapping;
        localsMapping = implComparer.LocalVarMapping;
        return res;
    }
}

public class ImplementationComparer(ReadOnlyDictionary<string, string> functionMapping)
{
    public Dictionary<Variable, Variable> LocalVarMapping = new();
    public Dictionary<Block, Block> BlockMapping = new();
    public Dictionary<Variable, Variable> GlobalVarMapping = new();
    public Dictionary<Procedure, Procedure> ProcedureMapping = new();

    public bool Compare(Implementation? implA, Implementation? implB)
    {
        if (implA == null || implB == null
                          || implA.TypeParameters.Count != implB.TypeParameters.Count
                          || implA.InParams.Count != implB.InParams.Count
                          || implA.OutParams.Count != implB.OutParams.Count
                          || implA.Blocks.Count != implB.Blocks.Count)
            return false;

        // TODO: try to match the blocks in a better way, e.g., compute a graph isomorphism
        foreach (var (blk1, blk2) in implA.Blocks.OrderBy(b => b.Label)
                                .Zip(implB.Blocks.OrderBy(b => b.Label)))
            if (!Compare(blk1, blk2)) return false;

        return true;
    }
    
    public bool Compare(Block blockA, Block blockB)
    {
        if (blockA.TransferCmd == null || blockB.TransferCmd == null ||
            blockA.TransferCmd.GetType() != blockB.TransferCmd.GetType())
            return false;

        var localBlockMapping = new Dictionary<Block, Block>();
        if (blockA.TransferCmd is GotoCmd t1 &&
            blockB.TransferCmd is GotoCmd t2)
            foreach (var (blkTarget1, blkTarget2) in t1.labelTargets.Zip(t2.labelTargets))
            {
                if (BlockMapping.TryGetValue(blkTarget1, out var mappedBlkTarget2))
                {
                    if (mappedBlkTarget2 != blkTarget2)
                        return false;
                    else
                        localBlockMapping.Add(blkTarget1, blkTarget2);
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
            if (blockA.Cmds[i] is AssumeCmd && blockB.Cmds[j] is AssumeCmd)
            {
                // Deal with blocks of relevant assume commands at once
                // to reduce brittleness to changes in their order.
                var assumesA = blockA.Cmds.Skip(i).TakeWhile(c => c is AssumeCmd)
                    .Select(c => c as AssumeCmd)
                    .OrderBy(c => c!.Expr.ToString()).ToList();
                var assumesB = blockB.Cmds.Skip(j).TakeWhile(c => c is AssumeCmd)
                    .Select(c => c as AssumeCmd)
                    .OrderBy(c => c!.Expr.ToString()).ToList();
                if (assumesA.Count != assumesB.Count)
                    return false;
                foreach (var (assm1, assm2) in assumesA.Zip(assumesB))
                    if (!Compare(assm1, assm2))
                        return false;
                i += assumesA.Count;
                j += assumesB.Count;
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

        // Update the mapping if there were no conflicts. The pair might already
        // exist, so we use TryAdd. This is safe because we know from the earlier
        // check that any existing value will not have a conflict.
        foreach (var pair in localBlockMapping)
            BlockMapping.TryAdd(pair.Key, pair.Value);
        BlockMapping.TryAdd(blockA, blockB);

        return true;
    }

    private bool EqualsStructuralExpr(Expr exprA, Expr exprB)
    {
        var combinedMapping = LocalVarMapping.Concat(GlobalVarMapping).ToDictionary();
        var exprComparator = new ExprComparatorWithRenaming(combinedMapping, functionMapping);
        var res = exprComparator.Compare(exprA, exprB);
        if (!res) return false;
        var updatedMapping = exprComparator.GetUpdatedVariableMapping;

        // update the mappings
        foreach (var (v1, v2) in updatedMapping)
        {
            switch (v1)
            {
                case GlobalVariable:
                case Constant:
                    GlobalVarMapping.TryAdd(v1, v2);
                    break;
                default:
                    LocalVarMapping.TryAdd(v1, v2);
                    break;
            };
        }

        return true;
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
            _ => throw new NotSupportedException(
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

/// <summary>
/// Structurally compares two expressions, ignoring variable renaming.
/// It will build up a variable mapping in the process. Any pairs in the
/// input mapping will be used during the comparison, but are not needed.
/// If a function mapping is not passed, the assumption is that the functions
/// must have the same name (no mapping is created).
/// </summary>
public class ExprComparatorWithRenaming(Dictionary<Variable, Variable> variableMapping,
                                        ReadOnlyDictionary<string, string> functionMapping)
{
    private readonly Dictionary<Variable, Variable> mapping = new(variableMapping);
    public Dictionary<Variable, Variable> GetUpdatedVariableMapping => mapping;

    public bool Compare(Expr? exprA, Expr? exprB)
    {
        if (exprA == null || exprB == null)
            return exprA == exprB;
        
        if (exprA.GetType() != exprB.GetType())
            return false;

        return (exprA, exprB) switch
        {
            (LiteralExpr    e1, LiteralExpr    e2) => e1.Equals(e2), // no variables, Expr.Equals is fine
            (BvExtractExpr  e1, BvExtractExpr  e2) => e1.Equals(e2), // no variables, Expr.Equals is fine
            (OldExpr        e1, OldExpr        e2) => Compare(e1.Expr, e2.Expr),
            (BvConcatExpr   e1, BvConcatExpr   e2) => Compare(e1.E0, e2.E0) && Compare(e1.E1, e2.E1),
            (NAryExpr       e1, NAryExpr       e2) => CompareNAryExpr(e1, e2),
            (BinderExpr     e1, BinderExpr     e2) => CompareBinderExpr(e1, e2),
            (IdentifierExpr e1, IdentifierExpr e2) => CompareIdentifierExpr(e1, e2),
            _ => throw new NotSupportedException($"Expression type {exprA.GetType().Name}" +
                                                 $" is not supported for structural equivalence check." +
                                                 $"Tried to compare {exprA} and {exprB}.")
        };
    }

    private bool CompareIdentifierExpr(IdentifierExpr a, IdentifierExpr b)
    {
        if (mapping.TryGetValue(a.Decl, out var bVar))
        {
            return b.Name.Equals(bVar.Name);
        }

        // Also check for a conflict in the other direction
        if (mapping.ContainsValue(b.Decl))
            return false;

        mapping.Add(a.Decl, b.Decl);
        return true;
    }

    private bool CompareNAryExpr(NAryExpr a, NAryExpr b)
    {
        if (a.Args.Count != b.Args.Count)
            return false;

        switch (a.Fun)
        {
            case ArithmeticCoercion or BinaryOperator or FieldAccess or
                FieldUpdate or IfThenElse or IsConstructor or MapSelect or
                MapStore or TypeCoercion or UnaryOperator:
            {
                if (!a.Fun.FunctionName.Equals(b.Fun.FunctionName))
                    return false;
                break;
            }
            case FunctionCall _:
            {
                if (functionMapping.TryGetValue(a.Fun.FunctionName, out var bFunctionName) &&
                    !b.Fun.FunctionName.Equals(bFunctionName))
                    return false;
                else if (!a.Fun.FunctionName.Equals(b.Fun.FunctionName))
                    return false;
                break;
            }
            default:
                throw new ArgumentOutOfRangeException();
        }

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
        a.Dummies.Zip(b.Dummies).ForEach(p => mappingWithDummies.Add(p.First, p.Second));
        var comp = new ExprComparatorWithRenaming(mappingWithDummies, functionMapping);
        if (!comp.Compare(a.Body, b.Body))
            return false;
        var newMappingWithDummies = comp.GetUpdatedVariableMapping;
        var newKeysWithoutDummies = newMappingWithDummies.Keys.Except(mappingWithDummies.Keys);
        newKeysWithoutDummies.ForEach(k => mapping.Add(k, newMappingWithDummies[k]));
        return true;
    }
}
