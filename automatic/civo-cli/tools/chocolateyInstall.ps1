$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.6.1/civo-1.6.1-windows-amd64.zip'
    checksum64     = '3aa34bb838d092622bdd99d591983718a932ab284dfdafa22fc9fee93613e215'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
