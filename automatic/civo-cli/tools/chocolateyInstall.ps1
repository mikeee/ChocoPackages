$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.48/civo-1.0.48-windows-amd64.zip'
    checksum64     = 'fc146b9e3ecb5a6d0653b839514542c9afc993a3c85ce29001cdcda7e46f2ec9'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
