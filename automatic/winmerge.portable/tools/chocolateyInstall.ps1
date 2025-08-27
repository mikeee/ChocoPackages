$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.50.2/winmerge-2.16.50.2-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.50.2/winmerge-2.16.50.2-x64-exe.zip'

    checksum       = '33e7dc3f0bdecd053e08cf3272a5a920641c40e56a007ab142bf656a7f09d5ce'
    checksumType   = 'SHA256'
    checksum64     = '5f40f248a962f9ed64f6e400469c287e5c93335cde54e3ae293becda72ac868e'
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
