
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.36.3/tilt.0.36.3.windows.x86_64.zip'
    checksum64       = '8fbd82401cab7a1d748d21ddff001105068eac210be982eabbd13d8c1e9a841a'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
