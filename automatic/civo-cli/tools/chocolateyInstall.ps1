$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.2.3/civo-1.2.3-windows-amd64.zip'
    checksum64     = 'a5442d5b8d0ac58c81cbb886ebb1b29ecbcd2dc8aad4a59f1224c04b8c92039b'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
