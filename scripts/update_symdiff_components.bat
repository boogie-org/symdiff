REM Usage update_symdiff_components <PATH-TO-SYMDIFF-SHAREPOINT-DISTRIBUTION>
REM Expect that one has run scripts\setup.cmd from the codeplex project

@echo off

set SYMDIFF_DISTR_ROOT=%1
echo SYMDIFF_ROOT=%SYMDIFF_ROOT%

if [%SYMDIFF_ROOT%] EQU [] (
  echo set SYMDIFF_ROOT
  goto :eof
)

@echo on

call xcopy /S /Y %SYMDIFF_DISTR_ROOT%\scripts\cygwin_binaries\* %SYMDIFF_ROOT%\scripts\cygwin_binaries\

call xcopy /S /Y %SYMDIFF_DISTR_ROOT%\havoc_dlls\* %SYMDIFF_ROOT%\havoc_dlls\
