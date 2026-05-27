$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.56.2/winmerge-2.16.56.2-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.56.2/winmerge-2.16.56.2-x64-exe.zip'

    checksum       = '96ba5d07f785383586ecea320a9bff62db2dab0ad4b2f88aa76f23f9db3c1392'
    checksumType   = 'SHA256'
    checksum64     = 'a436deb990b5e651e50e97ec056c1c0da12f4947c69a350384fd2590d47a6481'
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
