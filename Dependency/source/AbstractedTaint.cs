using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Boogie;

namespace Dependency
{
    public class AbstractedTaint
    {
        public class SuperBlock
        {
            public Block StartBlock, SuccBlock;
            public List<Block> AllBlocks;
        }

        public static void CreateAbstractedTaintProgram(Program program, Dictionary<Procedure, Dependencies> procDeps, Dictionary<Block, Dependencies> blockDeps, Dictionary<Procedure, List<Block>> taintedBlocks)
        {
            throw new NotImplementedException();

            // do worklist for creating supergraph

            // getting the dependencies for a superblocks (once it is created)
            SuperBlock superBlock = new SuperBlock();
            Utils.DependenciesUtils.SuperBlockDependencies(superBlock, blockDeps[superBlock.SuccBlock], procDeps);
            
            // transform the program
        }
    }
}
