$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.4.6/civo-1.4.6-windows-amd64.zip'
    checksum64     = '92b6516974c9cc3c8a1f7109f037532e8cbadc7affa9f9e4761276261f3cbc82'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
