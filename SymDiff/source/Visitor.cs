using System;
using Microsoft.Boogie;
using System.Collections.Generic;
using System.Linq;
using SDiff.Boogie;
using SDiff;
using System.Diagnostics;

/* Classes for crawling the Boogie AST */

/* To be careful while visiting decl/types/programs */
/* Boogie's visitor is good for visiting exprs      */

namespace SDiff
{
    public static class Muts
    {
        public delegate IdentifierExpr IdentMutator(IdentifierExpr e);
    }


    public class MakeContractsFree : FixedVisitor
    {
        public override Cmd VisitAssertCmd(AssertCmd node)
        {
            var newNode = new AssumeCmd(Token.NoToken, node.Expr);
            return newNode;
        }

        public override Ensures VisitEnsures(Ensures ensures)
        {
            ensures = new Ensures(true, ensures.Condition);
            return base.VisitEnsures(ensures);
        }

        public override Requires VisitRequires(Requires requires)
        {
            requires = new Requires(true, requires.Condition);
            return base.VisitRequires(requires);
        }
    }

    public class StripContractsAndAttributes : FixedVisitor
    {
        public bool asserts = false;
        bool makeContractsFree = false; 
        public StripContractsAndAttributes(bool freeContractsFlag)
        {
            makeContractsFree =  freeContractsFlag;
        }
        public override Procedure VisitProcedure(Procedure node)
        {
            //RS: make HAVOC statements to have free ensures, if asserts is ON then preserve non-free ensures of procedures (Houdini)
            //if ((node.Name.Contains("HAVOC") || node.Name.Contains("havoc")) && asserts)
            if (Util.IsBakedProcedure(node) && asserts)
            {
                var TempEnsureSeq = new List<Ensures>();
                foreach (Ensures e in node.Ensures)
                {
                    TempEnsureSeq.Add(new Ensures(true, e.Condition));
                }
                node.Ensures = TempEnsureSeq;

                var TempRequireSeq = new List<Requires>();
                foreach (Requires e in node.Requires)
                {
                    TempRequireSeq.Add(new Requires(true, e.Condition));
                }
                node.Requires = TempRequireSeq;
                node.Attributes = null;
                return base.VisitProcedure(node);
            }
                //changing this //shuvendu
            //else if (asserts)
            //{
            //    //requires/ensures --> requires/ensures
            //    //free requires/ensures --> {} for scalability
            //    var TempEnsureSeq = new List<Ensures>();
            //    foreach (Ensures e in node.Ensures)
            //    {
            //        if (e.Free)
            //            continue;
            //        TempEnsureSeq.Add(new Ensures(e.Free, e.Condition));
            //    }
            //    node.Ensures = TempEnsureSeq;

            //    var TempRequireSeq = new List<Requires>();
            //    foreach (Requires e in node.Requires)
            //    {
            //        if (e.Free)
            //            continue;
            //        TempRequireSeq.Add(new Requires(e.Free, e.Condition));
            //    }
            //    node.Requires = TempRequireSeq;

            //    node.Attributes = null;
            //    return base.VisitProcedure(node);
            //}
            else
            {
                if (!makeContractsFree)
                {
                    node.Requires = new List<Requires>();
                    node.Ensures = new List<Ensures>();
                    node.Attributes = null;
                }
                return base.VisitProcedure(node);
            
            }
        }



        public override Implementation VisitImplementation(Implementation node)
        {
            node.Attributes = null;
            return base.VisitImplementation(node);
        }

        //havoc has already turned conditionals into assumes, so i can't wipe these out
        //public override Cmd VisitAssumeCmd(AssumeCmd node)
        //{
        //  node.Expr = Expr.True;
        //  return base.VisitAssumeCmd(node);
        //}

        public override Cmd VisitAssertCmd(AssertCmd node)
        {
            node.Expr = Expr.True;
            return base.VisitAssertCmd(node);
        }
    }

    /* public class ReplaceAssertsByOK : FixedVisitor
     {
         public override Cmd VisitAssertCmd(AssertCmd node)
         {
             node.
             return base.VisitAssignCmd(node);;
         }
     }
   */
    public class FunctionRenamer : FixedVisitor
    {
        private ProcedureMap funMap;
        private Dictionary<string, Function> decls;
        private Dictionary<string, string> subs;
        private Dictionary<string, string> Subs
        {
            get
            {
                if (subs == null)
                    subs = funMap.ToProcedureDictionary();
                return subs;
            }
        }

