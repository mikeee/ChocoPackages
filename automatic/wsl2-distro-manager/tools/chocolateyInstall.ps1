
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/bostrot/wsl2-distro-manager/releases/download/v1.8.0/wsl2-distro-manager-v1.8.0.zip'
    checksum64       = '646e8f6cba80e70a500c654108002f531eff202c1f15025ef24468eed47672aa'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
