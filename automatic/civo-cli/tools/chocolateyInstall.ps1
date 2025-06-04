$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.3.0/civo-1.3.0-windows-amd64.zip'
    checksum64     = '54d76de5e00868c4b09bd552b059e0bd4e2782244fa3ef9aa7ae7d5ac796f02a'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
