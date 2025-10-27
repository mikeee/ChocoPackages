$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.52/winmerge-2.16.52-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.52/winmerge-2.16.52-x64-exe.zip'

    checksum       = 'a2ea6e921aeeb675d3c6cae44c8923e8fef112159d9d3da99c55f92510df54c0'
    checksumType   = 'SHA256'
    checksum64     = 'b4c815072923f01cacda189a967f377ec2dde38ee27880b472d96b3206ce8c2c'
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
