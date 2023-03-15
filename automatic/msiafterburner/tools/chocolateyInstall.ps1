$packageName = 'msiafterburner'
$url = 'http://download.msi.com/uti_exe/vga/MSIAfterburnerSetup.zip?__token__=' + $(Invoke-RestMethod https://www.msi.com/api/v1/get_token?date=$(Get-Date -format "yyyyMMddHH"))
$checksum = ''
$checksumType = 'sha256'
$unpackDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$unpackFile = Join-Path $unpackDir 'afterburner.zip'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

Get-ChocolateyWebFile $packageName $unpackFile $url -Checksum $checksum -ChecksumType $checksumType
Get-ChocolateyUnzip -fileFullPath $unpackFile -destination $unpackDir
$file = (Get-ChildItem -Path $unpackDir -Recurse | Where-Object { $_.Name -match "^MSIAfterburnerSetup.*\.exe$" }).fullname

Stop-Afterburner

$packageArgs = @{
  PackageName    = $packageName
  FileType       = 'exe'
  File           = $file
  File64         = $file
  SilentArgs     = '/S'
  ValidExitCodes = @(0)
}
Install-ChocolateyInstallPackage @packageArgs

Remove-Item $unpackFile -Recurse -Force
Remove-Item $file -Recurse -Force