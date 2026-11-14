
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.37.9/tilt.0.37.9.windows.x86_64.zip'
    checksum64       = 'ca0f6531ad5930da8a12214de22b83e1757d412ed78c86950c0e8ee9d946cca9'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
