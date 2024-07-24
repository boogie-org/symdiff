using Microsoft.Boogie;
using Microsoft.Boogie.GraphUtil;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;

namespace SymDiffUtils
{
    public class BoogieUtils
    {
        public static CommandLineOptions BoogieOptions;
        public static bool InitializeBoogie(string clo)
        {
            BoogieOptions = new CommandLineOptions(Console.Out, new ConsolePrinter());
            BoogieOptions.RunningBoogieFromCommandLine = true;

            var args = clo.Split(' ');
            BoogieOptions.Parse(args);

            return false;
        }
        //call with null filename to print to console
        public static void PrintProgram(Program p, string filename)
        {
            TokenTextWriter outFile;
            if (filename != null)
                outFile = new TokenTextWriter(filename, true, BoogieOptions);
            else
                outFile = new TokenTextWriter(Console.Out, true, BoogieOptions);
            p.Emit(outFile);
            outFile.Close();
        }

        public static bool ResolveProgram(Program p, string filename, CommandLineOptions boogieOptions)
        {
            //After p.Resolve, the AST is in p.topLevelDeclarations  
            int errorCount = p.Resolve(boogieOptions);
            if (errorCount != 0)
                Console.WriteLine(errorCount + " name resolution errors in " + filename);
            return errorCount != 0;
        }

        public static bool TypecheckProgram(Program p, string filename, CommandLineOptions boogieOptions)
        {
            //One of the sideeffect of p.Typecheck, it inlines 
            int errorCount = p.Typecheck(boogieOptions);
            if (errorCount != 0)
                Console.WriteLine(errorCount + " type checking errors in " + filename);
            return errorCount != 0;
        }

        private static bool ResolveAndTypeCheck(Program p, string filename, CommandLineOptions boogieOptions)
        {
            if (ResolveProgram(p, filename, boogieOptions))
            {
                Log.Out(Log.Error, "Failed to resolve  program");
                return true;
            }
            if (TypecheckProgram(p, filename, boogieOptions))
            {
                Log.Out(Log.Error, "Failed to typecheck program");
                //Log.LogEmit(Log.Normal, p.Emit);
                // PrintProgram(p, "");
                return true;
            }
            return false;
        }

        public static bool ResolveAndTypeCheckThrow(Program p, string filename, CommandLineOptions boogieOptions)
        {
            if (ResolveAndTypeCheck(p, filename, boogieOptions))
                throw new Exception("Program " + filename + " does not resolve/typecheck");
            return false;
        }


        /// <summary>
        /// TODO: Copied from Rootcause, refactor 
        /// </summary>
        public class BoogieInlineUtils
        {
            public static void Inline(Program program)
            {
                //perform inlining on the procedures
                IEnumerable<Declaration> impls = program.TopLevelDeclarations.Where(x => x is Implementation);
                foreach (Implementation impl in impls)
                {
                    impl.OriginalBlocks = impl.Blocks;
                    impl.OriginalLocVars = impl.LocVars;
                }

                foreach (Implementation impl in impls)
                    Inliner.ProcessImplementation(BoogieOptions, program, impl);

            }
            public static bool IsInlinedProc(Procedure procedure)
            {
                return procedure != null && QKeyValue.FindIntAttribute(procedure.Attributes, "inline", -1) != -1;
            }
            /// <summary>
            /// Adds {:inline "recursionDepth"} to all proceudres reachable within "bound" in "callGraph"
            /// from "impl" in "prog"
            /// Excludes impl
            /// InlineAsSpec uses {:inline spec} instead of {:inline bound} which replaces leaves with a call instead of assume false
            /// </summary>
            /// <param name="prog"></param>
            /// <param name="impl"></param>
            /// <param name="bound"></param>
            /// <param name="recursionDepth"></param>
            private static HashSet<Procedure> AddInlineAttributesUptoDepth(
                Program prog, Implementation impl, int bound, int recursionDepth, Graph<Procedure> callGraph)
            {
                Dictionary<int, HashSet<Procedure>> reachableProcs = ReachableImplsWithinBound(impl, bound, callGraph);
                HashSet<Procedure> reachAll = new HashSet<Procedure>();
                reachableProcs.Values.ForEach(x => x.ForEach(y => reachAll.Add(y)));
                reachAll.Remove(impl.Proc);
                reachAll.ForEach(x => x.AddAttribute("inline", Expr.Literal(recursionDepth)));
                return reachAll;
            }
            /// <summary>
            /// All procedures reachable in levels {0,1,..bound}
            /// Includes impl.Proc for level 0
            /// </summary>
            /// <param name="impl"></param>
            /// <param name="bound"></param>
            /// <param name="callGraph"></param>
            /// <returns></returns>
            public static Dictionary<int, HashSet<Procedure>> ReachableImplsWithinBound(Implementation impl, int bound, Graph<Procedure> callGraph)
            {
                Dictionary<int, HashSet<Procedure>> reachableProcs = new Dictionary<int, HashSet<Procedure>>();
                reachableProcs[0] = new HashSet<Procedure>() { impl.Proc };

                for (int i = 1; i < bound; ++i)
                {
                    reachableProcs[i] = new HashSet<Procedure>();
                    reachableProcs[i - 1]
                        .ForEach(p => callGraph.Successors(p)
                            .ForEach(q => reachableProcs[i].Add(q)));
                }
                return reachableProcs;
            }

