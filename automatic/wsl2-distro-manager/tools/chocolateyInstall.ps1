
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/bostrot/wsl2-distro-manager/releases/download/v1.4.4/wsl2-distro-manager-v1.4.4.zip'
    checksum64       = 'f57ee62fea9b7452faaa53787b63d2a727740d1e2f88ed6ae955ae019b5e0e4c'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
