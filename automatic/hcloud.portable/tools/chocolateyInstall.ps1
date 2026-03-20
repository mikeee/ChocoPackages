$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.62.0/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.62.0/hcloud-windows-amd64.zip'

    checksum       = 'ff58ee8c171eb064c0ab047c9b800ac2abe60abe28c7e687e90a5a9061f96a9f'
    checksumType   = 'SHA256'
    checksum64     = 'f2b7a8c65bfd92fc1b41b1c01d77415c1de123d19360e032f2bcae8b430cb225'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
