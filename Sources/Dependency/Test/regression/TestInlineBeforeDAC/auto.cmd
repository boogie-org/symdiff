@echo off

REM Example to test inlining and DAC


@echo on

run_symdiff_bpl.cmd v0 v1 /rvt /coarseDiff /opts:" -usemutual -checkEquivWithDependencies -freeContracts  -inlineDepthInferContracts:2 " /changedLines 

REM Changing the inlineDepthInferContracts from {0, 1, 2}
REM Inferred contracts: inlineDepth = 0, 5/15 inferred
REM Inferred contracts: inlineDepth = 1, 13/15 inferred
REM Inferred contracts: inlineDepth = 2, 13/15 inferred

//The only removals are postconditions of A, as expected

REM When using boogie directly on inlineDepth = 2, we don't infer the following
REM auto.cmd 
REM boogie /contractInfer mergedProgSingle_preInferred.bpl /trace /inlineDepth:2
REM requires {:DAC_LE _v1.y, _v2.y} _houdini_1 ==> _v1.y <= _v2.y;
REM requires {:DAC_LE _v2.y, _v1.y} _houdini_2 ==> _v2.y <= _v1.y;




