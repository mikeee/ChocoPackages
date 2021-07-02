$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com//vultr/vultr-cli/releases/download/v2.5.3/vultr-cli_2.5.3_windows_64-bit.zip'

    checksum64     = 'af0b04c80a61eefca3b71b36ee281538429a5d2175b1909831dda31824dab1de'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