        public FunctionRenamer(ProcedureMap funMap, List<Function> funs)
        {
            subs = null;
            this.funMap = funMap;
            decls = new Dictionary<string, Function>();
            foreach (var fun in funs)
                decls.Add(fun.Name, fun);
        }

        public override Function VisitFunction(Function node)
        {
            var sub = Subs.Get(node.Name);
            if (sub != null)
                node = decls.Get(sub);
            return base.VisitFunction(node);
        }

        private Expr GetArgOfParam(string name, List<Expr> args, List<Variable> parms)
        {
            if (args.Count != parms.Count)
            {
                Log.Out(Log.Error, "Unequal length arguments and parameters in FunctionRenamer");
                return null;
            }

            for (int i = 0; i < args.Count; i++)
                if (parms[i].Name == name)
                    return args[i];
            return null;
        }

        public override Expr VisitNAryExpr(NAryExpr node)
        {
            var sub = Subs.Get(node.Fun.FunctionName);
            var newNode = node;
            if (sub != null)
            {
                var subFun = decls.Get(sub);
                if (subFun == null)
                    Log.Out(Log.Error, "Could not find function " + sub + " in FunctionRenamer");
                var paramMap = funMap.FindPair(node.Fun.FunctionName, sub);

                //map args by paramMap
                var thisFun = decls.Get(node.Fun.FunctionName);
                var newArgs = new List<Expr>();
                int i = 0;
                if (subFun != null)
                {
                    foreach (Variable pv in subFun.InParams)
                    {
                        var pr = paramMap.Find(x => x.snd == pv.Name);
                        if (pr != null)
                        {
                            var arg = GetArgOfParam(pr.fst, node.Args.ToList(), thisFun.InParams);
                            if (arg == null)
                                Log.Out(Log.Error, "Mapped param does not seem to exist in FunctionRenamer");
                            newArgs.Add(arg);
                        }
                        else
                            newArgs.Add(node.Args[i]);
                        i++;
                    }

                    newNode = new NAryExpr(node.tok, new FunctionCall(Expr.Ident(sub, subFun.OutParams[0].TypedIdent.Type)), newArgs);
                    (newNode.Fun as FunctionCall).Func = subFun;
                }
            }
            return base.VisitNAryExpr(newNode);
        }

    }

    public class FunctionCallMapper : FixedVisitor
    {
        public delegate Function FunctionTransformer(Function old);

        private readonly FunctionTransformer funT;

        public FunctionCallMapper(FunctionTransformer funT)
        {
            this.funT = funT;
        }

        public override Expr VisitNAryExpr(NAryExpr node)
        {
            if (node.Fun is FunctionCall)
            {
                var newFunc = funT(((FunctionCall)node.Fun).Func);
                if (newFunc != null)
                {
                    var newCall = new FunctionCall(Expr.Ident(newFunc.Name, newFunc.OutParams[0].TypedIdent.Type));
                    newCall.Func = newFunc;
                    node.Fun = newCall;
                }
            }
            return base.VisitNAryExpr(node);
        }
    }

    public class VariableRenamer : FixedVisitor
    {
        private List<HDuple<string>> subs;
        private Dictionary<string, Variable> decls;

        public VariableRenamer(List<Variable> decls)
        {
            this.subs = new List<HDuple<string>>();
            this.decls = new Dictionary<string, Variable>();
            foreach (Variable v in decls)
                this.decls.Add(v.Name, v);
        }

        public VariableRenamer(List<HDuple<string>> subs, List<Variable> decls)
            : this(decls)
        {
            this.subs = (subs == null ? new List<HDuple<string>>() : subs);
        }


        public void Add(string a, string b)
        {
            this.subs.Add(new HDuple<string>(a, b));
        }

        public void AddRange(List<HDuple<string>> a)
        {
            this.subs.AddRange(a);
        }

        public void AddDecls(List<Variable> vs)
        {
            foreach (Variable v in vs)
                //decls.Add(v.Name, v);
                decls[v.Name] = v;
        }

        public Variable TryLookUpSub(string n)
        {
            var newN = subs.Find(x => x.fst == n);
            if (newN == null)
                return null;
            if (newN.snd == null)
                Log.Out(Log.VariableRenamer, "There is no mapping for " + newN.fst);
            Variable v;
            decls.TryGetValue(newN.snd, out v);
            if (v == null)
                Log.Out(Log.VariableRenamer, "subbed (" + newN.fst + ", " + newN.snd + ") into null in VariableRenamer");
            Log.Out(Log.VariableRenamer, "subbed (" + newN.fst + ", " + newN.snd + ") in VariableRenamer");
            return v;
        }

