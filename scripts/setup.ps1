#Set environment variables for Visual Studio Command Prompt
$pathToVS = 'C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC'
if (!(test-path $pathToVS))
{
	write-host "Could not set Visual Studio Command Prompt variables (expected path = " $pathToVS "). Exiting." -ForegroundColor Red
	exit
} 
pushd $pathToVS 
cmd /c "vcvarsall.bat&set" |
foreach {
  if ($_ -match "=") {
    $v = $_.split("="); set-item -force -path "ENV:\$($v[0])"  -value "$($v[1])"
  }
}
popd
write-host "`nVisual Studio Command Prompt variables set." -ForegroundColor Yellow

$0 = $myInvocation.MyCommand.Definition
$dp0 = [System.IO.Path]::GetDirectoryName($0)
$env:SYMDIFF_ROOT = $dp0 + "\.."

$env:PATH = $env:PATH + ";"
$env:PATH = $env:PATH + $env:SYMDIFF_ROOT + "\scripts;"
$env:PATH = $env:PATH + $env:SYMDIFF_ROOT + "\scripts\cygwin_binaries;"
$env:PATH = $env:PATH + $env:SYMDIFF_ROOT + "\SymDiff\bin\x86\Debug\;"
$env:PATH = $env:PATH + $env:SYMDIFF_ROOT + "\BoogieWrapper\bin\Debug;"
$env:PATH = $env:PATH + $env:SYMDIFF_ROOT + "\Dependency\bin\Debug;"
$env:PATH = $env:PATH + $env:SYMDIFF_ROOT + "\SymDiff\references;"

$env:HAVOC_DLL_DIR = $env:SYMDIFF_ROOT + "\havoc_dlls\"
$env:HAVOCFECONFIG = $env:SYMDIFF_ROOT + "\havoc_dlls\havoc.config"
$env:CYGWIN = "nodosfilewarning"