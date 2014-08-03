@echo off

REM USAGE run_all_regressions.cmd <PATH-TO-PYTHON> 
REM e.g. run_all_regressions.cmd c:\python34\

REM Set paths 
REM set PYTHON=c:\python33\
set PYTHON=%1

REM Don't change below this line

echo #######################
echo SymDiff regressions....
echo #######################
pushd Symdiff\Test\
call run_regressions.cmd -c
popd

echo #######################
echo Rootcause regressions....
echo #######################
pushd Rootcause\Test\equivalence\
call %PYTHON%\python.exe -u regression.py regression.cmdopt
popd