$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//civo/cli/releases/download/v0.6.25/civo-0.6.25-windows-386.zip'
    checksum       = '8cb897f9033ff51e460e1dcd4e111cd19a3b71b77b43f989ac6f9d81ad37e01e'
    checksumType   = 'SHA256'

    url64          = 'https://github.com//civo/cli/releases/download/v0.6.25/civo-0.6.25-windows-amd64.zip'
    checksum64     = '9a1772fbbe1bd99072df174209ce52245cbd8b31773842f09efc04bf5af2a831'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
