
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.37.6/tilt.0.37.6.windows.x86_64.zip'
    checksum64       = 'a13f5d1c56a4d6aba979511b292fa9fc47abf8da9eee202c105cdbfe9d43866b'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
