
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.35.0/tilt.0.35.0.windows.x86_64.zip'
    checksum64       = '9ea0680471b291096cfe2d554b4fca903f3d3d50d0c1329a6889f2370471c212'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
