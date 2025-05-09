using System;
using System.Collections.Generic;
//using PureCollections;
using Microsoft.Boogie;
using Microsoft.BaseTypes; //for BigNums
using BType = Microsoft.Boogie.Type;
using System.IO;
using System.Text;
using System.Linq;
using System.Diagnostics;
using System.Threading;
using Microsoft.Boogie.VCExprAST;
using VC;
using SymDiffUtils;
using Microsoft.Boogie.GraphUtil;
using VCGeneration;
using VCGeneration.Transformations;


/* Misc code that should be in  */

/* TODO: organize */

namespace SymDiffUtils
{
    public interface IEmittable
    {
        void Emit(TokenTextWriter t);
    }

    public static class UniqueNumber
    {
        private static int i = 0;
        public static int Get() { return i++; }
        public static string GetName(string basename) { return basename + Get(); }
    }

    public static class ArrayExt
    {
        public static T2[] Map<T1, T2>(this T1[] a, Converter<T1, T2> f)
        {
            T2[] b = new T2[a.Length];
            int i = 0;
            foreach (T1 t in a)
                b[i++] = f(t);
            return b;
        }
        public static T[] Concat<T>(this T[] a, T[] b)
        {
            T[] c = new T[a.Length + b.Length];
            a.CopyTo(c, 0);
            b.CopyTo(c, a.Length);
            return c;
        }
        public static void InitNull<T>(this T[] a) where T : class
        {
            for (int i = 0; i < a.Length; i++)
                a[i] = null;
        }
        //stuff the array with b
        public static T[] Stuff<T>(this T[] a, T b)
        {
            for (int i = 0; i < a.Length; i++)
                a[i] = b;
            return a;
        }
        public static List<T> ToList<T>(this T[] a)
        {
            var l = new List<T>();
            foreach (var v in a)
                l.Add(v);
            return l;
        }
        public static List<Expr> ToExprSeq(this Expr[] a)
        {
            var s = new List<Expr>();
            foreach (Expr e in a)
                s.Add(e);
            return s;
        }
    }

    public static class DictionaryExt
    {
        public static List<T2> ValuesToList<T1, T2>(this Dictionary<T1, T2> dict)
        {
            List<T2> values = new List<T2>(dict.Count);
            foreach (var keyvs in dict)
                values.Add(keyvs.Value);
            return values;
        }
        public static List<T1> KeysToList<T1, T2>(this Dictionary<T1, T2> dict)
        {
            List<T1> keys = new List<T1>(dict.Count);
            foreach (var keyvs in dict)
                keys.Add(keyvs.Key);
            return keys;
        }
        public static List<T> FilterList<T>(this ICollection<T> c, Predicate<T> f)
        {
            var l = new List<T>();
            foreach (var t in c)
                if (f(t))
                    l.Add(t);
            return l;
        }
        public static T2 Get<T1, T2>(this Dictionary<T1, T2> d, T1 key)
        {
            T2 val;
            d.TryGetValue(key, out val);
            return val;
        }
        public static void Replace<T1, T2>(this Dictionary<T1, T2> d, T1 key, T2 newVal)
        {
            if (d.ContainsKey(key))
                d.Remove(key);
            d.Add(key, newVal);
        }
    }

    public static class ListExt
    {
        public static void Iterate<T>(this List<T> l, Action<T> f)
        {
            foreach (T t in l) { f(t); }
        }
        public static List<T> Filter<T>(this List<T> l, Predicate<T> p)
        {
            List<T> o = new List<T>(l.Count);
            foreach (T t in l) { if (p(t)) o.Add(t); }
            return o;
        }
        public static List<T2> Map<T1, T2>(this List<T1> l, Converter<T1, T2> f)
        {
            List<T2> o = new List<T2>(l.Count);
            foreach (T1 t in l) { o.Add(f(t)); }
            return o;
        }
        public static List<Variable> MapToVariableSeq(this List<Variable> l, Converter<Variable, Variable> f)
        {
            var vs = new List<Variable>();
            foreach (var v in l)
                vs.Add(f(v));
            return vs;
        }
        public static HDuple<List<T>> Partition<T>(this List<T> l, Predicate<T> p)
        {
            var y = new List<T>();
            var n = new List<T>();
            foreach (T t in l)
                if (p(t))
                    y.Add(t);
                else
                    n.Add(t);
            return new HDuple<List<T>>(y, n);
        }
        public static List<Variable> ToVariableSeq(this IEnumerable<Variable> l)
        {
            if (l == null)
                return null;
            var vs = new List<Variable>();
            foreach (var v in l)
                vs.Add(v);
            return vs;
        }
        public static List<Variable> ToVariableSeq(this List<Variable> l)
        {
            var vs = new List<Variable>();
            foreach (var v in l)
                vs.Add(v);
            return vs;
        }
        public static List<Expr> ToExprSeq(this List<Expr> l)
        {
            var es = new List<Expr>();
            foreach (var e in l)
                es.Add(e);
            return es;
        }
        public static List<T> Append<T>(this List<T> l1, List<T> l2)
        {
            var lt = new List<T>(l1);
            lt.AddRange(l2);
            return lt;
        }
        public static List<T> Maybe<T>(this List<T> l)
        {
            l.RemoveAll(x => x == null);
            return l;
        }
        public static List<T> Uniquify<T>(this List<T> l)
        {
            var set = new HashSet<T>(l);
            var nl = new List<T>();
            foreach (var v in set)
                nl.Add(v);
            return nl;
        }
        
