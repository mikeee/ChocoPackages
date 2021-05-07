$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//vultr/vultr-cli/releases/download/v0.4.0/vultr-cli_0.4.0_windows_32-bit.zip'
    url64          = 'https://github.com//vultr/vultr-cli/releases/download/v2.5.0/vultr-cli_2.5.0_windows_64-bit.zip'

    checksum       = '7ba2676f8f1839fba21d7daf82b336c2df46e899153a61e6c310537fd9693690'
    checksumType   = 'SHA256'
    checksum64     = '7c0359c7718ae4ba692e4e2dc6c1235a15b8804cbc20b4b9c84d8f724ee0648f'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
