$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.89/civo-1.0.89-windows-amd64.zip'
    checksum64     = '58e7b2fc1b502d229da456e882b55edf61817b88e546008c141ebe95b5a07b0b'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
