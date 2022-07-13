$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//hetznercloud/cli/releases/download/v1.30.1/hcloud-windows-386.zip'
    url64          = 'https://github.com//hetznercloud/cli/releases/download/v1.30.1/hcloud-windows-amd64.zip'

    checksum       = 'b0f16e29a2cb7a4d514c59763b969c771397bf68985638fc2c41329da3c90be0'
    checksumType   = 'SHA256'
    checksum64     = '1a86eb2e40a27c151323c3ba08c55c149e7c78e0c9d361bde1443b362a87d215'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
