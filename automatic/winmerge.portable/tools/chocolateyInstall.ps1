$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.16/winmerge-2.16.16-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.16/winmerge-2.16.16-x64-exe.zip'

    checksum       = 'bdcee04511eda4a8cb356336171354c34cac4dc402177d8bcf51ed5c39d1a8e5'
    checksumType   = 'SHA256'
    checksum64     = '02072cff71079b7b3122b887d5083bf2cf6b173de066aa5044acf1762f845ef6'
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
