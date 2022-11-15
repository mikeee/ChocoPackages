$packageName      = $env:ChocolateyPackageName
$installerType    = 'EXE'
$silentArgs       = '/noui /clean'
$validExitCodes   = @(0)
$path             = "$env:ProgramFiles\SUPERAntiSpyware"
$path86           = "${env:ProgramFiles(x86)}\SUPERAntiSpyware"
$toolsDir         = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath "$toolsDir\SASUNINST64.exe" -Url 'https://www.superantispyware.com/downloads/SASUNINST.EXE' -Url64bit 'https://www.superantispyware.com/downloads/SASUNINST64.EXE'

if (Test-Path $path) {
    Uninstall-ChocolateyPackage $packageName $installerType $silentArgs "$toolsDir\SASUNINST64.exe"
}

if (Test-Path $path86) {
    Uninstall-ChocolateyPackage $packageName $installerType $silentArgs "$toolsDir\SASUNINST.exe"
}

Remove-Item -Path $toolsDir -Recurse -Force