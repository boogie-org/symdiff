using Microsoft.Boogie;
using Microsoft.Boogie.Houdini;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;

namespace SymDiffUtils
{
    public class TaintBasedSimplification : SimplificationVisitor 
    {
        public static string TaintInferredAttribute = "inferred_taint";
        public static string TaintInferredComment = "Taint-Inferred DAC Candidate";
        public TaintBasedSimplification(Program p)
            : base(p, TaintInferredComment, TaintInferredAttribute)
        {            
            this.program = p;
            this.candidateConsts = this.program.Variables.Where(Item =>
                QKeyValue.FindBoolAttribute(Item.Attributes, "existential")).Select(Item => Item.Name).ToList();
            this.procs = this.program.Procedures.Select(proc => new { proc.Name, x = proc }).ToDictionary(x => x.Name, x => x.x);            
        }

        public override Implementation VisitImplementation(Implementation node)
        {
            //TODO(t-algy): This gets called twice because it gets invoked when the visitor visits an implementation. Fix.
            if (this.visited.Contains(node.Proc))
            {
                return base.VisitImplementation(node);
            }
            this.visited.Add(node.Proc);

            var ensToAdd = new List<Ensures>();
            var ensToRem = new List<Ensures>();
            var reqToAdd = new List<Requires>();
            var reqToRem = new List<Requires>();

            string f1, f2;
            if (node == null || !isMSProcedureWithMapping(node.Proc, out f1, out f2))
            {
                return base.VisitImplementation(node);
            }
            HashSet<string> nonTaintedInputs, nonTaintedOutputs, nonTaintedSummaries;
            this.getTaintInfo(this.procs[f1], out nonTaintedInputs, out nonTaintedOutputs, out nonTaintedSummaries);

            foreach (var ens in node.Proc.Ensures)
            {

                if (ens.Attributes == null)
                {
                    continue;
                }
                // These are DAC contracts
                if (ens.Attributes.Key.StartsWith("DAC_"))
                {
                    var vn = this.projectProductVarToOriginal(ens.Attributes.Params.First().ToString());
                    // If this is a summary ensures
                    if (ens.Attributes.Key.Equals("DAC_SUMMARY"))
                    {
                        //get the varaible, map it, check if correspoinding summary is not tainted, if so make this free.                        
                        if (nonTaintedSummaries.Contains(vn))
                        {
                            this.makeFreeEnsures(node.Proc, ens, ensToAdd, ensToRem);
                        }
                    }
                    else if (ens.Attributes.Key.Equals("DAC_EQ") || ens.Attributes.Key.Equals("DAC_LE") || ens.Attributes.Key.Equals("DAC_IMPLIES"))
                    {
                        if (nonTaintedOutputs.Contains(vn))
                        {
                            this.makeFreeEnsures(node.Proc, ens, ensToAdd, ensToRem);
                        }
                    }
                }
            }
            foreach (var req in node.Proc.Requires)
            {

                if (req.Attributes == null)
                {
                    continue;
                }
                // These are DAC contracts
                if (req.Attributes.Key.Equals("DAC_EQ") || req.Attributes.Key.Equals("DAC_LE") || req.Attributes.Key.Equals("DAC_IMPLIES"))
                {
                    var vn = this.projectProductVarToOriginal(req.Attributes.Params.First(_ => true).ToString());
                    if (nonTaintedInputs.Contains(vn))
                    {
                        this.makeFreeRequires(node.Proc, req, reqToAdd, reqToRem);
                    }
                }
            }

            reqToAdd.ForEach(node.Proc.Requires.Add);
            reqToRem.ForEach(x => node.Proc.Requires.Remove(x));
            ensToAdd.ForEach(node.Proc.Ensures.Add);
            ensToRem.ForEach(x => node.Proc.Ensures.Remove(x));

            return base.VisitImplementation(node);
        }

