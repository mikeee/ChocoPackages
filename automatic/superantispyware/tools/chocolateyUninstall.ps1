$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    installerType    = 'EXE'
    silentArgs       = '/noui /clean'
    validExitCodes   = @(0)
    path             = "$env:ProgramFiles\SUPERAntiSpyware"
    path86           = "${env:ProgramFiles(x86)}\SUPERAntiSpyware"
    toolsDir = "C:\tools"
}

if (Test-Path $path) {
    Invoke-WebRequest -Uri "https://www.superantispyware.com/downloads/SASUNINST.EXE" -OutFile $toolsDir
    Uninstall-ChocolateyPackage $packageName $installerType $silentArgs "$toolsDir\SASUNINST.exe"
    Remove-Item -Path "$toolsDir\SASUNINST.exe"
}

if (Test-Path $path86) {
    Invoke-WebRequest -Uri "https://www.superantispyware.com/downloads/SASUNINST64.EXE" -OutFile $toolsDir
    Uninstall-ChocolateyPackage $packageName $installerType $silentArgs "$toolsDir\SASUNINST64.exe"
    Remove-Item -Path "$toolsDir\SASUNINST64.exe"
}