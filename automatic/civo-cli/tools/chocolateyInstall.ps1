$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.26/civo-1.0.26-windows-amd64.zip'
    checksum64     = 'd65e3e96d1e2b8f9879eb63d0b4e2160e378f585f5553076d5c957ca994471dd'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
