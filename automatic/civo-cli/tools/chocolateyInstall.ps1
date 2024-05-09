$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.83/civo-1.0.83-windows-amd64.zip'
    checksum64     = 'd7ff0f8d8f62baf25e6b2b677023af4e8fe0499838cd53ecb75ac005d90c15ed'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
