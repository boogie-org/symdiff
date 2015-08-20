@echo off

REM Example to test inlining and DAC


@echo on

run_symdiff_bpl.cmd v0 v1 /rvt /coarseDiff /opts:" -usemutual -checkEquivWithDependencies -freeContracts  -inlineDepthInferContracts:2 " /changedLines 

REM Changing the inlineDepthInferContracts from {0, 1, 2}
REM Inferred contracts: inlineDepth = 0, 5/15 inferred
REM Inferred contracts: inlineDepth = 1, 13/15 inferred
REM Inferred contracts: inlineDepth = 2, 13/15 inferred

