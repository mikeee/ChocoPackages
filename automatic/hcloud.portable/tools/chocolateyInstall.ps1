$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.44.1/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.44.1/hcloud-windows-amd64.zip'

    checksum       = '3a92e600083617c096d7067a6439d63b3e7478e2947fa8e1d931d1c2c5e5da5c'
    checksumType   = 'SHA256'
    checksum64     = '5dd308b8db285a9ae75a763bfd334e1c1cd226ca138125edac84a5dc2fd48c6b'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
