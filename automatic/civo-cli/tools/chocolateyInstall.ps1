$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.18/civo-1.0.18-windows-amd64.zip'
    checksum64     = '252664ed94460ef79804f8b8994293c394b4e4cc4d84808d88ddaae3fd5afb20'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
