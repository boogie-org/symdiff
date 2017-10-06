This page describes the usage options of SymDiff for Change-Semantic Aware Change-Impact Analysis.

To run DCIA without any equivalence relations:
**Dependency.exe**  v2.bpl /taint:changed_lines.txt /prune

To run SymDiff to infer equivalence relations:
**run_symdiff_bpl.cmd** v1 v2, /rvt /opts:" -usemutual -asserts -checkEquivWithDependencies -freeContracts -dacEncodingLinear -dacConsiderChangedProcOnly" /changedLines

To run SymDiff to infer equivalence relations only up to level **k** around the changed procedure:
**run_symdiff_bpl.cmd** v1 v2 /rvt /opts:" -usemutual -asserts -checkEquivWithDependencies -freeContracts -dacEncodingLinear **-dacConsiderChangedProcsUptoDistance:k**" /changedLines /annDep

To run SEM-DCIA using the inferred equivalences:
**Dependency.exe** _v2.bpl /taint:changed_lines.txt /dacMerged:mergedProgSingle_inferred.bpl /prune
