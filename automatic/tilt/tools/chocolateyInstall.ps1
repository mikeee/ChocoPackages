
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.32.3/tilt.0.32.3.windows.x86_64.zip'
    checksum64       = '6dd00dc8b55b9fe914fbc217152ea3a0c0016ef15cbc5c9622fc77afb7b75caf'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
