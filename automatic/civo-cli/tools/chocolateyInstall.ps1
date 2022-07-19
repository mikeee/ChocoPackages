$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.30/civo-1.0.30-windows-amd64.zip'
    checksum64     = 'f54a3ccfa6b7bc22512983dd11b04a69b27bb6dcd91e8ac59f11d0bdc1e4d852'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
