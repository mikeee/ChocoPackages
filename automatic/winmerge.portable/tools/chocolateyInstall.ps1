$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.12/winmerge-2.16.12-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.12/winmerge-2.16.12-x64-exe.zip'

    checksum       = '141fe466c570b0eb63450261a12c62e28ffb37bdf7f4b62c7d265dabd8284c6e'
    checksumType   = 'SHA256'
    checksum64     = '155964876e4c0f04896173989bda98e7a9e1681245dfa0c210cb90a8432ce806'
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
