$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.30/winmerge-2.16.30-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.30/winmerge-2.16.30-x64-exe.zip'

    checksum       = '1a3449c50d7c181ad8b4d15e3fb88c2530f86728da827548959511c99509a3c8'
    checksumType   = 'SHA256'
    checksum64     = 'd8fd843c6f4f132f3e7cf1585520ddd0a20ac49949d5f9a425f51ef697753899'
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
