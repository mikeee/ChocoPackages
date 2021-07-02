$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com//vultr/vultr-cli/releases/download/v2.5.0/vultr-cli_2.5.0_windows_64-bit.zip'

    checksum64     = '7c0359c7718ae4ba692e4e2dc6c1235a15b8804cbc20b4b9c84d8f724ee0648f'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
