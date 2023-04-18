
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.32.2/tilt.0.32.2.windows.x86_64.zip'
    checksum64       = '4dbdb0ac283a63073fa2465d8c895222dbe99a8a6818eb2afb4bff368e34b525'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
