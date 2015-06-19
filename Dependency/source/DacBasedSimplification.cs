using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Boogie;
using System.Diagnostics;
using SDiff;

namespace Dependency
{
    class DacBasedSimplification
    {
        private Program program;
        private Program mergedProgram;
        public Dictionary<Procedure, HashSet<Variable>> nonImpactedInputs = new Dictionary<Procedure, HashSet<Variable>>();
        public Dictionary<Procedure, HashSet<Variable>> nonImpactedOutputs = new Dictionary<Procedure, HashSet<Variable>>();
        public Dictionary<Procedure, HashSet<Variable>> nonImpactedSummaries = new Dictionary<Procedure, HashSet<Variable>>();


        public DacBasedSimplification(Program program, Program mergedProgram)
        {
            this.program = program;
            this.mergedProgram = mergedProgram;
        }

        public void Start()
        {
            this.PropagateEqualities();
        }

        public void PropagateEqualities()
        {
            foreach (var msProcedure in this.mergedProgram.Procedures.Where(IsMSProcedure))
            {
                var renamedVersionProcedureName = this.GetVersionProcedureFromMSProcedure(msProcedure, 1);
                var versionPrefix = this.GetPrefix(renamedVersionProcedureName);
                var versionImpl = Util.getImplByName(this.program, this.TrimPrefix(renamedVersionProcedureName, versionPrefix + "."));                
                var versionProcedure = versionImpl.Proc;

                this.nonImpactedInputs.Add(versionProcedure, new HashSet<Variable>());
                this.nonImpactedOutputs.Add(versionProcedure, new HashSet<Variable>());
                this.nonImpactedSummaries.Add(versionProcedure, new HashSet<Variable>());

                #region InputEquivalences
                FindEquivalencesForVariables(msProcedure, versionPrefix, versionImpl.InParams, versionProcedure, IsNotImpactedInput, this.nonImpactedInputs);
                FindEquivalencesForVariables(msProcedure, versionPrefix, versionProcedure.InParams, versionProcedure, IsNotImpactedInput, this.nonImpactedInputs);

                #endregion

                #region OutputEquivalences
                FindEquivalencesForVariables(msProcedure, versionPrefix, versionImpl.OutParams, versionProcedure, IsNotImpactedOutput, this.nonImpactedOutputs);
                FindEquivalencesForVariables(msProcedure, versionPrefix, versionProcedure.OutParams, versionProcedure, IsNotImpactedOutput, this.nonImpactedOutputs);


                if (versionProcedure.Modifies != null)
                {
                    FindEquivalencesForVariables(msProcedure, versionPrefix, versionProcedure.Modifies.Select(x => x.Decl).ToList(), versionProcedure, IsNotImpactedOutput, this.nonImpactedOutputs);
                }
                #endregion

                #region SummaryEquivalences

                FindEquivalencesForVariables(msProcedure, versionPrefix, versionImpl.OutParams, versionProcedure, IsNotImpactedSummary, this.nonImpactedSummaries);
                FindEquivalencesForVariables(msProcedure, versionPrefix, versionProcedure.OutParams, versionProcedure, IsNotImpactedSummary, this.nonImpactedSummaries);


                if (versionProcedure.Modifies != null)
                {
                    FindEquivalencesForVariables(msProcedure, versionPrefix, versionProcedure.Modifies.Select(x => x.Decl).ToList(), versionProcedure, IsNotImpactedSummary, this.nonImpactedSummaries);
                }
                
                #endregion

            }
        }

        private void FindEquivalencesForVariables(Procedure msProcedure, string versionPrefix, List<Variable> vars, Procedure versionProcedure, Func<string, Procedure, bool> fun, Dictionary<Procedure,HashSet<Variable>> nonTainted)
        {
            if (vars == null)
            {
                return;
            }
            foreach (var v in vars)
            {
                if (fun(versionPrefix + "." + v.Name, msProcedure))
                {
                    nonTainted[versionProcedure].Add(v);
                }
            }
        }

        private bool IsNotImpactedSummary(string variable, Procedure msProcedure)
        {
            Debug.Assert(IsMSProcedure(msProcedure));

            foreach (var ens in msProcedure.Ensures)
            {
                string dacAttributeKey;
                QKeyValue dacAttribute;
                if (this.HasMatchingAttribute(ens.Attributes, attr => "inferred".Equals(attr)) && IsMathcingDacAttribute(ens.Attributes, out dacAttributeKey, out dacAttribute))
                {
                    if ("DAC_SUMMARY".Equals(dacAttributeKey) && dacAttribute.Params.Cast<Microsoft.Boogie.IdentifierExpr>().Select(x => x.Name).Contains(variable))
                    {
                        return true;
                    }
                }
            }
            return false;
        }

