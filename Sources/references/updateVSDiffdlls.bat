:REM---
:REM To copy the Visual Studio Team Foundation VersionControl dlls
:REM
:REM
:REM C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\ReferenceAssemblies\v2.0\Microsoft.TeamFoundation.VersionControl.Client.dll
:REM C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\ReferenceAssemblies\v2.0\Microsoft.TeamFoundation.VersionControl.Common.dll
:REM C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\ReferenceAssemblies\v2.0\..\v4.5\Microsoft.TeamFoundation.VersionControl.Controls.dll
:REM 
:REM Usage updatetfsdlls.bat dir-containing-tfs-dlls\
:REM     
:REM---
copy %1\Microsoft.TeamFoundation.VersionControl.Client.dll .
copy %1\Microsoft.TeamFoundation.VersionControl.Common.dll .
copy %1\..\v4.5\Microsoft.TeamFoundation.VersionControl.Controls.dll .


