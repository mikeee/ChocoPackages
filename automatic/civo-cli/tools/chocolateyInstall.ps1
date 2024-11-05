$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.1.92/civo-1.1.92-windows-amd64.zip'
    checksum64     = '58393169aeeb1290b8a066c4c6d6d3bfe2a35fc756448190d02674906b29805c'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
