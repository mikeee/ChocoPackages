
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/bostrot/wsl2-distro-manager/releases/download/v1.7.0/wsl2-distro-manager-v1.7.0.zip'
    checksum64       = 'e784c4e3469b843ab5bd0c0cb058c33b2f44d29db93c1e7fc26d5facafc28691'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
