$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.91/civo-1.0.91-windows-amd64.zip'
    checksum64     = '313562d4873ac004b5abf2119b50758f8980d25537466fca7265e1b6d1e0161a'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
