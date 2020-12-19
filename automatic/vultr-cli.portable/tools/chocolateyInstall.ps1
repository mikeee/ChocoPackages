$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//vultr/vultr-cli/releases/download/v0.4.0/vultr-cli_0.4.0_windows_32-bit.zip'
    url64          = 'https://github.com//vultr/vultr-cli/releases/download/v2.1.0/vultr-cli_2.1.0_windows_64-bit.zip'

    checksum       = '7ba2676f8f1839fba21d7daf82b336c2df46e899153a61e6c310537fd9693690'
    checksumType   = 'SHA256'
    checksum64     = '485971beb0ea486d0908b3d5abdcb75a30c772622312bf374e51b4dea969ea11'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
