
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.30.13/tilt.0.30.13.windows.x86_64.zip'
    checksum64       = '77e5f7ab8fdff289cfbe9eea8b481d0696ac700997accdf2b2c3e691d8551595'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
