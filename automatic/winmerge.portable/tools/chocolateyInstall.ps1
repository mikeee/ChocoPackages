$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.52.2/winmerge-2.16.52.2-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.52.2/winmerge-2.16.52.2-x64-exe.zip'

    checksum       = 'ff5fd8c4bc0ad1b2beb1d6b8154a00ce5b14b626bf091ebb9529d42d9041495b'
    checksumType   = 'SHA256'
    checksum64     = '531bce09f2f01626c2ba2b65eb4423676d5329bfaca45fa75dedea5d3ddcd341'
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
