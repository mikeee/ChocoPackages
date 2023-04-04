﻿$packageName = 'msiafterburner'
$url = 'http://download.msi.com/uti_exe/vga/MSIAfterburnerSetup.zip?__token__=' + $(Invoke-RestMethod https://www.msi.com/api/v1/get_token?date=$(Get-Date -format "yyyyMMddHH"))
$checksum = 'd1c09f505d9483e93df5126241c209e8c871656493ce511b3238df73b3eee71f'
$checksumType = 'SHA256'
$unpackDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$unpackFile = Join-Path $unpackDir 'afterburner.zip'

Get-Process -Name 'msi afterburner' -ErrorAction SilentlyContinue | Stop-Process

Get-ChocolateyWebFile $packageName $unpackFile $url -Checksum $checksum -ChecksumType $checksumType
Get-ChocolateyUnzip -fileFullPath $unpackFile -destination $unpackDir
$file = (Get-ChildItem -Path $unpackDir -Recurse | Where-Object { $_.Name -match "^MSIAfterburnerSetup.*\.exe$" }).fullname

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
