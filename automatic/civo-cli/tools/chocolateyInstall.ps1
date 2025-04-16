$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.2.1/civo-1.2.1-windows-amd64.zip'
    checksum64     = 'bef9b76f4dd6b62fc67e27630b1e27dfc01cc0bfaa17c189804c1d7b9e34ee25'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
