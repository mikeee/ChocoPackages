
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/bostrot/wsl2-distro-manager/releases/download/v1.7.1/wsl2-distro-manager-v1.7.1.zip'
    checksum64       = '33f6083e374744efb2e944b56fa3b6e397a5eea40d5d45d4010c3e07aae878ca'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
