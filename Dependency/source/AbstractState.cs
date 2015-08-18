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
        bool JoinWith(IAbstractState s);
        IAbstractState Clone();

        void SetTop(Implementation i);
    }
    public class TaintSet : HashSet<Variable>, IAbstractState
    {
        public TaintSet() : base() { }

        public TaintSet(TaintSet t) : base(t) { }

        public IAbstractState Clone()
        {
            return new TaintSet(this);
        }
        public void SetTop(Implementation i) {

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
    }
    
    public class VarSet : HashSet<Variable>
    {
        public VarSet() : base() { }
        public VarSet(IEnumerable<Variable> vs) : base(vs) { }

        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("{ ");
            this.Iter(v => sb.Append(v + ", "));
            sb.Append(" }");
            return sb.ToString();
        }


    }
    
    /*
    public class VarSet : IEnumerable<Variable>
    {
        static public HashSet<HashSet<Variable>> allSets = new HashSet<HashSet<Variable>>();

        private HashSet<Variable> mySet;

        private void AssignTo(HashSet<Variable> vs) {
            var existingSet = allSets.FirstOrDefault(s => s.SetEquals(vs));
            if (existingSet == null)
            {
                existingSet = vs;
                allSets.Add(vs);
            }
            mySet = existingSet;
        }

        public VarSet()
        {
            AssignTo(new HashSet<Variable>());
        }

        public VarSet(IEnumerable<Variable> set)
        {
            HashSet<Variable> vs = new HashSet<Variable>(set);
            AssignTo(vs);
        }

        public VarSet(VarSet vs)
        {
            mySet = vs.mySet;
        }

        IEnumerator<Variable> IEnumerable<Variable>.GetEnumerator()
        {
            return mySet.GetEnumerator();
        }

        System.Collections.IEnumerator System.Collections.IEnumerable.GetEnumerator()
        {
            return mySet.GetEnumerator();
        }

        public bool Add(Variable item)
        {
            HashSet<Variable> newSet = new HashSet<Variable>(mySet);
            bool result = newSet.Add(item);
            AssignTo(newSet);
            return result;
        }


        public bool IsSupersetOf(IEnumerable<Variable> other)
        {
            return mySet.IsSupersetOf(other);
        }


        public bool SetEquals(IEnumerable<Variable> other)
        {
            return mySet.SetEquals(other);
        }

        public void UnionWith(IEnumerable<Variable> other)
        {
            HashSet<Variable> newSet = new HashSet<Variable>(mySet);
            newSet.UnionWith(other);
            AssignTo(newSet);
        }

        public bool Contains(Variable item)
        {
            return mySet.Contains(item);
        }

        public int Count
        {
            get { return mySet.Count; }
        }

        public bool Remove(Variable item)
        {
            HashSet<Variable> newSet = new HashSet<Variable>(mySet);
            bool result = newSet.Remove(item);
            AssignTo(newSet);
            return result;
        }

        public int RemoveWhere(Predicate<Variable> match)
        {
            HashSet<Variable> newSet = new HashSet<Variable>(mySet);
            int result = newSet.RemoveWhere(match);
            AssignTo(newSet);
            return result;
        }

    }
    */
    public class Dependencies : Dictionary<Variable, VarSet>, IAbstractState
    {
        private bool isTop = false;
        public Dependencies() : base() { }

        // this is a deep copy, since we keep sets in the dictionary
        public Dependencies(Dependencies d)
            : base(d)
        {
            d.Keys.Iter(v => this[v] = new VarSet(d[v]));
        }

        public void SetTop(Implementation impl)
        {
            if (isTop)
                return;
            isTop = true;
            //impl.LocVars.Iter(v => { if (this.ContainsKey(v)) this[v] = new VarSet(impl.LocVars); else this[v].UnionWith(impl.LocVars); });
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
            return new List<Variable>(Keys);
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
        public bool JoinWith(IAbstractState state)
        {
            bool added = false;
            Dependencies d = (Dependencies)state;
            foreach (var v in d.Keys)
            {
                if (!ContainsKey(v))
                {
                    this[v] = new VarSet(d[v]);
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

            if (rhs == null || rhs.Keys.Count != Keys.Count || !rhs.Keys.All(v => Keys.Contains(v)))
                return false;

            return rhs.All(d => this[d.Key].SetEquals(d.Value));
        }

        // TODO: replace this with Utils version
        public void FixFormals(Implementation impl)
        {
            var result = new Dependencies();
            foreach (var dependency in this)
            {
                var v = dependency.Key;
                // fix the dependencies such that instead of the Implementation inputs\outputs
                // it will adhere to the Procedure inputs\outputs
                if (impl.OutParams.Contains(v))
                    v = Utils.VariableUtils.ImplOutputToProcOutput(impl, v);
                if (!result.ContainsKey(v))
                    result[v] = dependency.Value;
                result[v].UnionWith(Utils.VariableUtils.ImplInputsToProcInputs(impl, dependency.Value));
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
                if (v is GlobalVariable || impl.OutParams.Contains(v) 
                    /* just to be safe: */|| proc.OutParams.Contains(v))
                    result.Add(v, Utils.VariableUtils.ImplInputsToProcInputs(impl, dependency.Value));
            }
            Clear();
            JoinWith(result);
        }
    }
}
