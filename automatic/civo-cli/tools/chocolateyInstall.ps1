$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.19/civo-1.0.19-windows-amd64.zip'
    checksum64     = 'd33776de804313a92f5d33475e07167355ef818209f9152f5e8bf07cfa59fd87'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
