
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/bostrot/wsl2-distro-manager/releases/download/v1.7.4/wsl2-distro-manager-v1.7.4.zip'
    checksum64       = '73562e99f7f8344b41591535a557724ade69af39c299a446a186f05045200ff8'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
