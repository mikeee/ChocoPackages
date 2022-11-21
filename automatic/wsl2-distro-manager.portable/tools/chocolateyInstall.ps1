
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/bostrot/wsl2-distro-manager/releases/download/v1.4.2/wsl2-distro-manager-v1.4.2.zip'
    checksum64       = '9898f4f522c20442792075578288d3630622cbc2ef76e3ebaf7aecfa91022790'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
