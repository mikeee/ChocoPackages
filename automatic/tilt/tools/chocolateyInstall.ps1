
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.34.1/tilt.0.34.1.windows.x86_64.zip'
    checksum64       = '7fdda214a6aa635abc0441969d4cd93fc7821ef0d339623612d99ec67f732f6c'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
