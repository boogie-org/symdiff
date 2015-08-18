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
        private Graph<Implementation> callGraph;

        public DependencyInliner(Program program, int InlineDepth)
        {
            this.program = program;
            this.InlineDepth = InlineDepth;

            this.callGraph = Program.BuildCallGraph(program);
        }
        internal void InlineImplementations()
        {
            var oldInlineDepth = CommandLineOptions.Clo.InlineDepth;
            CommandLineOptions.Clo.InlineDepth = InlineDepth;
            Inline();
            CommandLineOptions.Clo.InlineDepth = oldInlineDepth;
            return;
        }

        protected void Inline()
        {
            //Copied from Boogie\Houdini.cs

            if (CommandLineOptions.Clo.InlineDepth <= 0)
                return;

            //foreach (Implementation impl in callGraph.Nodes)
            //{
            //    InlineEnsuresVisitor inlineEnsuresVisitor = new InlineEnsuresVisitor();
            //    inlineEnsuresVisitor.Visit(impl);
            //}

            foreach (Implementation impl in callGraph.Nodes)
            {
                impl.OriginalBlocks = impl.Blocks;
                impl.OriginalLocVars = impl.LocVars;
            }
            foreach (Implementation impl in callGraph.Nodes)
            {
                CommandLineOptions.Inlining savedOption = CommandLineOptions.Clo.ProcedureInlining;
                CommandLineOptions.Clo.ProcedureInlining = CommandLineOptions.Inlining.Spec;
                Inliner.ProcessImplementationForHoudini(program, impl);
                CommandLineOptions.Clo.ProcedureInlining = savedOption;
            }
            foreach (Implementation impl in callGraph.Nodes)
            {
                impl.OriginalBlocks = null;
                impl.OriginalLocVars = null;
            }

            Graph<Implementation> oldCallGraph = callGraph;
            callGraph = new Graph<Implementation>();
            foreach (Implementation impl in oldCallGraph.Nodes)
            {
                callGraph.AddSource(impl);
            }
            foreach (Tuple<Implementation, Implementation> edge in oldCallGraph.Edges)
            {
                callGraph.AddEdge(edge.Item1, edge.Item2);
            }
            int count = CommandLineOptions.Clo.InlineDepth;
            while (count > 0)
            {
                foreach (Implementation impl in oldCallGraph.Nodes)
                {
                    List<Implementation> newNodes = new List<Implementation>();
                    foreach (Implementation succ in callGraph.Successors(impl))
                    {
                        newNodes.AddRange(oldCallGraph.Successors(succ));
                    }
                    foreach (Implementation newNode in newNodes)
                    {
                        callGraph.AddEdge(impl, newNode);
                    }
                }
                count--;
            }
        }


    }
}
