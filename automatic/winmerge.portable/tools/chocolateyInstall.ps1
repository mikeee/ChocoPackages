$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.58.2/winmerge-2.16.58.2-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.58.2/winmerge-2.16.58.2-x64-exe.zip'

    checksum       = '41d4ea1fd62ee380f25a34c16a63ff8743a2e259a51068559b3c64b43f725b49'
    checksumType   = 'SHA256'
    checksum64     = '5732474add39283f44bd20c66e57503d26f435e695feabc4140ba2f91d2e7804'
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