        /// <summary>
        /// Zips the two lists, but the list with the fewer items decides the
        /// length of the new list (like the `zip` in Python).
        /// </summary>
        public static List<(T1, T2)> ZipShortest<T1, T2>(this List<T1> list1, List<T2> list2)
        {
            var minLength = Math.Min(list1.Count, list2.Count);
            return Enumerable.Range(0, minLength)
                .Select(i => (list1[i], list2[i]))
                .ToList();
        }
    }

    public class Triple<T1, T2, T3> : Duple<T1, T2>
    {
        public Triple(T1 fst, T2 snd, T3 thd)
            : base(fst, snd)
        {
            this.thd = thd;
        }
        public T3 thd { get; private set; }
    }

    public class Duple<T1, T2>
    {
        public Duple(T1 fst, T2 snd)
        {
            this.fst = fst;
            this.snd = snd;
        }
        public T1 fst { get; private set; }
        public T2 snd { get; private set; }
        public static bool EqFst(Duple<T1, T2> d1, Duple<T1, T2> d2)
        {
            return d1.fst.Equals(d2.fst);
        }
        public static bool EqSnd(Duple<T1, T2> d1, Duple<T1, T2> d2)
        {
            return d1.snd.Equals(d2.snd);
        }
        public override bool Equals(object obj)
        {
            var d = obj as Duple<T1, T2>;
            if (d == null)
                return false;
            return this.fst.Equals(d.fst) && this.snd.Equals(d.snd);
        }
        //this is apparently how python hashes tuples
        public override int GetHashCode()
        {
            int value = 0x345678;
            value = 1000003 * value ^ fst.GetHashCode();
            value = 1000003 * value ^ snd.GetHashCode();
            value = value ^ 2;
            return value;
        }
        public override string ToString()
        {
            return "(" + fst + ", " + snd + ")";
        }
    }

    //homogeneous tuples
    public class HDuple<T1> : Duple<T1, T1>
    {
        public HDuple(T1 fst, T1 snd) : base(fst, snd) { }
        public static HDuple<T1> OfArray(T1[] a)
        {
            if (a.Length < 2) return null; //avoid the exception (fires during debugging)
            try
            {
                return new HDuple<T1>(a[0], a[1]);
            }
            catch
            {
                return null;
            }
        }
    }

    public class HTriple<T1> : Triple<T1, T1, T1>
    {
        public HTriple(T1 fst, T1 snd, T1 thd) : base(fst, snd, thd) { }
        public static HTriple<T1> OfArray(T1[] a)
        {
            try
            {
                return new HTriple<T1>(a[0], a[1], a[2]);
            }
            catch
            {
                return null;
            }
        }
    }

    //misc functions
    public static class Util
    {
        public static T Ite<T>(bool cond, T a, T b)
        {
            if (cond)
                return a;
            else
                return b;
        }

        //printing stuff
        public static string BufEmit(Log.Emitter emitter)
        {
            var sb = new System.Text.StringBuilder();
            var tw = new System.IO.StringWriter(sb);
            var tt = new TokenTextWriter(tw, true, BoogieUtils.BoogieOptions);
            emitter(tt);
            tt.Close();
            return sb.ToString();
        }

        //Type changes for Sequences as its hard to do map on them
        public static List<Expr> VarSeqToOldExprSeq(List<Variable> G1)
        {
            var oldSeq = new List<Expr>();
            foreach (Variable v in G1)
                oldSeq.Add(new OldExpr(new Token(), Expr.Ident(v/*p1prefix+"."+v.Name, v.TypedIdent.Type*/)));
            return oldSeq;
        }
        public static List<Expr> VarSeqToExprSeq(List<Variable> inp)
        {
            var retval = new List<Expr>();
            foreach (Variable var in inp)
            {
                retval.Add(Expr.Ident(var));
            }
            return retval;
        }
        public static List<IdentifierExpr> VarSeqToIdentExprSeq(List<Variable> inp)
        {
            var ret = new List<IdentifierExpr>();
            foreach (Variable v in inp) ret.Add(Expr.Ident(v));
            return ret;
        }
        public static List<Variable> VarSeqToVarList(List<Variable> inp)
        {
            var l = new List<Variable>();
            foreach (Variable i in inp) l.Add(i);
            return l;
        }
        public  static List<IdentifierExpr> IdentSeqToIdentList(List<IdentifierExpr> inp)
        {
            var l = new List<IdentifierExpr>();
            foreach (IdentifierExpr i in inp) l.Add(i);
            return l;
        }
        public static List<Variable> IdentSeqToVarSeq(List<IdentifierExpr> inp)
        {
            var l = new List<Variable>();
            foreach (IdentifierExpr i in inp) l.Add(i.Decl);
            return l;
        }


