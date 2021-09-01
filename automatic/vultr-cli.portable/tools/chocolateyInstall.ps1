$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com//vultr/vultr-cli/releases/download/v2.8.1/vultr-cli_2.8.1_windows_64-bit.zip'

    checksum64     = '6d1cd640e5ffca017292d92f9125c03661f31227558ce46204eeef15b4ec4117'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
