@echo off

REM Example to test inlining and DAC


@echo on

run_symdiff_bpl.cmd v0 v1 /rvt /coarseDiff /opts:" -usemutual -checkEquivWithDependencies -freeContracts  -inlineDepthInferContracts:1 " /changedLines 

