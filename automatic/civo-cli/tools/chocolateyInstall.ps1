$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.88/civo-1.0.88-windows-amd64.zip'
    checksum64     = '3dc7ed0143f87f0057b8eea92da7e8c822fa8ea065c132da184ec3ce63924bc8'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
