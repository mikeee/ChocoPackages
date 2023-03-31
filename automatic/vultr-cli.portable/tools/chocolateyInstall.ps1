$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com/vultr/vultr-cli/releases/download/v2.16.2/vultr-cli_2.16.2_windows_64-bit.zip'

    checksum64     = '562b447720012a4e24b95307dd5047f6fbb681bc1bc802d560b25d061826764c'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
