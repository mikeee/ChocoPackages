$ErrorActionPreference = 'Stop'

$path64 = "$env:ProgramFiles\Steam"
$path32 = "$env:ProgramFiles(x86)\Steam"
$uninstallpath = ""

if (Test-Path $path64) {
    $uninstallpath = $path64
} else if (Test-Path $path32) {
    $uninstallpath = $path32
}

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    installerType    = 'EXE'
    silentArgs       = '/S'
    path             = "$uninstallpath\uninstall.exe"
    validExitCodes   = @(0)
}


Uninstall-ChocolateyPackage @packageArgs