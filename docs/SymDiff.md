# Usage
* Run **SymDiff.exe** without any options to see the usage. Run {"SymDiff.exe option"} to see more details of each option (e.g. SymDiff.exe -allInOne)

## Using {"run_symdiff_bpl.cmd"} script
Running SymDiff.exe involves several other setup steps such (a) extracting loops as procedures or unrolling them, (b) generating a mapping between two bpl files, (c) running taint analysis (optional), (d) running Boogie.exe to perform contract inference etc. The helper script **{"scripts\run_symdiff_bpl.cmd"}** automates many of these tasks. Run **{"scripts\run_symdiff_bpl.cmd"}**  without any arguments to see the various options. 
* **{"symdiff\test\run_regressions.cmd"}** has the most updated usage of **{"run_symdiff_bpl.cmd"}** script

Here are some common usage scenarios. In all cases, we assume that we have two bpl files **v1.bpl** and **v2.bpl**. 

* Basic symdiff.exe (modular) to check for **equivalence** modularly
	* _{"run_symdiff_bpl.cmd v1 v2_ [options](options) "}_

* Nonmodular. This option performs _bounded_ **equivalence** verification by unrolling loops and recursion upto **recursionDepth** flag. It only compares _root_ procedures that have no callers (there can be multiple roots).  The (optional) **splitOutputEqualities** produces as many counterexamples as many output variables that differ, and (optional) **outvar** allows comparing outputs matching the pattern. 
	* _{"run_symdiff_bpl v1 v2 /rvt /opts:"  -nonmodular -recursionDepth:3 -splitOutputEqualities  -outvar:\"control\" " "}_
	* findstr /C:"Verifier" v1v2.log //shows procedures and number of outputs that differ

* Perform **equivalence checking** using DAC ([FSE'13](http://research.microsoft.com/apps/pubs/default.aspx?id=193772)) encoding (**usemutual** flag). This is **sound** for loops and recursion. 
	* _{"run_symdiff_bpl v1 v2 /rvt /opts:" -usemutual -checkEquivWithDependencies -freeContracts "  "} _
	* findstr /C:"_houdini" v1v2.log
	* Interpreting the output
		* You may see the following, but it does not mean all pairs of procedures are equivalent
		
			`Houdini finished and inferred 66/84 contracts`
			
			`Houdini finished with 24 verified, 0 errors, 0 inconclusives, 0 timeouts`
			
		* SymDiff actually performs a fine-grained equivalence check with respect to each output of a method including the heap. 
		  Each relational fact is guarded by a _houdini Boolean variable, and looking at the output of `findstr /C:"_houdini" 
		  v1v2.log"` tells which of the candidates are true facts. 
		  Better yet, to determine the actual expressions inferred, look at "Houdini-Inferred DAC candidate" inside the 
		  *mergedProgSingle_inferred.bpl* file.

* Perform **Differential Assertion Checking** using **DAC** and **Houdini** ([FSE'13](http://research.microsoft.com/apps/pubs/default.aspx?id=193772)) encoding (**usemutual** flag). This is **sound** for loops and recursion. 
	* _{"run_symdiff_bpl v1 v2 /rvt /opts:" -usemutual -asserts -freeContracts " "} _
	* findstr /C:"Houdini finished" v1v2.log

* Checking **mutual summary specifications** using **DAC** and **predicate abstraction**
	* Follow instructions in **{"test\resilience\approx_feb_2015\README_absHoudini"}**

* Using **Corral**. This option performs _bounded_ verification by invoking [Corral](http://corral.codeplex.com), after performing DAC ([FSE'13](http://research.microsoft.com/apps/pubs/default.aspx?id=193772)) encoding (**usemutual** flag). It requires a single _root_ procedure, usually main. 
	* _{"run_symdiff_bpl.cmd v1 v2 /rvt /opts:" -usemutual -checkEquivWithDependencies -freeContracts -callCorralOnMergedProgram " "}_
	* findstr /C:"Checking True bugs" v1v2.log //shows which variables differ

* **Taint analysis based pruning**. Many of these options can be combined with a static analysis (in dependency.exe) that can perform static taint analysis to remove checks for variables that are not affected by the (syntactic) change. Here is how one of the options is extended. We assume two text files _{"v1_changed_lines.txt"}_ and _{"v2_changed_lines.txt"}_ that specify that changes in v1 with respect to v2 and vice versa.
	* _{"run_symdiff_bpl.cmd v1 v2 /rvt /opts:" -usemutual -checkEquivWithDependencies -freeContracts  "   /abstractNonTainted:"[v1_changed_lines.txt v2_changed_lines.txt](v1_changed_lines.txt-v2_changed_lines.txt)" "}_
	* findstr /C:"_houdini" v1v2.log
		* We often pass {"v2\changed_lines.txt"} for both {"v1_changed_lines.txt"} and {"v2_changed_lines.txt"}, if they contain the same lines modified in v1 and v2. 


