$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com//vultr/vultr-cli/releases/download/v2.8.2/vultr-cli_2.8.2_windows_64-bit.zip'

    checksum64     = 'b08250228356e3603a782a2cf6f932a13bdf772ab5008d49160e7c3bfbe2fabc'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
