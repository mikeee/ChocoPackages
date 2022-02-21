$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.17/civo-1.0.17-windows-amd64.zip'
    checksum64     = '71992d9da185abe9e2f3bac4dcf536ba85e46587b2629c00241756a3ffe22d4c'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
