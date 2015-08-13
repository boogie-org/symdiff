using Microsoft.Boogie;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dependency.source
{
    class DependencyInliner
    {
        private Program program;
        private int InlineDepth;

        public DependencyInliner(Program program, int InlineDepth)
        {
            this.program = program;
            this.InlineDepth = InlineDepth;
        }
        internal Program InlineImplementations()
        {
            throw new NotImplementedException();
        }
    }
}