        //statements abbrev
        public static AssignCmd MkAssignCmdIdentSeq(List<IdentifierExpr> lhs, List<IdentifierExpr> rhs)
        {
            if (lhs.Count == 0) return null;
            var rhsL = new List<Expr>();
            var lhsL = new List<IdentifierExpr>();
            foreach (IdentifierExpr r in rhs) rhsL.Add(r);
            foreach (IdentifierExpr l in lhs) lhsL.Add(l);
            return new AssignCmd(Token.NoToken,
                  lhsL.Map(x => new SimpleAssignLhs(Token.NoToken, x)).Map(x => x as AssignLhs),
                  rhsL);
        }
        public static AssignCmd MkAssignCmdIdentSeq(List<Variable> lhs, List<IdentifierExpr> rhs)
        {
            if (lhs.Count == 0) return null;
            var rhsL = new List<Expr>();
            foreach (IdentifierExpr r in rhs) rhsL.Add(r);
            return new AssignCmd(Token.NoToken,
                  lhs.Map(x => new SimpleAssignLhs(Token.NoToken, Expr.Ident(x))).Map(x => x as AssignLhs),
                  rhsL);
        }
        public static AssignCmd MkAssignCmdExprSeq(List<Variable> lhs, List<Expr> rhs)
        {
            if (lhs.Count == 0) return null;
            var rhsL = new List<Expr>();
            foreach (Expr r in rhs) rhsL.Add(r);
            return new AssignCmd(Token.NoToken,
                  lhs.Map(x => new SimpleAssignLhs(Token.NoToken, Expr.Ident(x))).Map(x => x as AssignLhs),
                  rhsL);
        }

        public static void PartitionVarListByIndex(List<Variable> in1, int p, out List<Variable> in1_g, out List<Variable> in1_p)
        {
            in1_g = new List<Variable>();
            in1_p = new List<Variable>();
            for (int i = 0; i < p; ++i) in1_p.Add(in1[i]);
            for (int i = p; i < in1.Count; ++i) in1_g.Add(in1[i]);
        }

        //string stuff
        public static string TrimStart(string s, string prefix)
        {
            return s.Substring(prefix.Length);
        }
        public static string TrimPrefixWithDot(string s, string prefix)
        {
            return TrimStart(s, prefix + ".");
        }

        //printing stuff
        public static void DumpBplAST(Program p, string filename)
        {
            var executionEngine = ExecutionEngine.CreateWithoutSharedCache(BoogieUtils.BoogieOptions);
            executionEngine.PrintBplFile(filename, p, true);
            executionEngine.Dispose();
        }
        public static void PrintError(string fname)
        {
            Console.WriteLine(fname);
            Console.Error.WriteLine(fname);
        }

        //querying and transforming ASTs
        public static List<string> getCalleesList(List<Declaration> procImp)
        {
            List<string> calleesList = new List<string>();
            foreach (Implementation imp in procImp)
            {
                foreach (Block b in imp.Blocks)
                {
                    foreach (Object sq in b.Cmds)
                    {
                        if (sq is CallCmd)
                        {
                            CallCmd ccmd = (CallCmd)sq;
                            calleesList.Add(ccmd.Proc.Name);
                        }
                    }
                }
            }
            return calleesList;
        }
        public static Procedure getProcedureByName(Program P, string name)
        {
            foreach (Procedure proc in P.TopLevelDeclarations.Where(x => x is Procedure))
                if (proc.Name == name)
                    return proc;
            return null;
        }
        public static Implementation getImplByName(Program P, string name)
        {
            return (Implementation)P.TopLevelDeclarations.FirstOrDefault(x => (x is Implementation && ((Implementation)x).Name == name));
        }
        public static Procedure getFuncByName(List<Declaration> list, string name)
        {
            var procs = list.Filter(x => x is Procedure);
            foreach (Procedure d in procs)
                if (d.tok.val == name)
                    return d;
            return null;
        }

        public static Function getFunctionByName(Program p, string name)
        {
            return (Function)p.TopLevelDeclarations.FirstOrDefault(x => x is Function && ((Function)x).Name == name);
        }

        public static Declaration getDeclarationByName(string declarationName, IEnumerable<Declaration> prodDeclOrImplList)
        {
            Declaration decl = null;
            Procedure procDecl = null;
            Implementation procImpl = null;
            Constant constt = null;
            string currentDeclName = null;

            foreach (Declaration currentProc in prodDeclOrImplList)
            {
                if (currentProc is Procedure)
                {
                    procDecl = (Procedure)currentProc;
                    currentDeclName = procDecl.Name;
                }
                else if (currentProc is Implementation)
                {
                    procImpl = (Implementation)currentProc;
                    currentDeclName = procImpl.Name;
                }

                else if (currentProc is Constant)
                {
                    constt = (Constant)currentProc;
                    currentDeclName = constt.Name;
                }

                if (currentDeclName.Equals(declarationName))
                {
                    decl = currentProc;
                }
            }
            return decl;
        }

