
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.30.12/tilt.0.30.12.windows.x86_64.zip'
    checksum64       = 'dc51941b2c309b0a81fd2145add37706db6fd4a42070b64550410a1a799161a5'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
