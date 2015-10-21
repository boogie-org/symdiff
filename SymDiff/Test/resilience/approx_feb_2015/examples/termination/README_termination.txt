Run RT checking:
run_symdiff_bpl.cmd v1 v2 /rvt /opts:"-usemutual -useMutualSummariesAsAxioms -freeContracts -doRTCheck /altMSFile:ms_symdiff_file_new.bpl"

Run Boogie:
boogie.exe mergedProgSingle.bpl /proc:RT_Check*
