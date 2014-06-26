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

Run Regressions
---------------
1. Open a VS command prompt
2. Run \scripts\setup.cmd
3. Run \SymDiff\Test\run_regressions.cmd 
