
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.37.5/tilt.0.37.5.windows.x86_64.zip'
    checksum64       = '2b7536b38f09d4eee1851352fef4c6e25c15d49b10d1349bca428748615eed54'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
