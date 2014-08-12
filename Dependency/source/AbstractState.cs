using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Boogie;
using Microsoft.Boogie.GraphUtil;

namespace Dependency
{
    public interface IAbstractState
    {
        bool JoinWith(IAbstractState d);
        IAbstractState Clone();

    }
    public class TaintSet : HashSet<Variable>, IAbstractState
    {
        public TaintSet() : base() { }

        public TaintSet(TaintSet t) : base(t) { }

        public IAbstractState Clone()
        {
            return new TaintSet(this);
        }
        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("{ ");
            foreach (var v in this)
                sb.Append(v + " ");
            sb.Append("}");
            return sb.ToString();
        }

        // returns ( (this |_| ias) > this ) i.e. whether ias had tainted variables that did not exist in this
        public bool JoinWith(IAbstractState ias)
        {
            TaintSet t = (TaintSet)ias;
            bool added = false;
            foreach (var v in t)
            {
                if (!Contains(v))
                {
                    this.Add(v);
                    added = true;
                }
            }
            return added;
        }

        public void Prune(Implementation impl)
        {
            var proc = impl.Proc;
            var result = new TaintSet();
            foreach (var v in this)
            {
                // leave only globals and outputs
                if (v is GlobalVariable || proc.OutParams.Contains(v))
                    result.Add(v);
            }
            Clear();
            JoinWith(result);
        }

        public void FixFormals(Implementation impl)
        {
            var result = new TaintSet();
            foreach (var v in this)
            {
                // fix the dependencies such that instead of the Implementation outputs
                // it will adhere to the Procedure outputs
                if (impl.OutParams.Contains(v))
                    result.Add(Utils.ImplOutputToProcOutput(impl, v));
                else
                    result.Add(v);
            }
            Clear();
            JoinWith(result);
        }
    }
    public class Dependencies : Dictionary<Variable, HashSet<Variable>>, IAbstractState
    {
        public Dependencies() : base() { }

        // this is a deep copy, since we keep sets in the dictionary
        public Dependencies(Dependencies d)
            : base(d)
        {
            d.Keys.Iter(v => this[v] = new HashSet<Variable>(d[v]));
        }

        public IAbstractState Clone()
        {
            return new Dependencies(this);
        }

        public List<Variable> ReadSet()
        {
            HashSet<Variable> result = new HashSet<Variable>();
            Values.Iter(d => result.UnionWith(d));
            return new List<Variable>(result);
        }

        public List<Variable> ModSet()
        {
            return new List<Variable>(Keys.Where(m => this[m].Count > 0));
        }

        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("[\n");
            foreach (var v in Keys)
            {
                sb.Append("  " + v + " <- { ");
                foreach (var d in this[v])
                {
                    sb.Append(d + ", ");
                }
                sb.Append(" }\n");
            }
            sb.Append("]\n");
            return sb.ToString();
        }

        public string ToStringPretty()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("[ \n");
            foreach (var v in Keys)
            {
                int maxLen = 0;
                var vheader = "  " + v + " <- { ";
                sb.Append(vheader);
                if (this[v].Count == 0)
                {
                    sb.Append("}\n");
                    continue;
                }

                string vspaces = new string(' ', vheader.Length);
                foreach (var d in this[v])
                {
                    var dLen = d.ToString().Length;
                    if (d == this[v].Last())
                    {
                        sb.Append(d);
                        maxLen = (dLen > maxLen ? dLen : maxLen);
                        string lastSpaces = new string(' ', maxLen - dLen);
                        sb.Append(lastSpaces + " }\n");
                    }
                    else
                    {
                        sb.Append(d + "\n");
                        maxLen = (dLen > maxLen ? dLen : maxLen);
                        sb.Append(vspaces);
                    }
                }
            }
            sb.Append("]");
            return sb.ToString();
        }

        // returns ( (this |_| ias) > this ) i.e. whether ias has dependencies that did not exists in this
        public bool JoinWith(IAbstractState ias)
        {
            bool added = false;
            Dependencies d = (Dependencies)ias;
            foreach (var v in d.Keys)
            {
                if (!ContainsKey(v))
                {
                    this[v] = new HashSet<Variable>(d[v]);
                }
                else if (!this[v].IsSupersetOf(d[v]))
                {
                    this[v].UnionWith(d[v]);
                }
                else
                {
                    continue;
                }
                added = true;
            }
            return added;
        }

        public override bool Equals(object o)
        {
            Dependencies rhs = o as Dependencies;
            if (rhs == null)
                return false;

            if (rhs.Keys != Keys)
                return false;

            foreach (var d in rhs)
                if (!this[d.Key].SetEquals(d.Value))
                    return false;

            return true;
        }

        public void FixFormals(Implementation impl)
        {
            var result = new Dependencies();
            foreach (var dependency in this)
            {
                var v = dependency.Key;
                // fix the dependencies such that instead of the Implementation inputs\outputs
                // it will adhere to the Procedure inputs\outputs
                if (impl.OutParams.Contains(v))
                {
                    var fv = Utils.ImplOutputToProcOutput(impl, v);
                    if (!result.ContainsKey(fv))
                        result[fv] = new HashSet<Variable>();
                    result[fv].UnionWith(Utils.ImplInputsToProcInputs(impl, dependency.Value));
                }
                else
                {
                    if (!result.ContainsKey(v))
                        result[v] = new HashSet<Variable>();
                    result[v].UnionWith(dependency.Value);
                }
            }
            this.JoinWith(result);
        }

        public void Prune(Implementation impl)
        {
            var proc = impl.Proc;
            var result = new Dependencies();
            foreach (var dependency in this)
            {
                var v = dependency.Key;
                // leave only globals and formal outputs
                if (v is GlobalVariable || proc.OutParams.Contains(v))
                    result.Add(v, Utils.ImplInputsToProcInputs(impl, dependency.Value));
            }
            Clear();
            JoinWith(result);
        }
    }
}
