
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.37.4/tilt.0.37.4.windows.x86_64.zip'
    checksum64       = '41d38b2ecd569e9b0ec73bc7d753fdb67bd24fcf1e434610b72d59c9a22c3041'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
