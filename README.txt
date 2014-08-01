Current directory contains

- Symdiff.sln

- Each other project SymDiff, BoogieWrapper, Rootcause, RootcauseDriver has
  source\
  Properties\
  .csproj file

- Keeping same solution to ensure other projects don't disappear/become stale

Build SymDiff
-------------
1. Download Boogie's source code from codeplex (Do not use the binary download)
2. Build Boogie
3. Use \references\updateboogie.bat to update the Boogie binaries in SymDiff
4. Build SymDiff
5. Install Z3.exe (> version 4.1) or copy z3.exe it to references\ directory

Run Regressions
---------------
1. Open a VS command prompt
2. Run \scripts\setup.cmd
3. From the directory containing SymDiff.sln. 
   scripts\run_all_regressions.cmd 

