
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/bostrot/wsl2-distro-manager/releases/download/v1.6.2/wsl2-distro-manager-v1.6.2.zip'
    checksum64       = 'af5d288761ef19304a6fdbe88dbdc733ebc1a0319a5176e3cfba276085bec894'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
