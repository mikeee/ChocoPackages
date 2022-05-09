$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com//vultr/vultr-cli/releases/download/v2.14.0/vultr-cli_2.14.0_windows_64-bit.zip'

    checksum64     = 'c19294f523707a0bb770dde68e10a2a5066879e094f80f95e860f8624f6d18a9'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
