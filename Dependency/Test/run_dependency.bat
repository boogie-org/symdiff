@echo off

REM USAGE: run_dependency.bat

setlocal

set oldDir= %~dp0
set DEPEXE= %oldDir%\..\bin\debug\Dependency.exe

call :RunWithOption " /readSet " "readSet"

call :RunWithOption " /refine:2 /prune  /timeout:10000  /detStubs /noMinUnsatCore " "2.detstubs.nominunsat"
call :RunWithOption " /refine:2 /prune  /timeout:10000            /noMinUnsatCore " "2.nominunsat"

call :RunWithOption " /refine:2 /prune  /timeout:10000  /detStubs                 " "2.detstubs"
call :RunWithOption " /refine:2 /prune  /timeout:10000                            " "2"

call :RunWithOption " /refine:3 /prune  /timeout:10000  /detStubs /noMinUnsatCore "  "3.detstubs.nominunsat"
call :RunWithOption " /refine:4 /prune  /timeout:10000  /detStubs /noMinUnsatCore "  "4.detstubs.nominunsat"

goto end


:RunWithOption


for %%f in ("siemens\\tcas" "siemens\\print_tokens" "siemens\\replace" "siemens\\schedule" "siemens\\print_tokens2" "siemens\\tot_info" "space") do (
  echo.
  echo -------------------------------------------------------------
  echo -------------------- rUNNING %%f with %1 --------------------
  echo -------------------------------------------------------------
  pushd %%f
  %DEPEXE% source.bpl "%1"   
  move source.bpl.html source.bpl.%2.html
  popd
)

goto:EOF

:end

exit


