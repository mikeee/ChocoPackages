$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com//vultr/vultr-cli/releases/download/v2.14.1/vultr-cli_2.14.1_windows_64-bit.zip'

    checksum64     = '0c87c56563b8a21a94bdcbf9b3a983c541d135c2021cde66b9273d367d8c2202'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
