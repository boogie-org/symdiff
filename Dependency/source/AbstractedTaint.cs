using System;
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
            var nonTaintedImpls = new HashSet<Implementation>(impls.Where(x => !taintedImpls.Contains(x))); //make a copy since topleveldecl changes
            //TODO: add to the mod set of proc since we remove the impl
            nonTaintedImpls
                .Iter(x =>
                    {
                        var modset = new HashSet<Variable>(allDeps[x.Proc].ModSet());
                        Utils.VariableUtils.PruneLocals(x, modset);
                        modset.RemoveWhere(v => x.Proc.OutParams.Contains(v));
                        x.Proc.Modifies = modset.Select(v => IdentifierExpr.Ident(v)).ToList();
                        //TODO: add free ensures to say that each output is function of input (same as refinedependency!!!)
                       Utils.DependenciesUtils.AddCalleeDependencySpecs(program, x.Proc, allDeps[x.Proc]);
                    }
                );
            Console.WriteLine("[Abstract non-taint] Abstracted {0} procedures [{1}]", nonTaintedImpls.Count(),
                String.Join(",", nonTaintedImpls.Select(x => x.Name)));

            //get the number of tainted outputs (outputs whose summaries are potentially changed)
            var outvars = new List<Variable>();
            var botTaintOutVars = new List<Variable>();
            program.TopLevelDeclarations.OfType<Procedure>().Iter(x =>
            {
                if (!allDeps.ContainsKey(x)) return;
                allDeps[x].Keys.Iter(y => outvars.Add(y));
                allDeps[x].Keys.Where(k => allDeps[x][k].Contains(Utils.VariableUtils.BottomUpTaintVar)).Iter(y => botTaintOutVars.Add(y));
            });
            Console.WriteLine("#outputs with no bottomuptaint / #outputs (includes stubs) = {0} / {1} ", outvars.Count - botTaintOutVars.Count, outvars.Count);

            //Do the removal after you are done with nonTaintedImpls, otherwise that becomes an empty set
            program.TopLevelDeclarations
                .RemoveAll(x => nonTaintedImpls.Contains(x));
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
