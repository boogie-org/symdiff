using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;
using Microsoft.Boogie;
using SymDiff;

namespace SDiff
{
    /// <summary>
    /// APIs for checking equivalence using Corral and inlining
    /// </summary>
    class CorralChecker
    {
        Program mergedProg;
        HashSet<Procedure> entryPoints;
        HashSet<Constant> houdiniConsts;
        //private const string corralBinary = @"d:\corral-codeplex\corral\bin\debug\corral.exe"; //TODO: use Corral library
        private const string corralBinary = @"corral.exe"; //TODO: use Corral library
        private const int corralTimeLimit = 100;
        private int corralCount;

        public CorralChecker(Program mergedProg, HashSet<Procedure> entryPoints) { 
            this.mergedProg = mergedProg; this.entryPoints = entryPoints;
            corralCount = 0;
        }
        private void FindCandidateAsserts()
        {
            houdiniConsts = new HashSet<Constant>
            (mergedProg.TopLevelDeclarations
                .OfType<Constant>()
                .Where(x => QKeyValue.FindBoolAttribute(x.Attributes, "existential")));
        }
        public void CheckCandidateAsserts()
        {
            FindCandidateAsserts();
            houdiniConsts.Iter(x => CheckCandidateAssert(x));
        }
        private void CheckCandidateAssert(Constant c)
        {
            //TODO: generalize to allow multiple roots
            Debug.Assert(entryPoints.Count() == 1, "Currently only considering a single main in mergedProgram");

            var expr = houdiniConsts
                .Where(y => y != c)
                .Aggregate((Expr)Expr.True, (x, y) => Expr.And(x, Expr.Not(IdentifierExpr.Ident(y))));
            expr = Expr.And(expr, IdentifierExpr.Ident(c));
            var axm = new Axiom(Token.NoToken, expr);
            mergedProg.AddTopLevelDeclaration(axm);
            InvokeCorralCommandLine(c);
            mergedProg.RemoveTopLevelDeclaration(axm);
        }
        private void InvokeCorralCommandLine(Constant c)
        {
            string filename = string.Format("mergedProgSingle_{0}.bpl", corralCount++);
            Util.DumpBplAST(mergedProg, filename);
            string args = string.Format(" {0} /k:1 /main:{1} /recursionBound:4 /timeLimit:{2} /noTrace ", filename, entryPoints.First().Name, corralTimeLimit);
            Console.WriteLine("Checking {0} using Corral....", c.Name);
            var output = Util.ExecuteBinary(corralBinary, args);
            Console.WriteLine("\nOutput of Corral for {1} = {0}", output, c.Name);
        }
    }
}
