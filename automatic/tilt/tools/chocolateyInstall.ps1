
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.34.4/tilt.0.34.4.windows.x86_64.zip'
    checksum64       = '38eaa80519c6eab0fc98817f5a99307222890dcd8d0cda872c87d7d83f9d34bd'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
