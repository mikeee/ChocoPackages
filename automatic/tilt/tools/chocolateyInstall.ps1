
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.36.0/tilt.0.36.0.windows.x86_64.zip'
    checksum64       = 'd16d482119886c19d65c3f61f3588198f85696d30c08efdf19c4e17624b941ea'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
