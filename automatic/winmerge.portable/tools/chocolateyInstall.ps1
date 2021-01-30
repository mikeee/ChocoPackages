$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.10/winmerge-2.16.10-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.10/winmerge-2.16.10-x64-exe.zip'

    checksum       = 'aad3bbd251c8ffa35fda79261d505b29b5f669ba5dd93ff228588ef7f7e2f6a9'
    checksumType   = 'SHA256'
    checksum64     = 'e642b7ce444c55de2bb7f6e2e6e26410238e346822968da8dcb53e2a01aa2c09'
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
