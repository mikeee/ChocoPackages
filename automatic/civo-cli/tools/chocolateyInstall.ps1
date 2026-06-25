$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.5.4/civo-1.5.4-windows-amd64.zip'
    checksum64     = '0577be2f68ed42c9310812592d9e3f6fc42e0bf53f15720089e64d100d3fab60'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
