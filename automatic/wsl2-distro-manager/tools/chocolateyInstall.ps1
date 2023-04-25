
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/bostrot/wsl2-distro-manager/releases/download/v1.8.2/wsl2-distro-manager-v1.8.2.zip'
    checksum64       = '9e66aa2e14dc6df9e5badd748493b99811c61875846a32cc56029dd3ef24aa07'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
