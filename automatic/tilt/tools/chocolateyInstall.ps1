
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.37.0/tilt.0.37.0.windows.x86_64.zip'
    checksum64       = '4df1a3519e15dbe3514752da0bb7a1f4f0a7c0189347f8a5df9eb251222d179a'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
