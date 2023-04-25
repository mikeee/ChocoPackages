
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/bostrot/wsl2-distro-manager/releases/download/v1.8.1/wsl2-distro-manager-v1.8.1.zip'
    checksum64       = 'bceb405c7daafd7103a77a7d2308e476e6521f37cc0f83a2df4e34830870cf0c'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
