
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.36.1/tilt.0.36.1.windows.x86_64.zip'
    checksum64       = '30c265fb54f5421e293c3e63152c282ebf56045eabb74021aa46c3231e2058f7'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
