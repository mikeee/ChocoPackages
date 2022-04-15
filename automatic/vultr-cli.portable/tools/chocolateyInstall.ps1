$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com//vultr/vultr-cli/releases/download/v2.13.0/vultr-cli_2.13.0_windows_64-bit.zip'

    checksum64     = 'd3075e2bcda2e7610560df209d4e7e17857f5784cff0938462cfcd5380923d90'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
