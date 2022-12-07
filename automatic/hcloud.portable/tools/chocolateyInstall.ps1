$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.31.1/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.31.1/hcloud-windows-amd64.zip'

    checksum       = '8984c8f95d2266d0358b2c3df5b39e687e7173e5406918f7dd750efbb48b4898'
    checksumType   = 'SHA256'
    checksum64     = '6a23768776c3e893c0ebdccc9797c0e54c0a06ce48b37075390aa755e5407314'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
