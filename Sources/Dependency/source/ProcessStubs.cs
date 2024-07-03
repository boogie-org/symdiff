using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Boogie;
using System.Diagnostics;
using SymDiffUtils;
using Util = SymDiffUtils.Util;

namespace Dependency.source
{
    /// <summary>
    /// Eliminate stubs by updating return, outs, mods deterministically
    /// Adding a new global foo_det_ctr per stub in the read/write set
    /// There should not be any stubs in rest of the dependency/symdiff!!!
    /// </summary>
    public class ProcessStubs
    {
        Program prog;
        public ProcessStubs(Program p) { prog = p; }
        public Program EliminateStubs()
        {
            Debug.Assert(!prog.TopLevelDeclarationsAreFrozen, "Frozen top level decls");
            var procs = new HashSet<Procedure>(prog.Procedures);
            var impls = prog.Implementations;

            var stubs = procs.Where(p => impls.Where(i => i.Name == p.Name).Count() == 0);
            var stubImpls = new List<Implementation>(stubs.Select(p => MkStubImpl(p))); //need to have new List(){..}
            Console.WriteLine("Stubimpls = {0}", string.Join(",", stubImpls.Select(x => x.Name))); 
            stubImpls.Iter(i => Debug.Assert(prog.TopLevelDeclarations.Contains(i)));

            //inline all the stubs
            Console.WriteLine("Inlining all stubs");
            Expr one = Expr.Literal(1);
            stubImpls.Iter(i => { i.AddAttribute("inline", one); i.Proc.AddAttribute("inline", one); });
            Util.InlineProg(prog);
            prog.Resolve();
            stubImpls.Iter(i => { prog.RemoveTopLevelDeclaration(i); prog.RemoveTopLevelDeclaration(i.Proc); });
            prog.Resolve();
            //some weird issue with dependency.exe (no return encountered in dac_examples\madwifi 7/13/15). persisting and reading back
            var sibpl = "__stub_inlined.bpl";
            Utils.PrintProgram(prog, sibpl);
            Console.WriteLine("Printed stub inlined program to {0}", sibpl);
            if (!Utils.ParseProgram(sibpl, out prog))
            {
                Debug.Assert(false, "Unable to parse the program in after inlining stub " + sibpl);
            }
            return prog;
        }
        private Implementation MkStubImpl(Procedure p)
        {
            //add a global var p_det_ctr
            var ctr = new GlobalVariable(Token.NoToken,
                new TypedIdent(Token.NoToken, p.Name + "__det_ctr", Microsoft.Boogie.Type.Int));
            prog.AddTopLevelDeclaration(ctr);
            prog.Resolve();

            var inParams = new List<Variable>(p.InParams);
            var outParams = new List<Variable>(p.OutParams);

            //make the body
            //let in = (inParms U modifies U ctr)
            var ins = new List<Expr>();
            ins.AddRange(inParams.Select(x => Expr.Ident(x)));
            ins.AddRange(p.Modifies);
            ins.Add(Expr.Ident(ctr));
            //x, .. := uf_p_x(in), ..
            
            var mkUifExpr = new Func<Variable, Expr> (v => 
            {
                var ithVar = new Func<Expr, int,Variable>((e,j) => 
                    new Formal(Token.NoToken, new TypedIdent(Token.NoToken, "arg" + j, e.Type), true));
                var f = new Function(Token.NoToken, 
                    "_stub_upd_" + p.Name + "_" + v.Name, //func name
                    ins.Select((e,i) => ithVar(e, i)).ToList(), 
                    new Formal(Token.NoToken, new TypedIdent(Token.NoToken, "ret", v.TypedIdent.Type), false));
                prog.AddTopLevelDeclaration(f); prog.Resolve();
                var r =
                    new NAryExpr(Token.NoToken,
                        new FunctionCall(f),
                        ins);
                return r;
            });
            //outs = (return U outs U ctr)
            var outs = new List<Variable>();
            outs.AddRange(outParams);
            outs.AddRange(p.Modifies.Select(o => o.Decl));
            outs.Add(ctr);
            //rhss
            var rhss = new List<Expr>(outs.Select(o => mkUifExpr(o)));
            var lhss = new List<AssignLhs>(outs.Select(o => new SimpleAssignLhs(Token.NoToken, Expr.Ident(o))));
            var ac = new AssignCmd(Token.NoToken, lhss, rhss);
            var blk = new Block(Token.NoToken, "START_STUB_" + p.Name, new List<Cmd>() { ac }, new ReturnCmd(Token.NoToken));
            //make an impl
            var impl = new Implementation(Token.NoToken, p.Name, 
                new List<TypeVariable>(),
                inParams,
                outParams, 
                new List<Variable>(), //no locals
                new List<Block>(){blk});
            impl.Proc = p;
            prog.AddTopLevelDeclaration(impl);
            prog.Resolve();
            return impl;
        }
    }
}
