$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com/vultr/vultr-cli/releases/download/v3.3.0/vultr-cli_v3.3.0_windows_amd64.zip'

    checksum64     = '843e4de42f2631fa42948e6367ad24857bb7f1d4f44e1bbf57b2b1c5c3dd7650'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
