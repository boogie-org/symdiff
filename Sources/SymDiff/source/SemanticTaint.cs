using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;
using Microsoft.Boogie;
using Microsoft.Boogie.VCExprAST;
using SDiff;
using SymDiffUtils;
using Util = SymDiffUtils.Util;

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
        Util.DumpBplAST(mergedProg, "mergedProg.bpl");
      }

      private void GatherTaintGuardBoolConsts()
      {
        taintGuardConsts = new HashSet<Constant>();
        mergedProg.TopLevelDeclarations
            .OfType<Constant>()
            .Where(x => QKeyValue.FindBoolAttribute(x.Attributes, "stmtTaintConst"))
            .Iter(x => taintGuardConsts.Add(x));
      }
      private HashSet<Tuple<string,string>> GatherProcedureBlocksInConstants(IEnumerable<Constant> consts)
      {
        var GetProcedureBlock = new Func<Constant, Tuple<string,string>>(c =>
        {
          var p = QKeyValue.FindStringAttribute(c.Attributes, "proc");          
          var b = QKeyValue.FindStringAttribute(c.Attributes, "blockLabel");
          return new Tuple<string,string>(p,b);
        });
        var retHashSet = new HashSet<Tuple<string,string>>();
        consts
          .Iter(c => retHashSet.Add(GetProcedureBlock(c)));
        return retHashSet;
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

        //mapping of VCExpr
        Dictionary<VCExpr, Constant> vcexprsToConsts = new Dictionary<VCExpr, Constant>();
        taintGuardConsts.Iter(c => { vcexprsToConsts[SymDiffVC.translator.LookupVariable(c)] = c; });

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

        var core = AnalyzeUsingUnsatCoreHelper(programVC, ref cexs, ref outcome, ref preInp, assumptions);
        Console.WriteLine("\nNumber of possibly tainted stmts / number of stmts = {0}/{1}", core.Count, taintGuardConsts.Count() / 2 /* one version */);
        Console.WriteLine("\nThe list of taintedStmts are {0}", string.Join(",", core));
        var allBlks = GatherProcedureBlocksInConstants(taintGuardConsts);
        var taintedBlks = GatherProcedureBlocksInConstants(core.Select(c => vcexprsToConsts[c]));
        Console.WriteLine("\nNumber of possibly tainted blocks / number of blocks = {0}/{1}", taintedBlks.Count, allBlks.Count);

        return true;
      }
      private static List<VCExpr> AnalyzeUsingUnsatCoreHelper(VCExpr programVC, 
        ref List<Counterexample> cexs, 
        ref ProverInterface.Outcome outcome, 
        ref VCExpr preInp, List<VCExpr> assumptions)
      {
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
        var core0 = unsatClauseIdentifiers.Count() > 0 ?
          unsatClauseIdentifiers.Select(i => assumptions[i]) :
          assumptions;
        Console.Write("(upper bound on tainted after unsat core ={0}/{1})", core0.Count(), assumptions.Count()/2);
        var core = new List<VCExpr>(core0);

        //Core may not be minimal, need to iterate
        if (true)
        {
          foreach (var b in core0)
          {
            //for singleton checks, we can disable all other Booleans to only consider this equality
            var tmpAssumps = new List<VCExpr>(assumptions);
            tmpAssumps.Remove(b);
            preInp = tmpAssumps.Aggregate(VCExpressionGenerator.True, (x, y) => SymDiffVC.exprGen.And(x, y));
            preInp = SymDiffVC.exprGen.And(preInp, SymDiffVC.exprGen.Not(b)); //consider the actual output
            Console.Write(".");
            outcome = SymDiffVC.VerifyVC("RefinedStmtTaint", SymDiffVC.exprGen.Implies(preInp, programVC), out cexs);
            if (outcome == ProverInterface.Outcome.Valid)
            {
              Console.Write("*");
              core.Remove(b);
              continue;
            }
            Console.Write("/"); //possibly different
          }
        }
        return core;
      }


    }


  }
}
