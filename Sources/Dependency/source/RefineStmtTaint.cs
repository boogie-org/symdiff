using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Boogie;
using Microsoft.Boogie.GraphUtil;
using System.Collections;
using System.Diagnostics;
using Microsoft.Boogie.VCExprAST;
using VC;
using Microsoft.BaseTypes;
using BType = Microsoft.Boogie.Type;

namespace Dependency
{
    /// <summary>
    /// Destructively instruments a program given a set of changed methods
    /// </summary>
    public class RefinedStmtTaintInstrumentation
    {
        static string globalCollectAssignName = "_global_collect_assigns_for_stmt_taint";
        static string globalCollectAssignVarAttribute = "stmtTaintCollectorGlobalVar";
        static string guardConstNamePrefix = "_stmtTaintConst_";
        static string guardConstAttribute = "stmtTaintConst";
        Program prog;
        Implementation currImpl;
        HashSet<Implementation> syntacticModifiedImpls;
        Dictionary<AssignCmd, Constant> guardWritesConsts; //these are Boolean constants that guard an assignment
        GlobalVariable globalCollectAssignmentsVar; //a global variable to collect the assignments
        Function collectBoolFunc, collectIntFunc, collectMapFunc; //functions to accumulate out := f(out, assign)
        public RefinedStmtTaintInstrumentation(Program prog, HashSet<Implementation> modifiedImpls)
        {
            this.prog = prog;
            syntacticModifiedImpls = modifiedImpls;
            guardWritesConsts = new Dictionary<AssignCmd, Constant>();
            globalCollectAssignmentsVar = new GlobalVariable(Token.NoToken,
                new TypedIdent(Token.NoToken, globalCollectAssignName, BType.Int));
            globalCollectAssignmentsVar.AddAttribute(globalCollectAssignVarAttribute, Expr.True);
            prog.AddTopLevelDeclaration(globalCollectAssignmentsVar);
            InitializeFuncs();
            currImpl = null;
        }
        public void Instrument()
        {
            var impls = new HashSet<Implementation>(prog.TopLevelDeclarations.OfType<Implementation>());
            impls.ForEach(impl =>
            {
                //TODO: refine the map for changed procedures as well
                if (syntacticModifiedImpls.Contains(impl)) return;
                InstrumentImpl(impl);
            });
        }
        private void InitializeFuncs()
        {
            var MkParams = new Func<List<BType>, string, List<Variable>>((tList, s)=>
                tList.Select((t, i) =>
                    (Variable) new Formal(Token.NoToken, new TypedIdent(Token.NoToken, s + i, t), false)
                ).ToList());

            var boolFuncParams = MkParams(new List<BType>() { BType.Int, BType.Bool }, "arg");
            var intFuncParams = MkParams(new List<BType>() { BType.Int, BType.Int}, "arg");
            var mapFuncParams = MkParams(new List<BType>() { BType.Int, BType.Int, BType.Int }, "arg");

            collectBoolFunc = new Function(Token.NoToken, "collectBoolFunc", boolFuncParams, MkParams(new List<BType>() { BType.Int }, "ret")[0]);
            collectIntFunc = new Function(Token.NoToken, "collectIntFunc", intFuncParams, MkParams(new List<BType>() { BType.Int }, "ret")[0]);
            collectMapFunc = new Function(Token.NoToken, "collectMapFunc", mapFuncParams, MkParams(new List<BType>() { BType.Int }, "ret")[0]);
            prog.AddTopLevelDeclaration(collectBoolFunc);
            prog.AddTopLevelDeclaration(collectIntFunc);
            prog.AddTopLevelDeclaration(collectMapFunc);
        }
        private void InstrumentImpl(Implementation impl)
        {
            currImpl = impl;
            var InstrumentCmd = new Func<Cmd, Block, Cmd> ((c,b) =>
            {
                if(c is AssignCmd) return InstrumentAssignCmd(c as AssignCmd, b);
                if (c is CallCmd)  return InstrumentCallCmd(c as CallCmd, b);
                return null;
            });

            var InstrumentBlockCmds = new Func<List<Cmd>, Block, List<Cmd>>((cmds, b)=>
            {
                var newCmds = new List<Cmd>();
                cmds.ForEach(c => 
                { 
                    newCmds.Add(c);  
                    var d = InstrumentCmd(c,b);
                    if (d != null) newCmds.Add(d);
                });
                return newCmds;
            });

            impl.Blocks.ForEach(b => { b.Cmds = InstrumentBlockCmds(b.Cmds, b); });
            currImpl = null;
        }