            /// <summary>
            /// Does not quite work as it recursively inlines everything
            /// </summary>
            /// <param name="prog"></param>
            /// <param name="impl"></param>
            /// <param name="bound"></param>
            /// <param name="recursionDepth"></param>
            /// <param name="callGraph"></param>
            /// <param name="inlineOpt"></param>
            public static void InlineUptoDepth(Program prog, Implementation impl, int bound, int recursionDepth, Graph<Procedure> callGraph, 
                CoreOptions.Inlining inlineOpt)
            {
                BoogieOptions.ProcedureInlining = inlineOpt; //inline and then use spec, no unsoundness
                var inlineProcs = AddInlineAttributesUptoDepth(prog, impl, bound, recursionDepth, callGraph);
                Inline(prog);
                inlineProcs.ForEach(x => { x.Attributes = x.Attributes.Next; }); //remove any inline attributes
            }

        }


        public static Program ParseProgram(string f)
        {
            Program p = new Program();
            try
            {
                //        if (Microsoft.Boogie.Parser.Parse(f, out p) != 0)
                //Boogie API has changed
                List<string> defs = new List<string>();
                if (Parser.Parse(f, defs, out p) != 0)
                {
                    Console.WriteLine("Failed to read " + f);
                    return null;
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
                return null;
            }
            return p;
        }

        /// <summary>
        /// Computes for all procedures in the callgraph the distance from a list of changed procedures.
        /// Changed procedures have distance 0,
        /// </summary>
        /// <param name="callGraph"></param>
        /// <param name="changedProcs"></param>
        /// <returns>A map from procedure name to distance from any changed procedure.</returns>
        public static Dictionary<int, HashSet<string>> FindProcsAtDistance(Graph<Procedure> callGraph, IEnumerable<string> changedProcs)
        {
            Dictionary<string, int> lengths = new Dictionary<string, int>();
            foreach (var proc in callGraph.Nodes)
            {
                lengths.Add(proc.Name, int.MaxValue);
            }

            foreach (var item in callGraph.Nodes.Where(node => changedProcs.Contains(node.Name)))
            {
                TraverseDF(callGraph, item, -1, lengths);
            }
            Dictionary<int, HashSet<string>> procsAtDistance = new Dictionary<int, HashSet<string>>();
            foreach(var item in lengths)
            {
                if (!procsAtDistance.ContainsKey(item.Value))
                    procsAtDistance[item.Value] = new HashSet<string>();
                procsAtDistance[item.Value].Add(item.Key);
            }
            return procsAtDistance;
        }

        private static void TraverseDF(Graph<Procedure> callGraph, Procedure item, int cost, Dictionary<string, int> costs)
        {
            int currentCost = cost + 1;
            if (costs[item.Name] <= currentCost)
            {
                return;
            }
            costs[item.Name] = currentCost;
            foreach (var succ in callGraph.Successors(item))
            {
                TraverseDF(callGraph, succ, currentCost, costs);
            }
            foreach (var pred in callGraph.Predecessors(item))
            {
                TraverseDF(callGraph, pred, currentCost, costs);
            }
        }
    }
}
