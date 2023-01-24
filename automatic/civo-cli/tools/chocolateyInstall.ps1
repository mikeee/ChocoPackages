$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.45/civo-1.0.45-windows-amd64.zip'
    checksum64     = '2cceafb9dee8246091b77b944d93472b1c45fc3b6063667243c8f57318cb56c0'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
