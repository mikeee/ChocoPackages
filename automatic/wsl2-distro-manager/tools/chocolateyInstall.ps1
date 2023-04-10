
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/bostrot/wsl2-distro-manager/releases/download/v1.7.2/wsl2-distro-manager-v1.7.2.zip'
    checksum64       = '43f8585dda0a1f275280c8063ff0d27f9af42a370d6c70443eef18d3c2fd67a9'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
