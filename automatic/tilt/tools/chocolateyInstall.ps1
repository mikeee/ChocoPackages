
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.34.2/tilt.0.34.2.windows.x86_64.zip'
    checksum64       = 'd5e1cfca50a3da56deb43f4eec15a5f94f710e00e7cd2f1d43538c2fb145b3c3'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
