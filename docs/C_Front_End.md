**This is mostly a preliminary placeholder for running the new SymDiff dlls with C front end.  The instructions will be cleaned up to use the latest C front end dlls soon. **

* Download and install (existing) SymDiff binaries for C front end from [SymDiff Binary](http://research.microsoft.com/en-us/projects/symdiff/default.aspx) into a directory (e.g. {"c:\symdiff_binaries"})
* Make sure that examples run with the downloaded binary (e.g. examples\ex3)
	* Note that the **makefile** needs to have the line {"/analyze:plugin  $(HAVOC_DLL_DIR)\EspFe.dll /analyze:log d.xml"} as argument (see examples\ex3\v1\makefile)
* Go to the directory where SymDiff Codeplex sources are installed (e.g. {"c:\symdiff_codeplex\symdiff"})
* Run {"scripts\update_symdiff_components.bat c:\symdiff_binaries\symdiff"}
	* This step will copy the dlls and scripts required to compile C files to BPL files
* Run {"c:\symdiff_codeplex\symdiff\scripts\run_symdiff_c.cmd"}