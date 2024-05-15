
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.33.14/tilt.0.33.14.windows.x86_64.zip'
    checksum64       = '6062fcfc64e4b3c0fd5a63d31bb055a4652b33bfe10a57494ca2b448b4386b76'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
