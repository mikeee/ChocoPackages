
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.34.5/tilt.0.34.5.windows.x86_64.zip'
    checksum64       = '20f8227fb09f2364cc45e5b2d003c486bee50e6e2d497dba618e5451dec09dcf'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
