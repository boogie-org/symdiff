using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;
using Microsoft.Boogie;
using Microsoft.Boogie.VCExprAST;

//This file contains various routines for performing taint related analysis
namespace SymDiff
{
    public class SemanticTaint
    {

        public class RefinedStmtTaint
        {
            Program mergedProg;
            Implementation eqImpl, leftImpl, rightImpl;
            HashSet<Constant> taintGuardConsts; 
            public RefinedStmtTaint(Program mergedProg, Implementation eq, Implementation left, Implementation right) 
            { 
                this.mergedProg = mergedProg;
                eqImpl = eq; leftImpl = left; rightImpl = right;
            }
            public int PerformTaintAnalysis() 
            {
                SDiff.Util.DumpBplAST(mergedProg, "mergedProg.bpl");
                GatherTaintGuardBoolConsts();
                //inline left/right into eqImpl, callees inside left/right are already inlined
                InlineLeftAndRight();
                //generate VC for eqImpl
                VCExpr vcExpr = GenerateVC();
                throw new NotImplementedException(); 
            }

            private VCExpr GenerateVC()
            {
                throw new NotImplementedException();
            }
            private void InlineLeftAndRight()
            {
                throw new NotImplementedException();
            }

            private void GatherTaintGuardBoolConsts()
            {
                taintGuardConsts = new HashSet<Constant>();
                mergedProg.TopLevelDeclarations
                    .OfType<Constant>()
                    .Where(x => QKeyValue.FindBoolAttribute(x.Attributes, "stmtTaintConst"))
                    .Iter(x => taintGuardConsts.Add(x));
            }
        }


    }
}
