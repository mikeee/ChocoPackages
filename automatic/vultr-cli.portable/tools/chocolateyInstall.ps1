$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//vultr/vultr-cli/releases/download/v0.4.0/vultr-cli_0.4.0_windows_32-bit.zip'
    url64          = 'https://github.com//vultr/vultr-cli/releases/download/v2.4.1/vultr-cli_2.4.1_windows_64-bit.zip'

    checksum       = '7ba2676f8f1839fba21d7daf82b336c2df46e899153a61e6c310537fd9693690'
    checksumType   = 'SHA256'
    checksum64     = '5fd52bd89b9674330049578622494cecd194e82b9edb7e4999250d602ebe8567'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
