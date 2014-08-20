@echo off
setlocal

set DEPEXE=..\bin\debug\Dependency.exe

call :RunWithOption " /refine:2 /prune  /timeout:10000  /detStubs /noMinUnsatCore " "2.detstubs.nominunsat"
call :RunWithOption " /refine:2 /prune  /timeout:10000            /noMinUnsatCore " "2.nominunsat"

call :RunWithOption " /refine:2 /prune  /timeout:10000  /detStubs                 " "2.detstubs"
call :RunWithOption " /refine:2 /prune  /timeout:10000                            " "2"

call :RunWithOption " /refine:3 /prune  /timeout:10000  /detStubs /noMinUnsatCore "  "3.detstubs.nominunsat"
call :RunWithOption " /refine:4 /prune  /timeout:10000  /detStubs /noMinUnsatCore "  "4.detstubs.nominunsat"

goto end


:RunWithOption

for %%f in ("siemens\\tcas" "siemens\\print_tokens" "siemens\\replace" "siemens\\tot_info" "space") do (
  echo.
  echo -------------------- rUNNING %%f with %1 --------------------
  %DEPEXE% %%f\\source.bpl "%1" 
  move %%f\\source.bpl.html %%f\\source.bpl.%2.html
)

goto:EOF

:end

exit


