
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/bostrot/wsl2-distro-manager/releases/download/v1.5.0/wsl2-distro-manager-v1.5.0.zip'
    checksum64       = 'cfdd83ea9a05d2429c01a295f914efafc3345beb34a0d892ff8a1ef786b3f423'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
