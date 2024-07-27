$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.42/winmerge-2.16.42-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.42/winmerge-2.16.42-x64-exe.zip'

    checksum       = 'e27f2e65411aaf37054f0b726ddd8b91facc4451959a37068575519092d2a253'
    checksumType   = 'SHA256'
    checksum64     = '2499c75e5c79f4d97302d13012590ff107572c048c41e77b1c32c0a875dd185c'
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
