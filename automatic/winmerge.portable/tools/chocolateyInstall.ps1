$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.24/winmerge-2.16.24-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.24/winmerge-2.16.24-x64-exe.zip'

    checksum       = 'c8624f40b30b358d8cc43a0195c44a526d8c0dfba6f2fdb50c61b0cc14fc6905'
    checksumType   = 'SHA256'
    checksum64     = '2de08c9d1d83049ce78b0a1ba532b22b5697bf93fd0cd23cd8d77343b2654885'
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
