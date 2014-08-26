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
        public abstract class SuperBlock
        {
            public Block StartBlock, EndBlock;
            public List<Block> AllBlocks;
        }


        internal static void CreateAbstractedTaintProgram(Microsoft.Boogie.Program program, Dictionary<Microsoft.Boogie.Procedure, Dependencies> allDeps, Dictionary<Microsoft.Boogie.Block, Dependencies> blockDeps, Dictionary<Microsoft.Boogie.Procedure, List<Microsoft.Boogie.Block>> taintedBlocks)
        {
            throw new NotImplementedException();
        }
    }
}
