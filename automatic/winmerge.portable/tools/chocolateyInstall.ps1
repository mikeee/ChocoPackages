$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.20/winmerge-2.16.20-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.20/winmerge-2.16.20-x64-exe.zip'

    checksum       = '56f194c48afe91d1b56b7ff0d35da9d5ae20e550fed6e7816c833190a3ef8c22'
    checksumType   = 'SHA256'
    checksum64     = '39a70e3634995c89fb67a9fab02bf7176add8ad196d0b4fbea6a46cc524f1f43'
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
