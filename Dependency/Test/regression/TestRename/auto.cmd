call run_symdiff_c.cmd v1 v2 /nocpp /rvt /nohtml /genBplsOnly /analyzeChangedCallersOnly /stripAbsolutePathsInBpl

call run_symdiff_bpl v1 v2 /rvt /opts:" -usemutual -asserts -checkEquivWithDependencies -freeContracts "

call Dependency.exe _v2.bpl /taint:v2\changed_lines.txt /prune /dacMerged:mergedProgSingle_inferred.bpl