        public void getTaintInfo(Procedure node, out HashSet<string> nonTaintedInputs,
            out HashSet<string> nonTaintedOutputs, out HashSet<string> nonTaintedSummaries)
        {
            nonTaintedInputs = new HashSet<string>();
            nonTaintedOutputs = new HashSet<string>();
            nonTaintedSummaries = new HashSet<string>();
            foreach (var ens in node.Ensures)
            {
                if (ens.Attributes == null)
                {
                    continue;
                }
                else if (ens.Attributes.Key.Equals("out_ntainted"))
                {
                    nonTaintedOutputs = new HashSet<string>(ens.Attributes.Params.Cast<string>());
                }
                else if (ens.Attributes.Key.Equals("summ_ntainted"))
                {
                    nonTaintedSummaries = new HashSet<string>(ens.Attributes.Params.Cast<string>());
                }
            }

            foreach (var req in node.Requires)
            {
                if (req.Attributes == null)
                {
                    continue;
                }
                if (req.Attributes.Key.Equals("in_ntainted"))
                {
                    nonTaintedInputs = new HashSet<string>(req.Attributes.Params.Cast<string>());
                }
            }
        }
    }

    public abstract class SimplificationVisitor : StandardVisitor
    {
        protected Program program;
        protected Dictionary<string, Procedure> procs;
        protected IList<string> candidateConsts;
        protected HashSet<Procedure> visited = new HashSet<Procedure>();
        private string SIMPLIFICATION_COMMENT;
        private string FILTERING_REASON;
        public SimplificationVisitor(Program p, string comment, string filteringReason)
        {
            this.program = p;
            this.candidateConsts = this.program.Variables.Where(Item =>
                QKeyValue.FindBoolAttribute(Item.Attributes, "existential")).Select(Item => Item.Name).ToList();
            this.procs = this.program.Procedures.Select(proc => new { proc.Name, x = proc }).ToDictionary(x => x.Name, x => x.x);
            this.SIMPLIFICATION_COMMENT = comment;
            this.FILTERING_REASON = filteringReason;
        }

        public void StartSimplifications()
        {
            this.Visit(this.program);
        }

        protected bool isMSProcedureWithMapping(Procedure node, out string f1, out string f2)
        {
            f1 = f2 = null;
            if (node.Attributes == null)
                return false;
            if (node.Attributes.Key.Equals("MS_procs"))
            {
                f1 = (string)node.Attributes.Params.ElementAt(0);
                f2 = (string)node.Attributes.Params.ElementAt(1);
                return true;
            }
            return false;
        }

        protected void makeFreeRequires(Procedure node, Requires req, List<Requires> reqToAdd, List<Requires> reqToRemove)
        {
            if (req.Attributes == null)
            {
                return;
            }
            var attribute = new QKeyValue(Token.NoToken, req.Attributes.Key, new List<object>(req.Attributes.Params), 
                            new QKeyValue(Token.NoToken, this.FILTERING_REASON, new List<object>(), null));
            var newReq = new Requires(Token.NoToken, true, removeExistentialImplication(req.Condition), SIMPLIFICATION_COMMENT, attribute );            
            reqToRemove.Add(req);
            reqToAdd.Add(newReq);
        }

        protected void makeFreeEnsures(Procedure node, Ensures ens, List<Ensures> ensToAdd, List<Ensures> ensToRemove)
        {
            if (ens.Attributes == null)
            {
                return;
            }
            var attribute = new QKeyValue(Token.NoToken, ens.Attributes.Key, new List<object>(ens.Attributes.Params),
                            new QKeyValue(Token.NoToken, this.FILTERING_REASON, new List<object>(), null));
            var newEns = new Ensures(Token.NoToken, true, removeExistentialImplication(ens.Condition), SIMPLIFICATION_COMMENT, attribute);
            ensToRemove.Add(ens);
            ensToAdd.Add(newEns);
        }

        private Expr removeExistentialImplication(Expr expr)
        {
            string match;
            bool result = Houdini.GetCandidateWithoutConstant(expr, this.candidateConsts, out match, out expr);
            Debug.Assert(result);
            return expr;
        }

        protected string projectProductVarToOriginal(string varName)
        {
            return varName.Substring(varName.IndexOf('.') + 1);
        }
    }
}
