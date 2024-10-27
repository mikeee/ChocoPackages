$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.44/winmerge-2.16.44-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.44/winmerge-2.16.44-x64-exe.zip'

    checksum       = '42528d0b98e6be6ca04afa1c4abbc9b328b257fccc788c8a9bea511fc92343ad'
    checksumType   = 'SHA256'
    checksum64     = '99010ce4dc510f567164c7b46af4b3b9bf8dbc92b3e73009bc5380b676577c07'
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
