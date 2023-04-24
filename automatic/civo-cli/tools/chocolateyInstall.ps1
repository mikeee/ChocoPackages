$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.50/civo-1.0.50-windows-amd64.zip'
    checksum64     = '8110e0ec31c7dfa6224693c63334b588092ab2a83444146a179cc9e17c1f6d39'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
