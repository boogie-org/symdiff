using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;
using Microsoft.Boogie;
using Microsoft.Boogie.VCExprAST;
using SDiff;

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
      HashSet<Constant> outputTaintedConstants; //this is the superset of tainted statements 
      public RefinedStmtTaint(Program mergedProg, Implementation eq, Implementation left, Implementation right)
      {
        this.mergedProg = mergedProg;
        eqImpl = eq; leftImpl = left; rightImpl = right;
      }
      public int PerformTaintAnalysis()
      {
        GatherTaintGuardBoolConsts();
        //inline left/right into eqImpl, callees inside left/right are already inlined
        InlineLeftAndRight();
        //generate VC for eqImpl
        AnalyzeStmtTaint();
        return 0;
      }
      private void InlineLeftAndRight()
      {
        var InlineImpl = new Action<Implementation>(i =>
        {
          i.Proc.AddAttribute("inline", Expr.Literal(1));
          i.OriginalBlocks = i.Blocks;
          i.OriginalLocVars = i.LocVars;
        });
        InlineImpl(leftImpl);
        InlineImpl(rightImpl);
        Inliner.ProcessImplementation(mergedProg, eqImpl);
        SDiff.Util.DumpBplAST(mergedProg, "mergedProg.bpl");
      }

      private void GatherTaintGuardBoolConsts()
      {
        taintGuardConsts = new HashSet<Constant>();
        mergedProg.TopLevelDeclarations
            .OfType<Constant>()
            .Where(x => QKeyValue.FindBoolAttribute(x.Attributes, "stmtTaintConst"))
            .Iter(x => taintGuardConsts.Add(x));
      }
      private void AnalyzeStmtTaint()
      {
        //Generate VC
        SymDiffVC.InitializeVCGen(mergedProg);
        VCExpr programVC = SymDiffVC.GenerateVC(mergedProg, eqImpl);
        //---- generate VC ends ---------
        if (AnalyzeUsingUnsatCore(programVC))
          Console.WriteLine("Success! Found tainted subset");
        SymDiffVC.FinalizeVCGen(mergedProg);
      }
      private bool AnalyzeUsingUnsatCore(VCExpr programVC)
      {
        #region Description of UNSAT core logic implemented below
        /*
                Given VC, B
                - pre = (\wedge_{b \in B} b)
                - checkValid preInp => VC
                - if invalid ABORT
                - A += !VC' 
                - A += B
                - if (CheckAssumption(A, out core) != valid) ABORT
                - return {b | b in core } as the (super) set of tainted vars
             */
        #endregion

        List<Counterexample> cexs;

        var outcome = SymDiffVC.VerifyVC("RefinedStmtTaint", programVC, out cexs);
        if (outcome == ProverInterface.Outcome.Valid)
        {
          Console.WriteLine("Program is already equivalent!!");
          return false;
        }

        var preInp = taintGuardConsts
            .Aggregate(VCExpressionGenerator.True, (x, y) => SymDiffVC.exprGen.And(x, SymDiffVC.translator.LookupVariable(y)));
        var newVC = SymDiffVC.exprGen.Implies(preInp, programVC);

        outputTaintedConstants = new HashSet<Constant>();
        //Should call VerifyVC before invoking CheckAssumptions
        outcome = SymDiffVC.VerifyVC("RefinedStmtTaint", newVC, out cexs);
        Console.Write("-");
        if (outcome == ProverInterface.Outcome.Invalid)
        {
          Console.WriteLine("\t VC not valid even when all assigns are off, returning");
          return false;
        }
        if (outcome == ProverInterface.Outcome.OutOfMemory ||
            outcome == ProverInterface.Outcome.TimeOut ||
            outcome == ProverInterface.Outcome.Undetermined)
        {
          Console.WriteLine("\t VC inconclusive, returning");
          return false;
        }

        var assumptions = new List<VCExpr>();
        assumptions.Add(SymDiffVC.exprGen.Not(programVC));
        //Add the list of all input constants
        taintGuardConsts.Iter(x => assumptions.Add(SymDiffVC.translator.LookupVariable(x)));

        List<int> unsatClauseIdentifiers = new List<int>();
        if (true) //in case we have to turn off the unsat core related logic
        {
          //VERY IMPORTANT: TO USE UNSAT CORE, SET ContractInfer to true in CommandLineOptions.Clo.
          outcome = ProverInterface.Outcome.Undetermined;
          outcome = SymDiffVC.proverInterface.CheckAssumptions(assumptions, out unsatClauseIdentifiers, SymDiffVC.handler);
          Debug.Assert(outcome == ProverInterface.Outcome.Valid);
          Console.Write("+");
          Debug.Assert(unsatClauseIdentifiers.Count() > 0, "Something went wrong! Unsat core with 0 elements");
          //newVC should be always at 0, since it has to participate in inconsistency
          Debug.Assert(unsatClauseIdentifiers.Remove(0), "Something went wrong! The VC itself is not part of UNSAT core");
        }

        //Core may not be minimal, need to iterate
        var core0 = unsatClauseIdentifiers.Count() > 0 ?
          unsatClauseIdentifiers.Select(i => assumptions[i]) :
          assumptions; 

        var core = new List<VCExpr>(core0);
        if (true)
        {
          core0
              .Iter(b =>
              {
                core.Remove(b);
                preInp = core.Aggregate(VCExpressionGenerator.True, (x, y) => SymDiffVC.exprGen.And(x, y));
                outcome = SymDiffVC.VerifyVC("RefinedStmtTaint", SymDiffVC.exprGen.Implies(preInp, programVC), out cexs);
                Console.Write(".");
                if (outcome != ProverInterface.Outcome.Valid)
                {
                  core.Add(b);
                  return;
                }
              });
        }
        Console.WriteLine("The list of taintedStmts are {0}", string.Join(",", core));
        return true;
      }

    }


  }
}
