$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.5.0/civo-1.5.0-windows-amd64.zip'
    checksum64     = '1fb89fe1c1e279ecb3ea8a1a61c22e01718abea454d56e660127b2fbf36c6dae'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
