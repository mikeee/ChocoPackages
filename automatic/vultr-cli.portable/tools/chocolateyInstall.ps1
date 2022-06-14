$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com//vultr/vultr-cli/releases/download/v2.14.2/vultr-cli_2.14.2_windows_64-bit.zip'

    checksum64     = '6377e2355bada3bb4ae0e1c0da3e144dca188cbbf412806554fa01127026d4fa'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
