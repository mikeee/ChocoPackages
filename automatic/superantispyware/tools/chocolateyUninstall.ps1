$packageName      = $env:ChocolateyPackageName
$installerType    = 'EXE'
$silentArgs       = '/noui /clean'
$toolsDir         = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url              = 'https://www.superantispyware.com/downloads/SASUNINST.EXE'
$checksum         = '0bc49dea91079a174f674e7ea9a2e5c953ee78498421d9d2f8ecc7f5d986545d'
$url64            = 'https://www.superantispyware.com/downloads/SASUNINST64.EXE'
$checksum64       = 'e339e8cd8d255b216bcb09102a30e854cd98ce756611c48cca5d55e5751f3ce9'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath "$toolsDir\SASUNINST.exe" -Url $url -Url64bit $url64 -Checksum $checksum -Checksum64 - $checksum64

Uninstall-ChocolateyPackage $packageName $installerType $silentArgs "$toolsDir\SASUNINST.exe"

Remove-Item -Path $toolsDir -Recurse -Force
