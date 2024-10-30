﻿$packageName = 'msiafterburner'
$Date = Get-Date -format "yyyyMMddHHmmss"
# Define headers to prevent ERROR: Access Denied
$Headers = @{
    "accept"          ='text/html,application/xhtml+xml,application/xml'
    "accept-language" ='en'
}
$Token = Invoke-RestMethod -Uri "https://www.msi.com/api/v1/get_token?date=$Date" -Headers $Headers
$url = "https://download.msi.com/uti_exe/vga/MSIAfterburnerSetup.zip?__token__=$Token"
$checksum = '407cf0f38b4b6b3dc030e70329d35be5eabfef45829240cc6df0442768189cec'
$checksumType = 'SHA256'
$unpackDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$unpackFile = Join-Path $unpackDir 'afterburner.zip'
$pp = Get-PackageParameters
$RTSSdesktopShortcutPath = "$env:PUBLIC\Desktop\RTSS.lnk"

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

function InstallShortcut {
  param (
    $ShortcutPath
  )

  $installLocation = "${env:ProgramFiles(x86)}\RivaTuner Statistics Server"

  $shortcutArgs = @{
    shortcutFilePath = $ShortcutPath
    workingDirectory = "$installLocation"
    targetPath       = "$installLocation\RTSS.exe"
  }

  Install-ChocolateyShortcut @shortcutArgs
}

if ($pp['RTSSDesktopShortcut']) {
    InstallShortcut $RTSSdesktopShortcutPath
}
