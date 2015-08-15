using Microsoft.Boogie;
using Microsoft.Boogie.GraphUtil;
using SymDiffUtils;
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
        private Graph<Procedure> callGraph;

        public DependencyInliner(Program program, int InlineDepth)
        {
            this.program = program;
            this.InlineDepth = InlineDepth;

            this.callGraph = CallGraphHelper.ComputeCallGraph(program);
        }
        internal void InlineImplementations()
        {
            program.TopLevelDeclarations.OfType<Implementation>()
                .Iter(impl => 
                    SymDiffUtils.BoogieUtils.BoogieInlineUtils.InlineUptoDepth(program, impl, InlineDepth, 
                    1, callGraph, CommandLineOptions.Inlining.Spec));
            BoogieUtils.ResolveAndTypeCheckThrow(program, null);
            return;
        }
    }
}
