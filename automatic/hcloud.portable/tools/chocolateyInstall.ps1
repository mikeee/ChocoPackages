$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//hetznercloud/cli/releases/download/v1.30.2/hcloud-windows-386.zip'
    url64          = 'https://github.com//hetznercloud/cli/releases/download/v1.30.2/hcloud-windows-amd64.zip'

    checksum       = 'eb7a73ddce9d713e8579b50f9ec5fb508064308718868fb53fc9df515e928a0d'
    checksumType   = 'SHA256'
    checksum64     = '53f5e36053f353374bb9c1a7b04492e74de63c63e8b2fad5522abdc1907135ec'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
