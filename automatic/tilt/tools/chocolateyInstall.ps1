
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.37.1/tilt.0.37.1.windows.x86_64.zip'
    checksum64       = '29801d8b969a3797f8135e840c27a6e7351e3febcea00849ecbe303d4f2ac405'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