        private bool IsNotImpactedOutput(string variable, Procedure msProcedure)
        {
            Debug.Assert(IsMSProcedure(msProcedure));
            bool isNotImpacted = false;
            bool fst = false;
            bool snd = false;

            foreach (var ens in msProcedure.Ensures)
            {
                string dacAttributeKey;
                QKeyValue dacAttribute;
                if (this.HasMatchingAttribute(ens.Attributes, attr => "inferred".Equals(attr)) && IsMathcingDacAttribute(ens.Attributes, out dacAttributeKey, out dacAttribute))
                {
                    isNotImpacted = RelationalDacCase(variable, ref fst, ref snd, dacAttributeKey, dacAttribute);
                    if (isNotImpacted)
                    {
                        return true;
                    }
                }
            }
            return isNotImpacted;
        }

        private bool IsNotImpactedInput(string variable, Procedure msProcedure)
        {
            Debug.Assert(IsMSProcedure(msProcedure));
            bool isNotImpacted = false;
            bool fst = false;
            bool snd = false;

            foreach (var req in msProcedure.Requires)
            {
                string dacAttributeKey;
                QKeyValue dacAttribute;
                if (this.HasMatchingAttribute(req.Attributes, attr => "inferred".Equals(attr)) && IsMathcingDacAttribute(req.Attributes, out dacAttributeKey, out dacAttribute))
                {
                    isNotImpacted = RelationalDacCase(variable, ref fst, ref snd, dacAttributeKey, dacAttribute);
                    if (isNotImpacted)
                    {
                        return true;
                    }
                }
            }
            return isNotImpacted;
        }

        private bool RelationalDacCase(string vn, ref bool fst, ref bool snd, string dacAttributeKey, QKeyValue dacAttribute)
        {

            if ("DAC_LE".Equals(dacAttributeKey))
            {
                FindDirectionOfLE(vn, ref fst, ref snd, dacAttribute);
                return fst && snd;
            }
            else if ("DAC_EQ".Equals(dacAttributeKey) && dacAttribute.Params.Cast<Microsoft.Boogie.IdentifierExpr>().Select(x=>x.Name).Contains(vn))
            {
                return true;
            }
            else if ("DAC_IMPLIES".Equals(dacAttributeKey) && dacAttribute.Params.Cast<Microsoft.Boogie.IdentifierExpr>().Select(x => x.Name).Contains(vn))
            {
                return true;
            }

            return false;
        }

        private static void FindDirectionOfLE(string p, ref bool fst, ref bool snd, QKeyValue dacAttribute)
        {
            int indexOfVar = dacAttribute.Params.Select(x => x.ToString()).ToList().IndexOf(p);
            var t = dacAttribute.Params[0].GetType();
            if (indexOfVar == 0)
            {
                fst = true;
            }
            else if (indexOfVar == 1)
            {
                snd = true;
            }
        }

        private bool IsMathcingDacAttribute(QKeyValue attr, out string dacAttribute, out QKeyValue attribute)
        {
            var result = HasMatchingAttribute(attr, s => s.StartsWith("DAC_"), out dacAttribute, out attribute);

            return result;
        }

        private bool HasMatchingAttribute(QKeyValue attr, Func<string, Boolean> matcher)
        {
            string dummy;
            return this.HasMatchingAttribute(attr, matcher, out dummy);
        }

        private bool HasMatchingAttribute(QKeyValue attr, Func<string, Boolean> matcher, out string match)
        {
            QKeyValue dummy;
            return this.HasMatchingAttribute(attr, matcher, out match, out dummy);
        }

        private bool HasMatchingAttribute(QKeyValue attr, Func<string, Boolean> matcher, out string match, out QKeyValue attribute)
        {
            while (attr != null)
            {
                if (matcher(attr.Key))
                {
                    match = attr.Key;
                    attribute = attr;
                    return true;
                }
                attr = attr.Next;
            }
            match = null;
            attribute = null;
            return false;
        }

        private string TrimPrefix(string str, string prefix)
        {
            Debug.Assert(str.StartsWith(prefix));
            return str.Remove(0, prefix.Length);
        }

        private string GetPrefix(string renamedVersionProcedureName)
        {
            var renamedVersionProcedure = Util.getProcedureByName(this.mergedProgram, renamedVersionProcedureName);
            Debug.Assert(renamedVersionProcedure.Attributes != null);
            Debug.Assert(renamedVersionProcedure.Attributes.Key.Equals("prefix"));
            return renamedVersionProcedure.Attributes.Params.ElementAt(0) as string;

        }

        private string GetVersionProcedureFromMSProcedure(Procedure procedure, int i)
        {
            Debug.Assert(IsMSProcedure(procedure));
            return (string)procedure.Attributes.Params[i];
        }

        private Dictionary<string, Procedure> MakeNameToProcedureMapping(IEnumerable<Procedure> procedures)
        {
            return procedures.Select(proc => new { proc.Name, x = proc })
                            .ToDictionary(x => x.Name, x => x.x);
        }

        private bool IsMSProcedure(Procedure node)
        {
            return node.Attributes != null && node.Attributes.Key.Equals("MS_procs");
        }
    }
}
