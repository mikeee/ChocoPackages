$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//hetznercloud/cli/releases/download/v1.26.1/hcloud-windows-386.zip'
    url64          = 'https://github.com//hetznercloud/cli/releases/download/v1.26.1/hcloud-windows-amd64.zip'

    checksum       = '8f0dc6d498694a1ac45b05dc94b0031481b7e43f62f500e87a82658e1f0cf5fc'
    checksumType   = 'SHA256'
    checksum64     = '390858903f0fa8f1c3f31075561d00d08899a72cf29a49998e8b60f4af50d1b1'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
