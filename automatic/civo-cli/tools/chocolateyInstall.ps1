$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.4.2/civo-1.4.2-windows-amd64.zip'
    checksum64     = '54ce9576e1d2d9fb13db7b77f37218ca66ad5628fab30af8e8df54755a3cacda'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
