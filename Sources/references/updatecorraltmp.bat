:REM---
:REM Usage updatecorral.bat c:\corral_codeplex\corral
:REM---
copy %1\bin\debug\corral.exe .
copy %1\bin\debug\corralUtil.dll .
copy %1\bin\debug\corelib.dll .
copy %1\bin\debug\ProgTransformation.dll .
copy %1\addons\aliasAnalysis\aliasAnalysis\bin\debug\AliasAnalysis.exe .