        public override Expr VisitIdentifierExpr(IdentifierExpr node)
        {
            IdentifierExpr newNode;
            if (node.Name != node.Decl.Name || node.Name != node.Decl.TypedIdent.Name)
                Log.Out(Log.Error, "Inconsistent variable/ident naming on " + node.Name + " " + node.Decl.Name + " " + node.Decl.TypedIdent.Name);
            var v = TryLookUpSub(node.Name);
            if (v == null)
                newNode = null;
            else
                newNode = Expr.Ident(v);

            return base.VisitIdentifierExpr(newNode == null ? node : newNode);
        }

        public override Variable VisitVariable(Variable node)
        {
            var newNode = TryLookUpSub(node.Name);
            return base.VisitVariable(newNode == null ? node : newNode);
        }
    }

    public class CalleeCollector : FixedVisitor
    {
        public List<Procedure> Callees;

        public CalleeCollector()
        {
            Callees = new List<Procedure>();
        }

        public override Cmd VisitCallCmd(CallCmd node)
        {
            if (node == null)
                Log.Out(Log.Error, "Null call in CalleeCollector");
            else
                Callees.Add(node.Proc);
            return base.VisitCallCmd(node);
        }
    }

    public class VariableCollector : FixedVisitor
    {
        public List<Variable> Vars;
        public HashSet<Variable> Exempt;

        public VariableCollector()
        {
            Vars = new List<Variable>();
            Exempt = new HashSet<Variable>();
        }

        public void Reset()
        {
            Vars.Clear();
            Exempt.Clear();
        }

        public override Expr VisitIdentifierExpr(IdentifierExpr node)
        {
            if (!Exempt.Contains(node.Decl))
                Vars.Add(node.Decl);
            return base.VisitIdentifierExpr(node);
        }
    }

    public class CallRewriter : FixedVisitor
    {
        public Dictionary<string, Procedure> subs;
        public List<IdentifierExpr> globals;

        //public CallRewriter()
        //{
        //  subs = new Dictionary<string, Procedure>();
        //}

        public CallRewriter(Dictionary<string, Procedure> subs, List<Variable> globals)
        {
            this.subs = subs;
            this.globals = globals.Map(x => new IdentifierExpr(Token.NoToken, x));
        }

        public override Cmd VisitCallCmd(CallCmd node)
        {
            Procedure newProc;
            subs.TryGetValue(node.Proc.Name, out newProc);
            if (newProc == null)
                Log.Out(Log.Error, "Could not rewrite function " + node.Proc.Name);
            node.Proc = newProc;

            node.Ins.AddRange(globals.Map(x => x as Expr));
            node.Outs.AddRange(globals);
            return base.VisitCallCmd(node);
        }
    }

    //renames procedures and variables by appending a prefix
    //in-place over a program
    //relies on an unfortunate assumption that globals will be visited first. safe over our preprocessed program trees
    public class PrefixRenamer : FixedVisitor
    {
        //GlobalsVars = Constants + Globals (Var subclasses at global scope)
        public readonly HashSet<Variable> GlobalVars;
        public readonly List<Function> Functions;
        public readonly HashSet<Absy> Visited;
        public readonly string Prefix;

        private Function FindFunction(string name)
        {
            foreach (var fun in Functions)
                if ((Visited.Contains(fun) && (fun.Name.Substring(fun.Name.IndexOf('.') + 1) == name)) ||
                    (!Visited.Contains(fun) && (fun.Name == name)))
                    return fun;
            return null;
        }

        public string AppendPrefix(string s)
        {
            return Prefix + "." + s;
        }

        public PrefixRenamer(string prefix)
        {
            this.Prefix = prefix;
            GlobalVars = new HashSet<Variable>();
            Visited = new HashSet<Absy>();
            Functions = new List<Function>();
        }

        public PrefixRenamer(string prefix, List<Declaration> globalVars, List<Declaration> functions)
            : this(prefix)
        {
            foreach (var v in globalVars)
                GlobalVars.Add(v as Variable);
            Functions = new List<Function>(functions.Map(x => x as Function));
        }

        public override Procedure VisitProcedure(Procedure node)
        {
            if (!Visited.Contains(node))
            {
                Visited.Add(node);
                node.AddAttribute("prefix", this.Prefix);
                node.Name = AppendPrefix(node.Name);
            }
            return base.VisitProcedure(node);
        }

