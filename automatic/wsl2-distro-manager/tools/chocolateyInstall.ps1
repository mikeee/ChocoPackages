
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/bostrot/wsl2-distro-manager/releases/download/v1.6.0/wsl2-distro-manager-v1.6.0.zip'
    checksum64       = 'a4f4b658e438d85546c1310a8db024eb0fe63a698e125d7304227bf532adda9f'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
