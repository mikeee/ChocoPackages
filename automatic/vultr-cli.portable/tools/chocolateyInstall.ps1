$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com//vultr/vultr-cli/releases/download/v2.8.0/vultr-cli_2.8.0_windows_64-bit.zip'

    checksum64     = 'ec23367ff927a30849d0f72227fa3c5ad835b069743e166fb2db40c2df44d96d'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
