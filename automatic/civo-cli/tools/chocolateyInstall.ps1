$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.4.7/civo-1.4.7-windows-amd64.zip'
    checksum64     = 'd3333b7939cdf9fcf0b7b4519a408e0a5b9590594a2cbffd4bab8b1fca03ec0c'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
