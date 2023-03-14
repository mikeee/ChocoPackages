
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.32.0/tilt.0.32.0.windows.x86_64.zip'
    checksum64       = '7564912dbb983806ed11ba201402937ae1bed32e05ef5498def33a07415f0d99'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
