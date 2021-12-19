$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.17/winmerge-2.16.17-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.17/winmerge-2.16.17-x64-exe.zip'

    checksum       = 'a408f3b07f8f31a3f30089b7a09e9883ad58ef726dc7081a77b313c40eccdb8c'
    checksumType   = 'SHA256'
    checksum64     = '2a3a2ecfc22f78237da8c5ce67a4ce112459f0a9f9fe769ca7e5cf191e3c0a47'
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
