$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.47/civo-1.0.47-windows-amd64.zip'
    checksum64     = '88ec9557e781646261997ed5ae9b152dce6f8e2eee817ee0698bd00dea147722'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
