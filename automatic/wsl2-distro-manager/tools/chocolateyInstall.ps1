
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/bostrot/wsl2-distro-manager/releases/download/v1.7.3/wsl2-distro-manager-v1.7.3.zip'
    checksum64       = 'dfafbfb7b325627cc9ef75eb69c2e96f24c8686553c6dc45f093076d4163489b'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