        public static Variable getVariableByName(string name, IEnumerable<Variable> varList)
        {
            var v = varList.Where(x => x.Name == name);
            if (v.Count() == 0) throw new Exception(string.Format("Variable named {0} not found in the program", name));
            return v.FirstOrDefault();
        }
        public  static Boolean hasConst(string constName, List<Declaration> consts)
        {
            Boolean has = false;
            foreach (Constant const1 in consts)
            {
                if (const1.Name.Equals(constName) &&
                    Util.IsModelConst(const1)
                    /*(const1.Attributes != null) && (const1.Attributes.Key.ToString().Equals("model_const"))*/)
                {
                    has = true;
                }
            }
            return has;
        }
        public static Boolean IsInlinedProc(Procedure p)
        {
            for (var kv = p.Attributes; kv != null; kv = kv.Next)
                if (kv.Key.ToString().Equals("inline"))
                    return true;
            return false;
            //return (p.Attributes != null && p.Attributes.Key.ToString().Contains("inline"));
        }
        public static QKeyValue MkInlinedAttribute(List<Object> attList)
        {
            return new QKeyValue(Token.NoToken, "inline", attList, null);
        }
        public static void MakeContractsFree(Program Prog)
        {
            var Procs = Prog.TopLevelDeclarations.Where(x => x is Procedure);
            foreach (Procedure Proc in Procs)
            {
                var TempRequiresSeq = new List<Requires>();
                var TempEnsuresSeq = new List<Ensures>();
                foreach (Requires req in Proc.Requires)
                {
                    var req1 = new Requires(true, req.Condition);
                    req1.Attributes = req.Attributes;
                    TempRequiresSeq.Add(req1);
                }
                Proc.Requires = TempRequiresSeq;
                foreach (Ensures ens in Proc.Ensures)
                {
                    var ens1 = new Ensures(true, ens.Condition);
                    ens1.Attributes = ens.Attributes;
                    TempEnsuresSeq.Add(ens1);
                }
                Proc.Ensures = TempEnsuresSeq;
            }

            //for any implementation i, if the procedure has a requires, make it an assume
            //in the body [8/5/13]
            foreach (Implementation i in Prog.TopLevelDeclarations.Where(x => x is Implementation))
            {
                if (i.Proc.Requires.Count == 0) continue;
                var reqAssume = new AssumeCmd(Token.NoToken,
                    i.Proc.Requires.Aggregate(Expr.True, (Expr x, Requires y) => Expr.And(x, y.Condition)));
                i.Blocks[0].Cmds = (new List<Cmd>() { reqAssume }).Concat(i.Blocks[0].Cmds).ToList();
            }

        }
        public static int FindStartNum(Program Prog)
        {
            int retval = 0;
            IEnumerable<Declaration> Consts = Prog.TopLevelDeclarations.Where(x => x is Constant);
            foreach (Constant Const in Consts)
            {
                string name = Const.Name;
                if (name.Contains("__ctobpl_const_"))
                {
                    string[] nameParts = name.Split('_');
                    int temp = Convert.ToInt32(nameParts[nameParts.Length - 1]);
                    if (temp > retval)
                        retval = temp;
                }
            }
            return retval + 1;
        }
        public static bool IsBakedProcedure(Procedure proc)
        {
            var name = proc.Name;
            if (name.Contains("HAVOC") ||
                name.Contains("havoc") ||
                name.Contains("det_choice"))
                return true;
            return false;
        }
        public static void DropAllModifies(Program prog)
        {
            foreach (Procedure p in prog.TopLevelDeclarations.Where(x => x is Procedure))
                if (!IsBakedProcedure(p))
                    p.Modifies = new List<IdentifierExpr>();
        }
        public static void PrintVarList(List<Variable> vars)
        {
            foreach (var v in vars) Console.Write("{0}, ", v);
        }
        public static bool IsDataTypeFunction(Function node)
        {
            if (node.Name.Contains("#"))
                return true;
            if (node.Attributes.FindBoolAttribute("constructor"))
                return true;
            return false;
        }

        //renaming (don't move as there is much SymDiff specific)

        //inlining logic
        public  static void InlineProcsInCaller(Program prog, Implementation caller, Procedure[] procs)
        {
            var impls = prog.TopLevelDeclarations.Where(x => x is Implementation);
            var inlinedImpls = new List<Implementation>();
            foreach (Implementation i in impls)
            {
                if (i == null) continue;
                if (!procs.Contains(i.Proc)) continue;
                i.AddAttribute("inline", Expr.Literal(1));
                i.OriginalBlocks = i.Blocks;
                i.OriginalLocVars = i.LocVars;
                inlinedImpls.Add(i);
            }
            Inliner.ProcessImplementation(BoogieUtils.BoogieOptions, prog, caller);
            //remove the inline attributes
            foreach (var j in inlinedImpls)
                j.Attributes = j.Attributes.Next; //removes teh head attribute
        }
        public static void InlineProg(Program program)
        {
            //perform inlining on the procedures
            IEnumerable<Declaration> impls = program.TopLevelDeclarations.Where(x => x is Implementation);
            foreach (Implementation impl in impls)
                if (Util.IsInlinedProc(impl.Proc)) //we only look at the inline on proc
                {
                    impl.OriginalBlocks = impl.Blocks;
                    impl.OriginalLocVars = impl.LocVars;
                }

            foreach (Implementation impl in impls)
                Inliner.ProcessImplementation(BoogieUtils.BoogieOptions, program, impl);

        }
        public static void InlineEverything(Program program, int inlineAllRecursionDepth)
        {
            //perform inlining on the procedures
            IEnumerable<Declaration> impls = program.TopLevelDeclarations.Where(x => x is Implementation);
            foreach (Implementation impl in impls)
            {
                BigNum bigDepth = BigNum.FromInt(inlineAllRecursionDepth);
                Expr depth = Expr.Literal(bigDepth);
                if (!Util.IsInlinedProc(impl.Proc))
                    impl.AddAttribute("inline", depth);
                impl.OriginalBlocks = impl.Blocks;
                impl.OriginalLocVars = impl.LocVars;
            }

            foreach (Implementation impl in impls)
                Inliner.ProcessImplementation(BoogieUtils.BoogieOptions, program, impl);

        }

