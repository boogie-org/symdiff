using Microsoft.Boogie;
using Microsoft.Boogie.Houdini;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using Microsoft.Boogie.GraphUtil;


namespace SymDiffUtils
{
    public class HoudiniInferredFilter : SimplificationVisitor
    {
        public static string HoudiniInferredAttribute = "inferred_houdini";
        public static string HoudiniInferredComment = "Houdini-Inferred DAC Candidate";
        private HashSet<string> trueHoudinis;
        private HashSet<string> falseHoudinis;
        private Houdini houdini;
        public HoudiniInferredFilter(HashSet<string> trueHoudinis, HashSet<string> falseHoudinis, Program p, Houdini h)
            : base(p, HoudiniInferredComment, HoudiniInferredAttribute)
        {
            this.trueHoudinis = trueHoudinis;
            this.falseHoudinis = falseHoudinis;
            this.houdini = h;
        }
        public override Procedure VisitProcedure(Procedure node)
        {
            var ensToAdd = new List<Ensures>();
            var ensToRem = new List<Ensures>();
            var reqToAdd = new List<Requires>();
            var reqToRem = new List<Requires>();

            foreach (var req in node.Requires)
            {
                string candidate;
                if (this.houdini.MatchCandidate(req.Condition, out candidate))
                {
                    if (this.trueHoudinis.Contains(candidate))
                    {
                        this.makeFreeRequires(node, req, reqToAdd, reqToRem);
                    }
                    else
                    {
                        Debug.Assert(this.falseHoudinis.Contains(candidate));
                        reqToRem.Add(req);
                    }

                }
            }
            foreach (var ens in node.Ensures)
            {
                string candidate;
                if (this.houdini.MatchCandidate(ens.Condition, out candidate))
                {
                    if (this.trueHoudinis.Contains(candidate))
                    {
                        this.makeFreeEnsures(node, ens, ensToAdd, ensToRem);
                    }
                    else
                    {
                        Debug.Assert(this.falseHoudinis.Contains(candidate));
                        ensToRem.Add(ens);
                    }

                }
            }

            reqToAdd.ForEach(node.Requires.Add);
            reqToRem.ForEach(x => node.Requires.Remove(x));
            ensToAdd.ForEach(node.Ensures.Add);
            ensToRem.ForEach(x => node.Ensures.Remove(x));
            return base.VisitProcedure(node);
        }
    }

    /// <summary>
    /// Drop a subset of implementations and candidates from a program being fed to Houdini inference
    /// Drop cand_post for dropped impls
    /// </summary>
    public class HoudiniAnalyzeImplSubset: FixedVisitor
    {
        Program prog;
        private IEnumerable<Procedure> procsToAnalyze;
        private Graph<Procedure> callGraph = null;
        List<string> candidateConsts = null;

        public HoudiniAnalyzeImplSubset(Program prog, IEnumerable<Procedure> procs) 
        { 
            this.prog = prog;
            procsToAnalyze = procs;
            callGraph = CallGraphHelper.ComputeCallGraph(prog);
            this.candidateConsts = this.prog.Variables.Where(Item => 
                QKeyValue.FindBoolAttribute(Item.Attributes, "existential")).Select(Item => Item.Name).ToList();
        }

        public override Program VisitProgram(Program node)
        {
            var removedImpls = node.TopLevelDeclarations.OfType<Implementation>()
                .Where(x => !procsToAnalyze.Any(y => y.Name == ((Implementation)x).Name));
            Console.WriteLine("Dropping implementations due to dacConsiderChanged option [{0}]", string.Join(",", removedImpls.Select(x => x.Name)));
            node.RemoveTopLevelDeclarations(x => removedImpls.Contains(x));
            return base.VisitProgram(node);
        }

        public override Procedure VisitProcedure(Procedure node)
        {            
            if (callGraph.Predecessors(node).Any(x => !procsToAnalyze.Contains(x)))
            {
                //has callers outside procsToAnalyze, drop any candidate requires
                string candidate;
                var newRequires = node.Requires.Where(ens => !Houdini.MatchCandidate(ens.Condition, candidateConsts, out candidate)).ToList();
                node.Requires = newRequires;
            }
            if (!procsToAnalyze.Contains(node))
            {
                //outside procsToAnalyze, drop any candidate ensures
                string candidate;
                var newEnsures = node.Ensures.Where(ens => !Houdini.MatchCandidate(ens.Condition, candidateConsts, out candidate)).ToList();
                node.Ensures = newEnsures;
            }
            return base.VisitProcedure(node);
        }
    }
}
