$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.63.0/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.63.0/hcloud-windows-amd64.zip'

    checksum       = '8806f85713129031b3026e40ed67eeb01dd7a6ecb64e3e0de1ff96a8bac4bd79'
    checksumType   = 'SHA256'
    checksum64     = 'c5bb715ae19bc1568c5f2415cccee11c2ff8b2a384666fdb63efbe1d509206e5'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