        public static void InlineMissingImplementations(Program p1, Program p2, Dictionary<string, Declaration> dictionary, Dictionary<string, Declaration> dictionary_2)
        {
            IEnumerable<Declaration> impls = p1.TopLevelDeclarations.Where(x => x is Implementation);
            foreach (Implementation impl in impls)
            {
                if (!dictionary_2.ContainsKey(impl.Name + "$IMPL"))
                {
                    BigNum bigOne = BigNum.FromInt(1);
                    Expr one = Expr.Literal(bigOne);
                    if (!Util.IsInlinedProc(impl.Proc))
                        impl.AddAttribute("inline", one);
                    impl.OriginalBlocks = impl.Blocks;
                    impl.OriginalLocVars = impl.LocVars;
                }
            }
            foreach (Implementation impl in impls)
                Inliner.ProcessImplementation(BoogieUtils.BoogieOptions, p1, impl);

        }

        //Model related
        public static BigNum GetBoogiePartitionValue(Model em, int partition)
        {
            //var v = em.partitionToValue[partition];
            //if (v is BigNum && v != null)
            //    return ((BigNum)v);
            //if (v is BvConst)
            //{
            //    return ((BvConst)v).Value;
            //}
            throw new Exception("Value in the error model is null or not a BigNum/BvConst");
        }
        public static bool IsModelConst(Constant c)
        {
            for (var kv = c.Attributes; kv != null; kv = kv.Next)
                if (kv.Key.Equals("model_const"))
                    return true;
            return false;
        }
        public static String GetModelConstExprAttr(Constant c)
        {
            for (var kv = c.Attributes; kv != null; kv = kv.Next)
                if (kv.Key.Equals("model_const"))
                    return kv.Params[0].ToString();
            return "_";
        }
        public static String GetSourceFileAttr(Constant c)
        {
            for (var kv = c.Attributes; kv != null; kv = kv.Next)
                if (kv.Key.Equals("sourceFile") ||
                    kv.Key.Equals("sourcefile"))
                    return kv.Params[0].ToString();
            return "";
        }
        public static String GetSourceLineAttr(Constant c)
        {
            for (var kv = c.Attributes; kv != null; kv = kv.Next)
                if (kv.Key.Equals("sourceLine") ||
                    kv.Key.Equals("sourceline"))
                    return kv.Params[0].ToString();
            return "";
        }

        public static string ExecuteBinary(string binaryName, string arguments)
        {
            try
            {
                ProcessStartInfo procInfo = new ProcessStartInfo();
                procInfo.UseShellExecute = false;
                procInfo.FileName = binaryName;
                procInfo.Arguments = arguments;
                procInfo.WindowStyle = ProcessWindowStyle.Hidden;
                procInfo.RedirectStandardOutput = true;
                Process proc = new Process();
                proc.StartInfo = procInfo;
                proc.EnableRaisingEvents = false;
                proc.Start();
                string output = "";
                output = proc.StandardOutput.ReadToEnd();
                proc.WaitForExit();
                Console.WriteLine("\tEND Executing {0} {1}", binaryName, arguments);
                return output;
            }
            catch (Exception e)
            {
                Console.WriteLine("\tEND Executing {0} {1} with Exceptin {2}", binaryName, arguments, e.Message);
                return e.Message;
            }
        }


        public static bool IsSourceInfoAssertOrAssumeCmd(Cmd cmd)
        {
            string srcFile = null;
            int srcLine = -1;
            return IsSourceInfoAssertOrAssumeCmd(cmd, out srcFile, out srcLine);
        }
        /// <summary>
        /// Returns the srcFile and srcLine when the return is true
        /// </summary>
        /// <param name="cmd"></param>
        /// <param name="srcFile"></param>
        /// <param name="srcLine"></param>
        /// <returns></returns>
        public static bool IsSourceInfoAssertOrAssumeCmd(Cmd cmd, out string srcFile, out int srcLine)
        {
            srcFile = null;
            srcLine = -1;
            QKeyValue attrs = null;
            if (cmd is AssertCmd assertCmd)
            {
                attrs = assertCmd.Attributes;
            }
            else if (cmd is AssumeCmd assumeCmd)
            {
                attrs = assumeCmd.Attributes;
            }
            if (attrs == null) return false;
            var attr = QKeyValue.FindAttribute(attrs, attr => attr.Key.Equals("sourceloc"));
            if (attr != null &&
                attr.Params.Count > 2 &&
                attr.Params[0] is string file &&
                attr.Params[1] is LiteralExpr lineExp &&
                lineExp.isBigNum && lineExp.asBigNum.ToInt != 0)
            {
                srcLine = lineExp.asBigNum.ToInt;
                srcFile = file;
            }
            return srcFile != null;
        }

        public static bool IsMSProcedureWithMapping(Procedure node, out string f1, out string f2)
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

        /// <summary>
        /// Find procedures within distance away from the syntactically changed procedures
        /// </summary>
        /// <param name="prog"></param>
        /// <param name="distance"></param>
        /// <returns></returns>
        public static IEnumerable<string> FindChangedProcsWithinDistance(Program prog, int distance)
        {
            Graph<Procedure> cg = CallGraphHelper.ComputeCallGraph(prog);
            var origChangedProcs = 
                prog.TopLevelDeclarations.OfType<Procedure>()
                .Where(x => x != null && x.Attributes.FindBoolAttribute("syntacticChangedProc"));

            var a = BoogieUtils.FindProcsAtDistance(cg, origChangedProcs.Select(x => x.Name));
            var b = a.Where(x => x.Key <= distance);
            var c = b.Select(x => x.Value.ToList());
            if (c.Count() == 0) return new List<string>();
            return c.Aggregate((x, y) => x.Union(y).ToList());
        }

