﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Boogie;

namespace Dependency
{
    public class AbstractNonTaintProgram
    {
        Program program;
        Dictionary<Procedure, Dependencies> allDeps;
        Dictionary<Block, Dependencies> blockDeps;
        Dictionary<Procedure, List<Block>> taintedBlocks;


        public AbstractNonTaintProgram(Program program, Dictionary<Procedure, Dependencies> allDeps, Dictionary<Block, Dependencies> blockDeps, Dictionary<Procedure, List<Block>> taintedBlocks)
        {
            this.program = program;
            this.allDeps = allDeps;
            this.blockDeps = blockDeps;
            this.taintedBlocks = taintedBlocks;

        }

        public void AbstractNonTaintedImplementations()
        {
            var impls = program.TopLevelDeclarations.OfType<Implementation>();
            var taintedImpls =
                impls.Where(x =>
                    allDeps[x.Proc].Values.Any(d => Utils.VariableUtils.IsTainted(d))
                    );
            var nonTaintedImpls = new HashSet<Implementation>();

            if (false)
            {
                //TODO: We get into parsing problems (print_tokens\(source,v2)) when one side is abstracted, and we get
                //different modsets later given the implementation for one and stub for another
                new HashSet<Implementation>(impls.Where(x => !taintedImpls.Contains(x))); //make a copy since topleveldecl changes
                nonTaintedImpls
                    .Iter(x =>
                    {
                        var modset = new VarSet(allDeps[x.Proc].ModSet());
                        Utils.VariableUtils.PruneLocals(x, modset);
                        modset.RemoveWhere(v => x.Proc.OutParams.Contains(v));
                        x.Proc.Modifies = modset.Select(v => IdentifierExpr.Ident(v)).ToList();
                        Utils.DependenciesUtils.AddCalleeDependencySpecs(program, x.Proc, allDeps[x.Proc]);
                    }
                    );
                Console.WriteLine("[Abstract non-taint] Abstracted {0} procedures [{1}]", nonTaintedImpls.Count(),
                    String.Join(",", nonTaintedImpls.Select(x => x.Name)));
            }

            //get the number of tainted outputs (outputs whose summaries are potentially changed)
            var outvars = new List<Variable>();
            var botTaintOutVars = new List<Variable>();
            program.TopLevelDeclarations.OfType<Procedure>().Iter(x =>
            {
                if (!allDeps.ContainsKey(x)) return;
                allDeps[x].Keys.Iter(y => outvars.Add(y));
                var procBottomUpTaintVars = new List<Variable>();
                allDeps[x].Keys.Where(k => allDeps[x][k].Contains(Utils.VariableUtils.BottomUpTaintVar)).Iter(y => procBottomUpTaintVars.Add(y));
                botTaintOutVars.AddRange(procBottomUpTaintVars);
                //new: add an annotation to indicate that none of the variables are bottom up tainted
                var ens = new Ensures(true, (Expr)Expr.True);
                ens.Attributes = new QKeyValue(Token.NoToken, "bottomup_tainted_vars",
                    procBottomUpTaintVars.Select(v => (object)v.Name).ToList(), null);
                x.Ensures.Add(ens);
            });
            Console.WriteLine("#outputs with no bottomuptaint / #outputs (includes stubs) = {0} / {1} ", outvars.Count - botTaintOutVars.Count, outvars.Count);

            //Do the removal after you are done with nonTaintedImpls, otherwise that becomes an empty set
            program.RemoveTopLevelDeclarations(x => nonTaintedImpls.Contains(x));
        }

        private static void CreateNonTaintedSB(Dictionary<Procedure, Dependencies> procDeps, Dictionary<Block, Dependencies> blockDeps)
        {
            // do worklist for creating supergraph

            // getting the dependencies for a superblocks (once it is created)
            SuperBlock superBlock = new SuperBlock();
            //Utils.DependenciesUtils.SuperBlockDependencies(superBlock, blockDeps[superBlock.SuccBlock], procDeps);

            // transform the program
        }
        public class SuperBlock
        {
            public Block StartBlock, SuccBlock;
            public List<Block> AllBlocks;
        }

    }
}
