$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.13/winmerge-2.16.13-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.13/winmerge-2.16.13-x64-exe.zip'

    checksum       = '9bfb02f60776a0d1bd2f1ac93ca40ede46157f49755b218b2f9faec0e42e32a6'
    checksumType   = 'SHA256'
    checksum64     = 'f6ab5ef32cfc224cf22d75e5b11178c495af9f1cb94bf77c223b46479e170efd'
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
