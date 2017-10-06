## Prerequisites
* Download and build Boogie [https://github.com/boogie-org/boogie](https://github.com/boogie-org/boogie). The binaries are placed in <boogie-dir>\Binaries directory.
	* The compatible Boogie version is maintained in references\BoogieRev.txt
* Run **references\updateboogie.bat <boogie-dir>\binaries** 
* (Optional) Download and build Corral [http://corral.codeplex.com](http://corral.codeplex.com). Let the top-level directory be <corral-root>
	* The compatible Corral version is maintained in references\CorralRev.txt
* (Optional) Run **references\updatecorral.bat <corral-root>** 
* Install Z3 [http://z3.codeplex.com](http://z3.codeplex.com) binaries 
	* Copy Z3.exe (>= version 4.1) into the references\, bin\x86\debug (symdiff) and {dependency, rootcause}\bin\debug\  //TODO: keep in a centralized area
	* Z3 4.1 is currently needed for Rootcause. //TODO: fix prover errors related to 'relax_0' variables

## Installation

* Clone a copy of the source code 
* Open SymDiff.sln in Visual Studio 2013 and build "Debug" version
* Run **scripts\setup.cmd**
* The SymDiff binary is located under **symdiff\bin\x86\Debug\SymDiff.exe**
* The Dependency binary is located under **dependency\bin\Debug\dependency.exe**

## Run regressions
* Go to symdiff\test\ directory
* Run **run_regressions.cmd -c**
	* Corral regressions will fail unless Corral is installed

[SymDiff](SymDiff.md)

[Dependency](Dependency.md)

[Rootcause](Rootcause.md)

[Change-Impact](Change-Impact.md)

## C front end (preliminary)
[C Front End](C-Front-End.md)




