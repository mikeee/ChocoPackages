$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    installerType    = 'EXE'
    silentArgs       = '/noui /clean'
    path             = "$env:ProgramFiles\SUPERAntiSpyware"
    path86           = "${env:ProgramFiles(x86)}\SUPERAntiSpyware"
    validExitCodes   = @(0)
}

if (Test-Path $path) {
    Uninstall-ChocolateyPackage $packageName $installerType $silentArgs "$path\uninstall.exe"
}

if (Test-Path $path86) {
    Uninstall-ChocolateyPackage $packageName $installerType $silentArgs "$path86\uninstall.exe"
}