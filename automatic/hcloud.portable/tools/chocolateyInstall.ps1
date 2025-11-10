$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.57.0/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.57.0/hcloud-windows-amd64.zip'

    checksum       = '8459f7f11f2135b59f9ac1d7e27a3f68e46356e605b9389332857198a62da781'
    checksumType   = 'SHA256'
    checksum64     = '63fe591151d4fd9070cfb74ffd32be5b12623d8bed12baf88da811c6ce7776d4'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
