
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.31.1/tilt.0.31.1.windows.x86_64.zip'
    checksum64       = '62f341061426cd098bf5589a073b41485ecfcf4cee192c2e1170eb2697553ccc'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
