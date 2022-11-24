$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.43/civo-1.0.43-windows-amd64.zip'
    checksum64     = '19b8f574610e343ef748388b4882e392a4cb302d72abc2841c3c4b6260221c33'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
