$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.33.1/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.33.1/hcloud-windows-amd64.zip'

    checksum       = '7b0a6d8dc2ca6dc2d6604c10a1daeec3249a1c27615d4e072f1c010cccd7f227'
    checksumType   = 'SHA256'
    checksum64     = 'a51eea2bbf4c16c1251139aa09a2a5f5d1b68b07d87a93b0181e89e6b0e47b98'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
