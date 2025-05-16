
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.34.3/tilt.0.34.3.windows.x86_64.zip'
    checksum64       = '2062478ff157db95d6c7b3fdc3fc5cc39996560d5d64d15120e54844aed11e78'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
