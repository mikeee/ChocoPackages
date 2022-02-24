$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.21/civo-1.0.21-windows-amd64.zip'
    checksum64     = '2abaa7206d5bf08def512b8c62b0d931c85a4e4c7b04eeec3f3766f28ef98c2c'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
