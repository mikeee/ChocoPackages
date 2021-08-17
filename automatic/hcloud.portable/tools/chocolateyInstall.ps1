$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//hetznercloud/cli/releases/download/v1.28.0/hcloud-windows-386.zip'
    url64          = 'https://github.com//hetznercloud/cli/releases/download/v1.28.0/hcloud-windows-amd64.zip'

    checksum       = '2f15b01f8224c288a3a49082a748c287eb40da498bc5752a14c145a52f3d90cc'
    checksumType   = 'SHA256'
    checksum64     = '2704123adfd98ae992ec89319f1fbda38011b32843e8f34d22cb29f3db396be1'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