        public static IEnumerable<Procedure> FindChangedMSProcs(Program mergedProgram, int distance)
        {
            var changedProcs = FindChangedProcsWithinDistance(mergedProgram, distance);
            var changedMSProcs = new List<Procedure>();
            foreach(var p in mergedProgram.TopLevelDeclarations.OfType<Procedure>())
            {
                string f1, f2;
                if (IsMSProcedureWithMapping(p, out f1, out f2))
                {
                    var pf1 = mergedProgram.TopLevelDeclarations.OfType<Procedure>().Where(x => x.Name == f1).FirstOrDefault();
                    var pf2 = mergedProgram.TopLevelDeclarations.OfType<Procedure>().Where(x => x.Name == f2).FirstOrDefault();
                    if (changedProcs.Any(x => x == pf1.Name) || changedProcs.Any(x => x == pf2.Name))
                        changedMSProcs.Add(p);
                }
            }
            return changedMSProcs;
        }
    }

    /// <summary>
    /// TODO: unify with Dependency.DeclUtils
    /// </summary>
    public static class DeclUtils
    {
        static int retCnt = 0;
        public static Function MkOrGetFunc(Program prog, string name, BType retType, List<BType> inTypes)
        {
            var fns = prog.TopLevelDeclarations.OfType<Function>().Where(x => x.Name == name);
            if (fns.Count() != 0)
                return fns.FirstOrDefault();
            Function func = new Function(
                Token.NoToken,
                name,
                inTypes.Select(t => (Variable)MkFormal(t)).ToList(),
                MkFormal(retType));
            prog.AddTopLevelDeclaration(func);
            return func;
        }
        public static NAryExpr MkFuncApp(Function f, List<Expr> args)
        {
            return new NAryExpr(new Token(), new FunctionCall(f), args);
        }
        public static Formal MkFormal(BType t)
        {
            return new Formal(Token.NoToken, new TypedIdent(Token.NoToken, "ret" + retCnt++, t), false);
        }
        public static Variable MkGlobalVariable(Program prog, string name, BType type)
        {
            var g = new GlobalVariable(Token.NoToken, new TypedIdent(Token.NoToken, name, type));
            prog.AddTopLevelDeclaration(g);
            return g;
        }
    }


    public static class CTrace
    {
        public static string Make(List<Duple<string, int>> mTrace, List<Declaration> consts, Model errModel, string v1Name, string v2Name)
        {
            var dict = new Dictionary<string, Dictionary<int, string>>();
            var files = mTrace.Map(x => x.fst).Uniquify();

            var min = 10000;
            var max = 0;
            foreach (var d in mTrace)
            {
                if (d.snd < min)
                    min = d.snd;
                if (d.snd > max)
                    max = d.snd;
            }
            foreach (var d in mTrace)
            {
                if (!dict.ContainsKey(d.fst))
                    dict.Add(d.fst, new Dictionary<int, string>());
                if (!dict.Get(d.fst).ContainsKey(d.snd))
                    dict.Get(d.fst).Add(d.snd, "");
            }
            StringBuilder cTraceBuilder = new StringBuilder("\n");
            StringBuilder cTraceModelBuilder = new StringBuilder();

            int fileNumber = 0;
            string prefix = "";
            foreach (var file in files)
            {
                if (fileNumber == 0)
                    prefix = v1Name;
                else
                    prefix = v2Name;

                //RS: weird behaviour due to $$ in filename 
                string hack = "";
                if (file.Contains("$$"))
                    hack = file.Replace("$$", ":\\");
                else
                    hack = file;

                //Sometimes we see lines such as     assert {:sourcefile "unknown"} {:sourceline 0} true;
                if (file == "unknown") continue;
                Console.Write("Trying to read " + file + "...");
                StreamReader reader;
                //RS: Hack

                try
                {
                    reader = new StreamReader(new FileStream(hack, FileMode.Open, FileAccess.Read));
                }
                catch (Exception e)
                {
                    Console.WriteLine("failed!" + e);
                    continue;
                }
                var fdict = dict.Get(file);

                cTraceBuilder.Append(file + ":\n");

                string line;
                int i = 1;
                while (!reader.EndOfStream)
                {
                    line = reader.ReadLine();
                    {
                        if (fdict.ContainsKey(i))
                        {
                            int k = 0;
                            HashSet<string> visitedExprs = new HashSet<string>();
                            foreach (Constant currConst in consts)
                            {
                                //TODO: unify the code for model generation in Utils.cs and BoogieVerify.cs
                                if ((Util.IsModelConst(currConst)
                                    ) && (currConst.Name.StartsWith(prefix + ".")))
                                {
                                    if (Int16.Parse(Util.GetSourceLineAttr(currConst)) == i) //fixme: will crash if the sourceLine attribute does not have a legal line 
                                    {
                                        Model.Func valueIsFunction = null;
                                        if (errModel.HasFunc(v2Name + ".value_is"))
                                            valueIsFunction = errModel.GetFunc(v2Name + ".value_is");
                                        else if (errModel.HasFunc(v2Name + ".value_is_int"))
                                            valueIsFunction = errModel.GetFunc(v2Name + ".value_is_int");
                                        else if (errModel.HasFunc(v2Name + ".value_is_bv32"))
                                            valueIsFunction = errModel.GetFunc(v2Name + ".value_is_bv32");
                                        else
                                            throw new Exception("Can't find value_is* predicate in the model....fatal error");

                                        Model.Element partValue = errModel.MkElement("-1");
                                        var cval = errModel.GetFunc(currConst.Name).GetConstant();
                                        foreach (var ll in valueIsFunction.AppsWithArg(0, cval))
                                            partValue = ll.Args[1];
                                        String realVar = Util.GetModelConstExprAttr(currConst);  //currConst.Attributes.Params[0].ToString();
                                        if (!visitedExprs.Contains(realVar))
                                        { //avoid printing the same 
                                            if (k > 0) cTraceModelBuilder.Append(", ");
                                            if (k == 0) cTraceModelBuilder.Append("[");
                                            cTraceModelBuilder.Append(realVar + " = " + partValue.ToString());
                                            k++;
                                            visitedExprs.Add(realVar);
                                        }
                                    }
                                }
                            }
                            cTraceBuilder.Append("$$$l");
                        }
                        cTraceBuilder.Append(i + ":\t");
                        cTraceBuilder.Append(line + "\n");
                        if (cTraceModelBuilder.Length > 0)
                        {
                            cTraceModelBuilder.Append("]\n");
                            cTraceBuilder.Append("###l");

                            cTraceModelBuilder.Insert(0, "" + "\t");
                            cTraceBuilder.Append(cTraceModelBuilder.ToString());
                            cTraceModelBuilder = new StringBuilder();
                        }
                    }
                    i++;
                }
                reader.Close();
                cTraceBuilder.Append("$$$b\n");
                Console.WriteLine("done");
                fileNumber++;
            }
            return cTraceBuilder.ToString();
        }
    }

