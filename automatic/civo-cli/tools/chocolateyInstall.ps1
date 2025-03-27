$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.1.99/civo-1.1.99-windows-amd64.zip'
    checksum64     = '02ec54e4855f991bfd3383304d8c05e7c54f20c257f563fefd8bb299957cf350'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
