$packageName      = $env:ChocolateyPackageName
$installerType    = 'EXE'
$silentArgs       = '/noui /clean'
$validExitCodes   = @(0)
$path             = "$env:ProgramFiles\SUPERAntiSpyware"
$path86           = "${env:ProgramFiles(x86)}\SUPERAntiSpyware"
$toolsDir         = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url              = 'https://www.superantispyware.com/downloads/SASUNINST.EXE'
$checksum         = '8456c509fc724251dcbe726ffcee0cb83d09311d6654d97d47eedfdbbe19e4f3'
$url64            = 'https://www.superantispyware.com/downloads/SASUNINST64.EXE'
$checksum64       = 'bae07915c906c2d335e17f130cd388dc92a134279e6963bd73907734132640b3'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath "$toolsDir\SASUNINST.exe" -Url $url -Url64bit $url64 -Checksum $checksum -Checksum64 - $checksum64

Uninstall-ChocolateyPackage $packageName $installerType $silentArgs "$toolsDir\SASUNINST.exe"

Remove-Item -Path $toolsDir -Recurse -Force
