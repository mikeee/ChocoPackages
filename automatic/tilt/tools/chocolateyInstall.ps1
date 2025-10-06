
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.35.2/tilt.0.35.2.windows.x86_64.zip'
    checksum64       = '70fbcbd91b0ebc27da246e5ff763d5e3b19b0de9642408b9e35f708fc40f75ed'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
