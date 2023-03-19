
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/bostrot/wsl2-distro-manager/releases/download/v1.6.1/wsl2-distro-manager-v1.6.1.zip'
    checksum64       = 'f9e8431d17c07f1c91cce0cff5aecb0c91e3c037e9a1ccd8db007413f5b83c96'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
