$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com//vultr/vultr-cli/releases/download/v2.7.0/vultr-cli_2.7.0_windows_64-bit.zip'

    checksum64     = 'ee0dbc6d7620034e54827e6a1837bca17cb3e58e4419be4a735a3d8ffcabaa3c'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
