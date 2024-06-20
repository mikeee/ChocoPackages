$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.44.0/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.44.0/hcloud-windows-amd64.zip'

    checksum       = '924e112d88366eb061bd66b15cdbd09b8bc2dc39b0d096f8179e3c1bd811e0ae'
    checksumType   = 'SHA256'
    checksum64     = '9dc1624910aeacd14132f24aad6e1f18ca61122e9b030aa9b4641199789670d9'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
