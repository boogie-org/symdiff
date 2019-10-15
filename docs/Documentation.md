## Prerequisites
* Install [Z3 binary](https://github.com/Z3Prover/z3/releases) and copy Z3.exe (>= version 4.1) into the **SymDiff\bin\x86\debug** and {dependency, rootcause}\bin\debug\  //TODO: keep in a centralized area
	* Z3 4.1 is currently needed for Rootcause. //TODO: fix prover errors related to 'relax_0' variables

* (Optional) Download and build Corral [http://corral.codeplex.com](http://corral.codeplex.com). Let the top-level directory be <corral-root>
	* The compatible Corral version is maintained in references\CorralRev.txt
	* Run **references\updatecorral.bat <corral-root>** 

## Installation

* Clone a copy of the source code 
* Update [Boogie](https://github.com/boogie-org/boogie) submodule and copy the binaries
  - `git submodule update --init --recursive`
  - `references\updateboogie.bat BoogieSubmodule\\Binaries`

* Open SymDiff.sln in Visual Studio 2013 and build "Debug" version
* (Windows only) Run `scripts\setup.cmd`
* The SymDiff binary is located under **symdiff\bin\x86\Debug\SymDiff.exe**
* The Dependency binary is located under **dependency\bin\Debug\dependency.exe**

## Run regressions
* Go to symdiff\test\ directory
* Run **run_regressions.cmd -c**
	* Corral regressions will fail unless Corral is installed

[SymDiff](SymDiff.md)

[Dependency](Dependency.md)

[Rootcause](Rootcause.md)

[Change-Impact](Change_Impact.md)

## C front end (preliminary)
[C Front End](C_Front_End.md)




