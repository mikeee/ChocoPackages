$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.86/civo-1.0.86-windows-amd64.zip'
    checksum64     = '6a3cd32cdde974a54692117835308dfdd1bcca3cd164e847f3bb5946b248d65f'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
