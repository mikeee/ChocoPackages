$packageName      = $env:ChocolateyPackageName
$installerType    = 'EXE'
$silentArgs       = '/noui /clean'
$validExitCodes   = @(0)
$path             = "$env:ProgramFiles\SUPERAntiSpyware"
$path86           = "${env:ProgramFiles(x86)}\SUPERAntiSpyware"
$toolsDir         = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url              = 'https://www.superantispyware.com/downloads/SASUNINST.EXE'
$checksum         = ''
$url64            = 'https://www.superantispyware.com/downloads/SASUNINST64.EXE'
$checksum64       = ''

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath "$toolsDir\SASUNINST.exe" -Url $url -Url64bit $url64 -Checksum $checksum -Checksum64 - $checksum64

Uninstall-ChocolateyPackage $packageName $installerType $silentArgs "$toolsDir\SASUNINST.exe"

Remove-Item -Path $toolsDir -Recurse -Force