    //state related to VC generation that will be shared by different options
    /// <summary>
    /// TODO: Copied from Rootcause, refactor
    /// </summary>
    public static class SymDiffVC
    {
        /* vcgen related state */
        public static VerificationConditionGenerator vcgen;
        public static ProverInterface proverInterface;
        public static ProverInterface.ErrorHandler handler;
        public static VerificationResultCollector collector;
        public static Boogie2VCExprTranslator translator;
        public static VCExpressionGenerator exprGen;

        #region Utilities for calling the verifier
        public static void InitializeVCGen(Program prog)
        {
            //create VC.vcgen/VC.proverInterface
            var checkerPool = new CheckerPool(BoogieUtils.BoogieOptions);
            vcgen = new VerificationConditionGenerator(prog, checkerPool);
            proverInterface = ProverInterface.CreateProver(
                BoogieUtils.BoogieOptions, prog, BoogieUtils.BoogieOptions.ProverLogFilePath,
                BoogieUtils.BoogieOptions.ProverLogFileAppend, BoogieUtils.BoogieOptions.TimeLimit);
            translator = proverInterface.Context.BoogieExprTranslator;
            exprGen = proverInterface.Context.ExprGen;
            collector = new VerificationResultCollector(BoogieUtils.BoogieOptions);
        }
        public static SolverOutcome VerifyVC(string descriptiveName, VCExpr vc, out List<Counterexample> cex)
        {
            collector.Examples.Clear(); //reset the cexs
            //Use MyBeginCheck instead of BeginCheck as it is inconsistent with CheckAssumptions's Push/Pop of declarations
            SolverOutcome proverOutcome;
            //proverOutcome = MyBeginCheck(descriptiveName, vc, VC.handler); //Crashes now
            //proverInterface.BeginCheck(descriptiveName, vc, handler);
            proverOutcome = proverInterface.Check(descriptiveName, vc, handler,
                BoogieUtils.BoogieOptions.ErrorLimit, CancellationToken.None).Result;
            cex = collector.Examples.ToList();
            return proverOutcome;
        }

        public static void FinalizeVCGen(Program prog)
        {
            collector = null;
        }

        public static SolverOutcome MyBeginCheck(string descriptiveName, VCExpr vc, ProverInterface.ErrorHandler handler)
        {
            SymDiffVC.proverInterface.Push();
            SymDiffVC.proverInterface.Assert(vc, true);
            SymDiffVC.proverInterface.Check();
            var outcome = SymDiffVC.proverInterface.Check(descriptiveName, vc, SymDiffVC.handler,
                BoogieUtils.BoogieOptions.ErrorLimit, CancellationToken.None).Result;
            SymDiffVC.proverInterface.Pop();
            return outcome;
        }

        public static VCExpr GenerateVC(Program prog, Implementation impl)
        {
            new RemoveBackEdges(vcgen).ConvertCfg2Dag(new ImplementationRun(impl, Console.Out));
            ModelViewInfo mvInfo;
            vcgen.PassifyImpl(new ImplementationRun(impl, Console.Out), out mvInfo);
        
            var exprGen = SymDiffVC.proverInterface.Context.ExprGen;
            //VCExpr controlFlowVariableExpr = null; 
            VCExpr controlFlowVariableExpr = /*BoogieUtils.BoogieOptions.UseLabels ? null :*/ SymDiffVC.exprGen.Integer(BigNum.ZERO);
        
        
            var absyIds = new ControlFlowIdMap<Absy>();
            var vc = SymDiffVC.vcgen.GenerateVC(impl, controlFlowVariableExpr, absyIds, SymDiffVC.proverInterface.Context);
            VCExpr controlFlowFunctionAppl = SymDiffVC.exprGen.ControlFlowFunctionApplication(SymDiffVC.exprGen.Integer(BigNum.ZERO), SymDiffVC.exprGen.Integer(BigNum.ZERO));
            VCExpr eqExpr = SymDiffVC.exprGen.Eq(controlFlowFunctionAppl, SymDiffVC.exprGen.Integer(BigNum.FromInt(impl.Blocks[0].UniqueId)));
            vc = SymDiffVC.exprGen.Implies(eqExpr, vc);
        
            return vc;
        }
        #endregion

    }



