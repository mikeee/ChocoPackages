$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.47.0/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.47.0/hcloud-windows-amd64.zip'

    checksum       = '3bbb7e1cc7b0a44821066c6abc2dd1bdf96c84132f078ccde57dbd26cb7501ac'
    checksumType   = 'SHA256'
    checksum64     = 'c7a61478e645f6f0ff5ce3d0944fc6735a2d25dcc6ef74abf16785df475b35b6'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
