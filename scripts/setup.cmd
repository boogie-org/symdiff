REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM EDIT THE LINE BELOW TO SET SYMDIFF_ROOT to the top-level directory
REM where SymDiff was unzipped (e.g. c:\symdiff.0.1)
REM +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM set SYMDIFF_ROOT=e:\tvm\projects\symb_diff\
set HERE=%~dp0
set SYMDIFF_ROOT=%here%..


REM ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM DO NOT EDIT THE LINES BELOW THIS LINE
REM ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
REM put the cygwin_binaries ahead of cygwin in the path (if present)
REM Put the references\ after the bin\debug since there is overlap between the dlls. 
set PATH=%SYMDIFF_ROOT%\scripts;%SYMDIFF_ROOT%\scripts\cygwin_binaries;%SYMDIFF_ROOT%\SymDiff\bin\x86\Debug\;%SYMDIFF_ROOT%\BoogieWrapper\bin\Debug\;%SYMDIFF_ROOT%\references;%SYMDIFF_ROOT%\Dependency\bin\Debug;%SYMDIFF_ROOT%\SymDiffPreProcess\bin\Debug;%SYMDIFF_ROOT%\SyntaxDiff\bin\Debug;%SYMDIFF_ROOT%\Experimental\Experimental\bin\Debug;%PATH%
set HAVOC_DLL_DIR=%SYMDIFF_ROOT%\havoc_dlls\
set HAVOCFECONFIG=%SYMDIFF_ROOT%\havoc_dlls\havoc.config
set CYGWIN=nodosfilewarning
