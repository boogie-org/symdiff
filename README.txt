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
5. Install Z3.exe (>= version 4.3) into the bin\debug of each of the .exe currently [TODO: have a central place]

Run Regressions
---------------
0. Install Python (>3.3) to be able to invoke python.exe
1. Open a VS command prompt
2. Run \scripts\setup.cmd
3. From the directory containing SymDiff.sln. 
   scripts\run_all_regressions.cmd <path-to-python>
   (e.g. scripts\run_all_regressions.cmd c:\python34)

