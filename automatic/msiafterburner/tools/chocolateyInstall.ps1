$ErrorActionPreference = 'Stop'

. (Join-Path $PSScriptRoot 'Get-MsiAfterburnerDownloadUrl.ps1')

$packageName = 'msiafterburner'
$url = Get-MsiAfterburnerDownloadUrl
$checksum = '4478E031D9954E5EB830CB0F3486AF2949C411DEE84EB134E31E363FB48FE439'
$checksumType = 'SHA256'
$unpackDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$unpackFile = Join-Path $unpackDir 'afterburner.zip'
$pp = Get-PackageParameters
$RTSSdesktopShortcutPath = "$env:PUBLIC\Desktop\RTSS.lnk"

Get-Process -Name 'msi afterburner' -ErrorAction SilentlyContinue | Stop-Process

Get-ChocolateyWebFile $packageName $unpackFile $url -Checksum $checksum -ChecksumType $checksumType
Get-ChocolateyUnzip -fileFullPath $unpackFile -destination $unpackDir
$installerFiles = @(Get-ChildItem -Path $unpackDir -Recurse |
  Where-Object { $_.Name -match '^MSIAfterburner(?:Setup|Installer).+\.exe$' })
if ($installerFiles.Count -ne 1) {
  throw "Archive contained $($installerFiles.Count) matching installers; expected exactly one"
}
$file = $installerFiles[0].FullName

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
Remove-Item $file -Force

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
