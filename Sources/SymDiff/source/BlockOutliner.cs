using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.Boogie;

namespace SymDiff.source;

public static class BlockOutliner
{
    // Outlining might not be sound (for partial equivalence) if the outlined
    // block contains assume statements. If relative termination is also checked,
    // then this check can be disabled.
    public static bool IsSoundForOutlining(this Block block)
    {
        var assumeCmds = block.Cmds.Where(c =>
            c is AssumeCmd { Expr: not LiteralExpr }).ToList();
        if (assumeCmds.Count == 0) return true;

        foreach (var cmd in assumeCmds)
        {
            var c = new VariableCollector();
            c.Visit(cmd);
            if (c.usedVars.Any()) return false;
        }

        return true;
    }
    
    /// <summary>
    /// Outlines the passed Block, i.e., extracts it as a procedure.
    /// The passed Implementation and Program are updated in-place.
    /// </summary>
    public static Implementation OutlineBlock(CoreOptions options,
                                              Program program, 
                                              Implementation containingImpl,
                                              Block block)
    {
        var globals = program.TopLevelDeclarations.OfType<GlobalVariable>().ToHashSet();
        var blockImpl = Outline(block, containingImpl, globals, options);

        program.AddTopLevelDeclaration(blockImpl);
        program.AddTopLevelDeclaration(blockImpl.Proc);

        return blockImpl;
    }

