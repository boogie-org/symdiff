using Microsoft.Boogie;
using Microsoft.Boogie.Houdini;
using SDiff;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;

namespace SDiff
{
    class TaintBasedSimplification : StandardVisitor
    {
        private Program program;
        private Dictionary<string, Procedure> procs;
        private IList<string> candidateConsts;
        private const string INFERRED_COMMENT = "Taint-Inferred DAC Candidate";

        public TaintBasedSimplification(Program p)
        {
            this.program = p;
            this.candidateConsts = this.program.Variables.Where(Item =>
                QKeyValue.FindBoolAttribute(Item.Attributes, "existential")).Select(Item => Item.Name).ToList();
            this.procs = this.program.Procedures.Select(proc => new { proc.Name, x = proc }).ToDictionary(x => x.Name, x => x.x);
        }

        public void StartSimplifications()
        {
            this.Visit(this.program);

        }

        public override Procedure VisitProcedure(Procedure node)
        {
            var ensToAdd = new List<Ensures>();
            var ensToRem = new List<Ensures>();
            var reqToAdd = new List<Requires>();
            var reqToRem = new List<Requires>();

            string f1, f2;
            if (node == null || !isMSProcedureWithMapping(node, out f1, out f2))
            {
                return base.VisitProcedure(node);
            }
            HashSet<string> nonTaintedInputs, nonTaintedOutputs, nonTaintedSummaries;
            this.getTaintInfo(this.procs[f1], out nonTaintedInputs, out nonTaintedOutputs, out nonTaintedSummaries);

            foreach (var ens in node.Ensures)
            {

                if (ens.Attributes == null)
                {
                    continue;
                }
                // These are DAC contracts
                if (ens.Attributes.Key.StartsWith("DAC_"))
                {
                    var vn = this.projectProductVarToOriginal(ens.Attributes.Params.First(_ => true).ToString());
                    // If this is a summary ensures
                    if (ens.Attributes.Key.EndsWith("SUMMARY"))
                    {
                        //get the varaible, map it, check if correspoinding summary is not tainted, if so make this free.                        
                        if (nonTaintedSummaries.Contains(vn))
                        {
                            this.filterOutEnsures(node, ens, ensToAdd, ensToRem);
                        }
                    }
                    else
                    {
                        if (nonTaintedOutputs.Contains(vn))
                        {
                            this.filterOutEnsures(node, ens, ensToAdd, ensToRem);
                        }
                    }
                }
            }
            foreach (var req in node.Requires)
            {

                if (req.Attributes == null)
                {
                    continue;
                }
                // These are DAC contracts
                if (req.Attributes.Key.StartsWith("DAC_"))
                {
                    var vn = this.projectProductVarToOriginal(req.Attributes.Params.First(_ => true).ToString());
                    if (nonTaintedInputs.Contains(vn))
                    {
                        this.filterOutRequires(node, req, reqToAdd, reqToRem);
                    }
                }
            }

            reqToAdd.ForEach(node.Requires.Add);
            reqToRem.ForEach(x => node.Requires.Remove(x));
            ensToAdd.ForEach(node.Ensures.Add);
            ensToRem.ForEach(x => node.Ensures.Remove(x));

            return base.VisitProcedure(node);
        }

        private bool isMSProcedureWithMapping(Procedure node, out string f1, out string f2)
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

        private void filterOutRequires(Procedure node, Requires req, List<Requires> reqToAdd, List<Requires> reqToRemove)
        {
            var newReq = new Requires(Token.NoToken, true, removeExistentialImplication(req.Condition), INFERRED_COMMENT);            
            reqToRemove.Add(req);
            reqToAdd.Add(newReq);
        }


        private void filterOutEnsures(Procedure node, Ensures ens, List<Ensures> ensToAdd, List<Ensures> ensToRemove)
        {
            var newEns = new Ensures(Token.NoToken, true, removeExistentialImplication(ens.Condition), INFERRED_COMMENT);
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

        private string projectProductVarToOriginal(string varName)
        {
            return varName.Substring(varName.IndexOf('.') + 1);
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
}
