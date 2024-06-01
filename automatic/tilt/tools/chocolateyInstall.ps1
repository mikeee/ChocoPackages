
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.33.15/tilt.0.33.15.windows.x86_64.zip'
    checksum64       = '230aa57a26a761816fc8655787c547b99e5549149186c40a309c39b270ed975e'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
