
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.37.3/tilt.0.37.3.windows.x86_64.zip'
    checksum64       = '9e6cf1696618397a43fc4c80627d42a1ef65937a863ac1a57aa8cf78e077409e'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
