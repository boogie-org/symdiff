call run_symdiff_c.cmd v1 v2 /showmodel /stripAbsolutePathsInBpl /nocpp /loopExtract /rvt /opts:" -recursionDepth:2000 -splitOutputEqualities " /analyzeChangedCallersOnly /genBplsOnly
call run_symdiff_bpl v1 v2 /rvt/ /opts" -usemutual -asserts -checkEquivWithDependencies -freeContracts "
call dependency.exe _v1.bpl /taint:v1\changed_lines.txt /annotateDependencies  
call dependency.exe _v2.bpl /taint:v2\changed_lines.txt /annotateDependencies  
copy /Y _v1.bpl_w_dep.bpl  _v1.bpl 
copy /Y _v2.bpl_w_dep.bpl  _v2.bpl 
call symdiff.exe -inferConfig _v1.bpl _v2.bpl > _v1_v2.config 
call symdiff.exe -allInOne _v1.bpl _v2.bpl _v1_v2.config  -usemutual -checkEquivWithDependencies -freeContracts >> v1v2.log 
call Dependency.exe v2.bpl /taint:v2\changed_lines.txt  /dacMerged:mergedProgSingle_inferred.bpl 
