$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/2.16.6/winmerge-2.16.6-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/2.16.6/winmerge-2.16.6-x64-exe.zip'

    checksum       = '5cad2f85b5289d145ce6d79fb6b148d58ed863c7c2593fe42b8e75fc031a1e3f'
    checksumType   = 'SHA256'
    checksum64     = 'f7fcf1167c6332664eb1e75bcdd822369a0716cc1faae3fd4101a88a88fca963'
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
