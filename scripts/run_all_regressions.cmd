@echo off

REM Set paths 
set PYTHON=c:\python33\

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