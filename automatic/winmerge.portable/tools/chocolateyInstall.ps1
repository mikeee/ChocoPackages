$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.60/winmerge-2.16.60-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.60/winmerge-2.16.60-x64-exe.zip'

    checksum       = 'e2609f4941bfe63a4870bdc1ae6449c58cd31db14979bd8712a7fee52ea1ec61'
    checksumType   = 'SHA256'
    checksum64     = 'be3f850ed2e450c474928ccb67d2998e812da90dea1240a46352714553342522'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

Get-ChildItem -Path $toolsDir -Filter "*.exe" -Recurse | ForEach-Object {
    $exe = $_.FullName
    if ($_.BaseName -eq 'winmergeu') {
      New-Item "${exe}.gui" -Type file -Force | Out-Null
    } else {
      New-Item "${exe}.ignore" -Type file -Force | Out-Null
    }
  }
