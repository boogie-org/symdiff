using Microsoft.Boogie;
using Microsoft.Boogie.Houdini;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;

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
}
