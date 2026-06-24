$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.66.0/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.66.0/hcloud-windows-amd64.zip'

    checksum       = '308df43c347d415429e0895b4fd01f3755852ffcc8d0e5fb5626a7f07c6af338'
    checksumType   = 'SHA256'
    checksum64     = '15b4ecf8d57c993f6987530ad1910f1167edf71f702696710d5420bdf0de7639'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
