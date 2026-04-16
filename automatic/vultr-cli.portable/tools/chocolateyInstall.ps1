$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com/vultr/vultr-cli/releases/download/v3.10.0/vultr-cli_v3.10.0_windows_amd64.zip'

    checksum64     = '280fb041250e12bf603051cc6808d71202e58a9bcbc76e60a51d040812079078'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
