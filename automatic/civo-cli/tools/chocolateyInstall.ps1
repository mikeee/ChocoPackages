$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.4.3/civo-1.4.3-windows-amd64.zip'
    checksum64     = '1755ea9c2b3cd800eb7b4cf0295e947a43166155858b92e9c48c3fde033f2a8a'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