        private Cmd InstrumentCallCmd(CallCmd callCmd, Block enclBlock)
        {
            Console.WriteLine("Skipping instrumentation of CallCmds");
            return null; //TODO instrument calls
        }

        private Cmd InstrumentAssignCmd(AssignCmd assignCmd, Block enclBlock)
        {
            if (assignCmd.Lhss.Count > 1)
            {
                Console.WriteLine("Ignoring parallel assigns from statement taint {0}", assignCmd);
                return null;
            }
            var assignedVar = assignCmd.Lhss[0].DeepAssignedVariable;
            var lhss = new List<AssignLhs>();
            var rhss = new List<Expr>();
            //lhs := rhs
            //out := if b_l then out else f(out, rhs)
            //lhs := upd(a, i, v)
            //out := if b_l then out else g(out, i, v)
            var glob = IdentifierExpr.Ident(globalCollectAssignmentsVar);
            var bConst = LookupOrCreateNewGuardConst(assignCmd, enclBlock);
            lhss.Add(new SimpleAssignLhs(Token.NoToken, glob));
            Expr expr;
            var assignType = assignedVar.TypedIdent.Type;
            if (assignType.IsBool)
                expr = CollectBooleanAssignment(glob, assignedVar); 
            else if (assignType.IsInt)
                expr = CollectIntAssignment(glob, assignedVar);
            else if (assignType.IsMap)
                expr = CollectMapAssignment(glob, assignCmd.Rhss[0]); 
            else 
            {
                Console.WriteLine("Skipping unexpected assignment during statement taint instrumentation {0}", assignCmd);
                return null;
            }
            if (expr == null) return null; 
            var iteArgs = new List<Expr>() { IdentifierExpr.Ident(bConst), glob, expr};
            rhss.Add(new NAryExpr(Token.NoToken, new IfThenElse(Token.NoToken), iteArgs));
            return new AssignCmd(Token.NoToken, lhss, rhss);
        }

        private Expr CollectMapAssignment(IdentifierExpr glob, Expr expr)
        {
            //expr is of the form update(a, i:int, v:int)
            var nExpr = expr as NAryExpr;
            if (nExpr == null) return null;
            if (!(nExpr.Fun is MapStore &&
                nExpr.Args.Count == 3 &&
                nExpr.Args[1].Type.IsInt &&
                nExpr.Args[2].Type.IsInt)) return null;
            return new NAryExpr(Token.NoToken, new FunctionCall(collectMapFunc), new List<Expr>() { glob, nExpr.Args[1], nExpr.Args[2] });
        }

        private Expr CollectIntAssignment(IdentifierExpr glob, Variable assignedVar)
        {
            return new NAryExpr(Token.NoToken, new FunctionCall(collectIntFunc), new List<Expr>() { glob, IdentifierExpr.Ident(assignedVar)});
        }

        private Expr CollectBooleanAssignment(IdentifierExpr glob, Variable assignedVar)
        {
            return new NAryExpr(Token.NoToken, new FunctionCall(collectBoolFunc), new List<Expr>() { glob, IdentifierExpr.Ident(assignedVar) });
        }

        private Constant LookupOrCreateNewGuardConst(AssignCmd assignCmd, Block blk)
        {
            if (guardWritesConsts.ContainsKey(assignCmd)) return guardWritesConsts[assignCmd];

            //Count number of consts with the same proc+block
            //name of the guard is a function of (proc,block,position of assign), for both versions
            var IsSameBlock = new Predicate<Constant>(c => 
              {
                var p = QKeyValue.FindStringAttribute(c.Attributes, "proc");
                if (p == null || p != currImpl.Name) return false;
                var b = QKeyValue.FindStringAttribute(c.Attributes, "blockLabel");
                if (b == null || b != blk.Label) return false;
                return true;
              });

            var count = guardWritesConsts.Where(x => IsSameBlock(x.Value)).Count();
            //Spent a few hours since the unique is default, and we have 3 boolean constants!!
            var name = currImpl.Name + "_" + blk.Label + "_" + count;
            var newConst = new Constant(Token.NoToken, new TypedIdent(Token.NoToken,  guardConstNamePrefix  + name, BType.Bool), false);
            newConst.AddAttribute(guardConstAttribute, Expr.True);
            newConst.AddAttribute("proc", currImpl.Name);
            newConst.AddAttribute("blockLabel", blk.Label);
            prog.AddTopLevelDeclaration(newConst);
            guardWritesConsts[assignCmd] = newConst;
            return newConst;
        }
    }
}
