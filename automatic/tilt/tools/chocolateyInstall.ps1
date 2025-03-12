
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.34.0/tilt.0.34.0.windows.x86_64.zip'
    checksum64       = 'a8f3bff2c86d1eff9acb8f4db9bfe28dd40eea9be1827c3eeb3619143d1685af'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
