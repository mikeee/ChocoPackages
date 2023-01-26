$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.26/winmerge-2.16.26-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.26/winmerge-2.16.26-x64-exe.zip'

    checksum       = '853ba61b7b47eb49ac5b8f1d7311791d803867d58e37b68fbd9d14bcffa483c0'
    checksumType   = 'SHA256'
    checksum64     = 'ff84e19d78ce09953e3bea7e380d64ae9c5c3187693ed4b84ec4755748dacf3a'
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
