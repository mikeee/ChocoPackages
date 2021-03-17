$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//hetznercloud/cli/releases/download/v1.21.1/hcloud-windows-386.zip'
    url64          = 'https://github.com//hetznercloud/cli/releases/download/v1.21.1/hcloud-windows-amd64.zip'

    checksum       = 'd45bf1155948eb9709c796454fd4fc98eeba44673df24186b0e0ce4c45f31b0b'
    checksumType   = 'SHA256'
    checksum64     = '282df3e85e16d8f8afd4d413dc4673576754bfd5e65a58413699f1da4b5045b4'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
