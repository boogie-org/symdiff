## call run_symdiff_c.cmd v1 v2 /nocpp /rvt /nohtml /genBplsOnly /analyzeChangedCallersOnly /stripAbsolutePathsInBpl

..\..\..\..\SmackProcessing\bin\Debug\SmackProcessing.exe smack_v1.bpl
copy smack_v1_unsmacked.bpl v1.bpl

..\..\..\..\SmackProcessing\bin\Debug\SmackProcessing.exe smack_v2.bpl
copy smack_v2_unsmacked.bpl v2.bpl

call run_symdiff_bpl v1 v2 /rvt /opts:" -usemutual -asserts -checkEquivWithDependencies -freeContracts " /changedLines:"[v1\changed_lines.txt v2\changed_lines.txt]"

call Dependency.exe _v2.bpl /taint:v2\changed_lines.txt /prune /dacMerged:mergedProgSingle_inferred.bpl