    //A boogie Absy visitor that can traverse an ast from the root ("fixes" Microsoft.Boogie.StandardVisitor Behavior)
    //this is really just patching up bizzareness in the visitor's recursive calls piece by piece.
    //any infinite loops in a symdiff probably will end up here (and back and forth between here and boogie's standardvisitor
    //eventually i will write a revised visitor for boogie and we can plug this into that
    //TODO: just rewrite the visitor completely
    //also the way this changes the calling pattern, it's not really possible to write a non-mutating subclass over this..
    public class FixedVisitor : StandardVisitor
    {
        //standardvisitor has some completely bizarre calling patterns, this should more or less stop cycles from popping up..
        //update: doesn't work!
        private HashSet<Absy> FVisited;

        public FixedVisitor()
        {
            FVisited = new HashSet<Absy>();
        }

        public override Declaration VisitDeclaration(Declaration node)
        {
            if (node == null)
                Console.WriteLine("Null node in VisitDeclaration!");

            //if (FVisited.Contains(node))
            //  return node;

            //FVisited.Add(node);

            if (node is Axiom)
                node = this.VisitAxiom((Axiom)node);
            if (node is Variable)
                node = this.VisitVariable((Variable)node);
            if (node is TypeSynonymDecl)
                node = this.VisitTypeSynonymDecl((TypeSynonymDecl)node);
            if (node is TypeCtorDecl)
                node = this.VisitTypeCtorDecl((TypeCtorDecl)node);
            if (node is DeclWithFormals)
                node = this.VisitDeclWithFormals((DeclWithFormals)node);
            return base.VisitDeclaration(node);
        }

        public override Variable VisitVariable(Variable node)
        {
            if (node == null)
                Console.WriteLine("Null node in VisitVariable!");

            //if (FVisited.Contains(node))
            //  return node;

            //FVisited.Add(node);

            node.TypedIdent = VisitTypedIdent(node.TypedIdent);

            if (node is Constant)
                node = VisitConstant((Constant)node);
            if (node is GlobalVariable)
                node = VisitGlobalVariable((GlobalVariable)node);
            if (node is Formal)
                node = VisitFormal((Formal)node);
            if (node is LocalVariable)
                node = VisitLocalVariable((LocalVariable)node);
            if (node is BoundVariable)
                node = VisitBoundVariable((BoundVariable)node);
            //if (node is SimpleVariable)
            //  node = VisitSimpleVariable((SimpleVariable)node);
            return base.VisitVariable(node);
        }

        public override TypedIdent VisitTypedIdent(TypedIdent node)
        {
            // dropping the where clauses for now - hemr
            if (node.WhereExpr != null)
            {
                node.WhereExpr = null;
            }
            node.Type = VisitType(node.Type);
            return node;
        }

        public override DeclWithFormals VisitDeclWithFormals(DeclWithFormals node)
        {
            //if (FVisited.Contains(node))
            //  return node;

            //FVisited.Add(node);
            if (node == null)
                Console.WriteLine();
            if (node is Function)
                node = this.VisitFunction((Function)node);
            if (node is Implementation)
                node = this.VisitImplementation((Implementation)node);
            if (node is Procedure)
                node = this.VisitProcedure((Procedure)node);
            return base.VisitDeclWithFormals(node);
        }

        public override Implementation VisitImplementation(Implementation node)
        {
            node.LocVars = this.VisitVariableSeq(node.LocVars);
            node.Blocks = this.VisitBlockList(node.Blocks);
            if (node.Proc != null)                 //program transforms may visit unresolved AST
                node.Proc = this.VisitProcedure(node.Proc);
            return node;
        }

        public override Function VisitFunction(Function node)
        {
            if (node != null)
            {
                node.InParams = this.VisitVariableSeq(node.InParams);
                node.OutParams = this.VisitVariableSeq(node.OutParams);
                if (node.Body != null) node.Body = this.VisitExpr(node.Body);
            }
            return node;
        }

        public override Constant VisitConstant(Constant node)
        {
            return node;
        }

        public override Expr VisitIdentifierExpr(IdentifierExpr node)
        {
            if (node.Type != null)
                node.Type = VisitType(node.Type);
            return base.VisitIdentifierExpr(node);
        }

        public override Formal VisitFormal(Formal node)
        {
            return node;
        }

        public override LocalVariable VisitLocalVariable(LocalVariable node)
        {
            return node;
        }

        //public override SimpleVariable VisitSimpleVariable(SimpleVariable node)
        //{
        //  return node;
        //}

        public override BoundVariable VisitBoundVariable(BoundVariable node)
        {
            return node;
        }

        public override Axiom VisitAxiom(Axiom node)
        {
            node.Expr = VisitExpr(node.Expr);
            return node;
        }

        //public override Function VisitFunction(Function node)
        //{
        //  return node;
        //}

        public override GlobalVariable VisitGlobalVariable(GlobalVariable node)
        {
            return node;
        }

        public override Declaration VisitTypeSynonymDecl(TypeSynonymDecl node)
        {
            return node;
        }

        public override Declaration VisitTypeCtorDecl(TypeCtorDecl node)
        {
            return node;
        }
    }



}
