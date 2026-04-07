$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.62.2/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.62.2/hcloud-windows-amd64.zip'

    checksum       = 'ce8e1e17a4f375b2b43e0424b4f5704a8bff8aa63ef872c405a76c7ecb552dca'
    checksumType   = 'SHA256'
    checksum64     = '283fe92fd77257147c483e46011bbc73cb0d6d99a5620e3350a37f115d0776e9'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
