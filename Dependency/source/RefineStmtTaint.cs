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
using Microsoft.Basetypes;
using BType = Microsoft.Boogie.Type;

namespace Dependency
{
    /// <summary>
    /// Destructively instruments a program given a set of changed methods
    /// </summary>
    class RefineStmtTaintInstrumentation
    {
        static string globalCollectAssignName = "_global_collect_assigns_for_stmt_taint";
        static string globalCollectAssignVarAttribute = "stmtTaintCollectorGlobalVar";
        static string guardConstNamePrefix = "_stmtTaintConst_";
        static string guardConstAttribute = "stmtTaintConst";
        Program prog;
        HashSet<Implementation> syntacticModifiedImpls;
        Dictionary<AssignCmd, Constant> writeCollectorGuardConstants; //these are Boolean constants that will be used in unsat core
        GlobalVariable globalCollectAssignmentsVar; //a global variable to collect the assignments
        Function collectBoolFunc, collectIntFunc, collectMapFunc; //functions to accumulate out := f(out, assign)
        public RefineStmtTaintInstrumentation(Program prog, HashSet<Implementation> modifiedImpls)
        {
            this.prog = prog;
            syntacticModifiedImpls = modifiedImpls;
            writeCollectorGuardConstants = new Dictionary<AssignCmd, Constant>();
            globalCollectAssignmentsVar = new GlobalVariable(Token.NoToken,
                new TypedIdent(Token.NoToken, globalCollectAssignName, BType.Int));
            globalCollectAssignmentsVar.AddAttribute(globalCollectAssignVarAttribute, Expr.True);
            prog.AddTopLevelDeclaration(globalCollectAssignmentsVar);
            InitializeFuncs();
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
        public void Instrument()
        {
            var impls = prog.TopLevelDeclarations.OfType<Implementation>();
            impls.Iter(impl =>
                {
                    //TODO: refine the map for changed procedures as well
                    if (syntacticModifiedImpls.Contains(impl)) return;
                    InstrumentImpl(impl);
                });
        }
        private void InstrumentImpl(Implementation impl)
        {
            var InstrumentCmd = new Func<Cmd, Cmd> (c =>
            {
                if(c is AssignCmd) return InstrumentAssignCmd(c as AssignCmd);
                if (c is CallCmd)  return InstrumentCallCmd(c as CallCmd);
                return null;
            });

            var InstrumentBlockCmds = new Func<List<Cmd>, List<Cmd>>(cmds =>
            {
                var newCmds = new List<Cmd>();
                cmds.Iter(c => 
                { 
                    newCmds.Add(c);  
                    var d = InstrumentCmd(c);
                    if (d != null) newCmds.Add(d);
                });
                return newCmds;
            });

            impl.Blocks.Iter(b => { b.Cmds = InstrumentBlockCmds(b.Cmds); });
        }

        private Cmd InstrumentCallCmd(CallCmd callCmd)
        {
            throw new NotImplementedException();
        }

        private Cmd InstrumentAssignCmd(AssignCmd assignCmd)
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
            var bConst = LookupOrCreateNewGuardConst(assignCmd);
            lhss.Add(new SimpleAssignLhs(Token.NoToken, glob));
            Expr expr;
            var assignType = assignedVar.TypedIdent.Type;
            if (assignType.IsBool)
                expr = CollectBooleanAssignment(glob, assignedVar); 
            else if (assignType.IsInt)
                expr = CollectIntAssignment(glob, assignedVar);
            else if (assignType.IsMap)
                expr = CollectMapAssignment(glob, rhss[0]); 
            else 
            {
                Console.WriteLine("Skipping unexpected assignment during statement taint instrumentation {0}", assignCmd);
                return null;
            }
            var iteArgs = new List<Expr>() { IdentifierExpr.Ident(bConst), glob, expr};
            rhss.Add(new NAryExpr(Token.NoToken, new IfThenElse(Token.NoToken), iteArgs));
            return new AssignCmd(Token.NoToken, lhss, rhss);
        }

        private Expr CollectMapAssignment(IdentifierExpr glob, Expr expr)
        {
            throw new NotImplementedException();
            //expr is of the form update(a, i, v)
            var nExpr = expr as NAryExpr; 

        }

        private Expr CollectIntAssignment(IdentifierExpr glob, Variable assignedVar)
        {
            return new NAryExpr(Token.NoToken, new FunctionCall(collectIntFunc), new List<Expr>() { glob, IdentifierExpr.Ident(assignedVar)});
        }

        private Expr CollectBooleanAssignment(IdentifierExpr glob, Variable assignedVar)
        {
            return new NAryExpr(Token.NoToken, new FunctionCall(collectBoolFunc), new List<Expr>() { glob, IdentifierExpr.Ident(assignedVar) });
        }

        private Constant LookupOrCreateNewGuardConst(AssignCmd assignCmd)
        {
            if (writeCollectorGuardConstants.ContainsKey(assignCmd)) return writeCollectorGuardConstants[assignCmd];
            var count = writeCollectorGuardConstants.Count;
            var newConst = new Constant(Token.NoToken, new TypedIdent(Token.NoToken,  guardConstNamePrefix + count, BType.Bool));
            newConst.AddAttribute(guardConstAttribute, Expr.True);
            prog.AddTopLevelDeclaration(newConst);
            writeCollectorGuardConstants[assignCmd] = newConst;
            return newConst;
        }
    }
}
