$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com/vultr/vultr-cli/releases/download/v2.15.0/vultr-cli_2.15.0_windows_64-bit.zip'

    checksum64     = '114b501fb0c596aff4a020c562965ffb75d19342249cdf00ae4575f66351a30e'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
