$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.5.1/civo-1.5.1-windows-amd64.zip'
    checksum64     = 'da43e3a1609af603392549ada3a53af5f1863ecbea3595b6a37ef6c115ce9d82'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
