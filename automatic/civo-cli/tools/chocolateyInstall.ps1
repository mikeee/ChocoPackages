$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.24/civo-1.0.24-windows-amd64.zip'
    checksum64     = '188aa14c0c1c7b7237684497d1bd0d82b7f2b2c97be34e55cb1925d0bfc4b1d3'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