    private static Implementation Outline(Block block,
                                          Implementation containingImpl,
                                          HashSet<GlobalVariable> globals,
                                          CoreOptions options)
    {
        /*
         *   block:
         *       [block_body]
         *       goto block_next;
         *
         * is outlined as
         * 
         *   block:
         *       call outs := block_body_impl(ins);
         *       goto block_next;
         *   [...]
         * 
         *   procedure block_body_impl(proc_ins) returns (proc_outs)
         *       modifies [subset of globals that are in block_body]
         * 
         *   implementation block_body_impl(proc_ins) returns (proc_outs)
         *   {
         *       var locals; // declare locals that only appear in this block
         *                   // and copies of input variables
         *       block entry:
         *           [assign some ins that appear as outs]
         *           goto block;
         *       block:
         *           [block_body] with subst(v, proc_v)
         *           return;
         *   }   
         * 
         *  ins  : Non-global variables where
         *             1) the variable is live before the block
         *             2) the variable is in the footprint of the block
         *         I.e. variables whose values are actually needed.
         *  outs : Non-global variables where
         *             1) the variable is live after the block
         *             2) the variable is modified within the block
         *         I.e., values that the block is responsible for and that are
         *         used after the block.
         *         We also add all ins to outs, because there might be assume
         *         statements over them.
         */

        var modifiedExprs    = new List<IdentifierExpr>();
        var modifiedVars     = new List<Variable>();
        var footprint        = new HashSet<Variable>();

        // Collect used and assigned variables within the block
        foreach (var cmd in block.Cmds)
        {
            cmd.AddAssignedIdentifiers(modifiedExprs);
            modifiedVars = modifiedExprs.Select(ie => ie.Decl).ToList();

            var c = new VariableCollector();
            c.Visit(cmd);
            footprint.UnionWith(c.usedVars);
        }

        // Create a 2-unrolled implementation and apply live-variable analysis.
        // Unrolling is needed for ComputeLiveVariables to work.
        var unrolledBlocks = LoopUnroll.UnrollLoops(containingImpl.Blocks[0], 2, false);
        var unrolledImpl = new Implementation(Token.NoToken,
            containingImpl.Name + "unrolled", containingImpl.TypeParameters,
            containingImpl.InParams, containingImpl.OutParams,
            containingImpl.LocVars, unrolledBlocks);
        new SymDiff.source.LiveVariableAnalysis(options).ComputeLiveVariables(unrolledImpl, globals);
        var unrollingsOfBlock = containingImpl.Blocks.ToDictionary(
            b1 => b1,
            b1 => unrolledBlocks.Where(b2 => Enumerable.Range(0, 3) // i.e., (0, 2]
                .Any(i => b2.Label.Equals(b1.Label + $"#{i}")))
        );

        var liveVarsBefore = new HashSet<Variable>();
        var liveVarsAfter = new HashSet<Variable>();

        if (unrollingsOfBlock.TryGetValue(block, out var unrollings))
        {
            foreach (var blk in unrollings)
            {
                blk.LiveVarsBefore.ForEach(v => liveVarsBefore.Add(v));
                if (blk.TransferCmd is not GotoCmd cmd) continue;
                foreach (var blkTarget in cmd.LabelTargets)
                {
                    var targetUnrollings = unrollingsOfBlock.Where(b =>
                            blkTarget.Label.Equals(b.Key.Label + "#0") ||
                            blkTarget.Label.Equals(b.Key.Label + "#1") ||
                            blkTarget.Label.Equals(b.Key.Label + "#2")).SelectMany(p => p.Value).ToList();
                    if (targetUnrollings.Count == 0) continue;
                    targetUnrollings.ForEach(b => b.LiveVarsBefore.ForEach(v => liveVarsAfter.Add(v)));
                    // {
                    //     if (liveVarsBefore.Count == 0) liveVarsBefore = footprint;
                    //     if (liveVarsAfter.Count == 0) liveVarsAfter = globals.Select(v => v as Variable).ToHashSet();
                    // };
                }
            }
        }

        var newImplIns     = new List<Variable>();
        var newImplOuts    = new List<Variable>();
        var substMap       = new Dictionary<Variable, IdentifierExpr>();
        var initAssigns    = new List<Cmd>();
        var finalAssigns   = new List<Cmd>();
        var localsForIns   = new List<LocalVariable>();
        var callSiteIns    = new List<Expr>();
        var callSiteOuts   = new List<IdentifierExpr>();

        var containingImplNonGlobals = containingImpl.InParams
            .Concat(containingImpl.OutParams)
            .Concat(containingImpl.LocVars).ToList();

        // 1) the variable is live before the block
        // 2) the variable is in the footprint of the block
        var inVars = containingImplNonGlobals.Where(v =>
            liveVarsBefore.Contains(v) && footprint.Contains(v))
            .OrderBy(v => v.Name).ToList();

        // 1) the variable is live after the block
        // 2) the variable is modified within the block
        var outVars = containingImplNonGlobals.Where(v =>
            liveVarsAfter.Contains(v) && modifiedVars.Contains(v))
            //.Concat(inVars).Distinct() // add all ins as outputs too
            .OrderBy(v => v.Name).ToList();

        // The inputs of the new implementation
        foreach (var v in inVars)
        {
            // Add v to the list of arguments to the new impl at call site
            callSiteIns.Add(new IdentifierExpr(Token.NoToken, v));

            // Declare a new formal f for the signature of the new impl
            var f = new Formal(Token.NoToken,
                new TypedIdent(Token.NoToken, "in_" + newImplIns.Count, v.TypedIdent.Type), true);

            // Copy inputs to local variables in case they are modified
            var vLocal = new LocalVariable(Token.NoToken,
                new TypedIdent(Token.NoToken, f.Name + "_loc", v.TypedIdent.Type));
            localsForIns.Add(vLocal);
            var vLocalExpr = new IdentifierExpr(Token.NoToken, vLocal);
            var initLhs = new SimpleAssignLhs(Token.NoToken, vLocalExpr);
            var initRhs = new IdentifierExpr(Token.NoToken, f);
            initAssigns.Add(new AssignCmd(Token.NoToken, [ initLhs ], [ initRhs ]));

            // Substitute v with the local version in the body
            substMap.Add(v, vLocalExpr);

            newImplIns.Add(f);
        }

        // The outputs of the new implementation
        foreach (var v in outVars)
        {
            // Add v to the list of outputs of the new impl at call site
            callSiteOuts.Add(new IdentifierExpr(Token.NoToken, v));
            var f = new Formal(Token.NoToken,
                new TypedIdent(Token.NoToken, "out_" + newImplOuts.Count, v.TypedIdent.Type), false);
            var fExpr = new IdentifierExpr(Token.NoToken, f);
            
            // If this variable also appears in the input, it will already be in
            // the subst map. This means we don't need a substitution in the body,
            // but must assign to the new out variable before return.
            if (substMap.TryGetValue(v, out var vLocalExpr))
            {
                var lhs = new SimpleAssignLhs(Token.NoToken, fExpr);
                finalAssigns.Add(new AssignCmd(Token.NoToken, [ lhs ], [ vLocalExpr ]));
            }
            else
            {
                substMap.Add(v, fExpr);
            }

            newImplOuts.Add(f);
        }

        // Create the new procedure and the call command
        var modifiedGlobals = globals.Intersect(modifiedVars);
        var modifiedGlobalExprs = modifiedGlobals.Select(v => new IdentifierExpr(Token.NoToken, v)).ToList();
        var blockProc = new Procedure(Token.NoToken, $"{containingImpl.Name}_outlined_block_{block}",
            typeParams:[], newImplIns, newImplOuts, isPure:false,
            requires:[], modifiedGlobalExprs, ensures:[]);

        var callCmd = new CallCmd(Token.NoToken, blockProc.Name, callSiteIns, callSiteOuts)
        {
            Proc = blockProc
        };

        // Create the new implementation

        var locals = footprint.Where(v => containingImplNonGlobals.Contains(v) && // not a global
                                          !substMap.ContainsKey(v));

        var newLocals = new List<Variable>();

        foreach (var v in locals)
        {
            var newV = new LocalVariable(v.tok, v.TypedIdent);
            newLocals.Add(newV);
            substMap.Add(v, new IdentifierExpr(newV.tok, newV.Name));
        }

        var newImplLocals = newLocals.Concat(localsForIns).ToList(); 

        var subst = Substituter.SubstitutionFromDictionary(
            substMap.ToDictionary(p => p.Key, p => p.Value as Expr));

        var finalBlock = new Block
        (
            Token.NoToken,
            $"{containingImpl.Name}_block_{block}_exit",
            finalAssigns,
            new ReturnCmd(Token.NoToken)
        );

        var newBlock = new Block
        (
            Token.NoToken,
            block.Label,
            Substituter.Apply(subst, block.Cmds),
            new GotoCmd(Token.NoToken, [finalBlock])
        );

        var initBlock = new Block
        (
            Token.NoToken,
            $"{containingImpl.Name}_block_{block}_entry",
            initAssigns,
            new GotoCmd(Token.NoToken, [newBlock])
        );

        var blockImpl = new Implementation(Token.NoToken, blockProc.Name, [],
            newImplIns, newImplOuts, newImplLocals.OrderBy(v => v.Name).ToList(),
            [ initBlock, newBlock, finalBlock ])
        {
            Proc = blockProc
        };

        // Replace block body with call to extracted procedure
        block.Cmds = [ callCmd ];
        containingImpl.StructuredStmts = null; // The structured statements are no longer up-to-date.

        return blockImpl;
    }
}