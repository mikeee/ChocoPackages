
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/bostrot/wsl2-distro-manager/releases/download/v1.8.3/wsl2-distro-manager-v1.8.3.zip'
    checksum64       = '182fa92ee25fb989720ef05434734785676a229fecbe7a68f4bc690928f99450'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
