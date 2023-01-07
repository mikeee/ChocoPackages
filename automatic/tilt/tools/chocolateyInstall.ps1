
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.31.0/tilt.0.31.0.windows.x86_64.zip'
    checksum64       = '125843466c9ded721082e6a22c973bfd5dc1f15b10e27a24d1d1ea95c97269da'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
