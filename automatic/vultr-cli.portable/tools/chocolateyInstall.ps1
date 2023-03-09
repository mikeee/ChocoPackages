$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com/vultr/vultr-cli/releases/download/v2.15.1/vultr-cli_2.15.1_windows_64-bit.zip'

    checksum64     = 'cf76ab9b85858f564a71a6197f7d03342a62a434e37601f6278403b7d817ed8c'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