        public override Implementation VisitImplementation(Implementation node)
        {
            if (!Visited.Contains(node))
            {
                Visited.Add(node);
                node.Name = AppendPrefix(node.Name);
            }
            return base.VisitImplementation(node);
        }

        public override GlobalVariable VisitGlobalVariable(GlobalVariable node)
        {
            if (!Visited.Contains(node))
            {
                Visited.Add(node);
                node.Rename(AppendPrefix(node.Name));
            }
            return base.VisitGlobalVariable(node);
        }

        public override Constant VisitConstant(Constant node)
        {
            //note that constants are always at global scope
            if (!Visited.Contains(node))
            {
                Visited.Add(node);
                node.Rename(AppendPrefix(node.Name));
            }
            return base.VisitConstant(node);
        }

        //after renaming a variable from v --> v1.v, it is going to change
        //any occurrence of v in any expression to v1.v
        public override Expr VisitIdentifierExpr(IdentifierExpr node)
        {
            if (!Visited.Contains(node))
            {
                Visited.Add(node);
                if (GlobalVars.Contains(node.Decl))
                    node.Name = node.Decl.Name;
            }

            return base.VisitIdentifierExpr(node);
        }

        public override Function VisitFunction(Function node)
        {
            if (!Visited.Contains(node))
            {
                Visited.Add(node);
                if (!Util.IsDataTypeFunction(node)) //we are not going to rename m#f 
                    node.Name = AppendPrefix(node.Name);
            }
            return base.VisitFunction(node);
        }
        public override Expr VisitNAryExpr(NAryExpr node)
        {
            var fun = FindFunction(node.Fun.FunctionName);
            var newNode = node;
            if (fun != null)
            {
                VisitFunction(fun);
                newNode = new NAryExpr(node.tok, new FunctionCall(Expr.Ident(fun.Name, fun.OutParams[0].TypedIdent.Type)), node.Args);
                //re-resolve this node by hand
                (newNode.Fun as FunctionCall).Func = fun;
            }
            return base.VisitNAryExpr(newNode);
        }

        public override Cmd VisitCallCmd(CallCmd node)
        {
            if (!Visited.Contains(node))
            {
                Visited.Add(node);
                var proc = VisitProcedure(node.Proc);
                node = new CallCmd(node.tok, node.Proc.Name, node.Ins, node.Outs);
                node.Proc = proc;
            }
            return base.VisitCallCmd(node);
        }
    }

    public class ArgumentParameterEraser : FixedVisitor
    {
        public override Expr VisitNAryExpr(NAryExpr node)
        {
            if (node.Fun is FunctionCall)
            {
                var func = node.Fun as FunctionCall;
                if (SDiff.Boogie.Process.IsUFName(func.Func.Name))
                    node.Args = new List<Expr> {new IdentifierExpr(Token.NoToken, "...", Microsoft.Boogie.Type.Int)};
            }
            return base.VisitNAryExpr(node);
        }

    }

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



public class Dumper : FixedVisitor
{
    public Dumper()
        : base()
    {
    }

    public override Program VisitProgram(Program node)
    {
        Log.Out(Log.Normal, node.ToString());
        return base.VisitProgram(node);
    }

    public override Procedure VisitProcedure(Procedure node)
    {
        Log.Out(Log.Normal, node.ToString());
        return base.VisitProcedure(node);
    }

    public override Implementation VisitImplementation(Implementation node)
    {
        Log.Out(Log.Normal, node.ToString());
        return base.VisitImplementation(node);
    }

    public override Expr VisitExpr(Expr node)
    {
        Log.Out(Log.Normal, node.ToString());
        return base.VisitExpr(node);
    }

    public override Cmd VisitAssignCmd(AssignCmd node)
    {
        Log.Out(Log.Normal, node.ToString());
        Log.Out(Log.Normal, node.Lhss.ToString());
        Log.Out(Log.Normal, node.Rhss.ToString());
        return base.VisitAssignCmd(node);
    }

    public override Expr VisitIdentifierExpr(IdentifierExpr node)
    {
        Log.Out(Log.Normal, node.ToString());
        return base.VisitIdentifierExpr(node);
    }

    public override Declaration VisitTypeSynonymDecl(TypeSynonymDecl node)
    {
        Log.Out(Log.Normal, node.ToString());
        return base.VisitTypeSynonymDecl(node);
    }

    public override Microsoft.Boogie.Type VisitType(Microsoft.Boogie.Type node)
    {
        Log.Out(Log.Normal, "Type " + node);
        return base.VisitType(node);
    }
}




