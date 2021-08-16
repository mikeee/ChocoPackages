$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//hetznercloud/cli/releases/download/v1.27.0/hcloud-windows-386.zip'
    url64          = 'https://github.com//hetznercloud/cli/releases/download/v1.27.0/hcloud-windows-amd64.zip'

    checksum       = '691583573062a83615d8d6e032b854db3163d7e5642509841309042b44d0745e'
    checksumType   = 'SHA256'
    checksum64     = '6a064cbc84cd24b28fd76352741505866ae758fe17c0f2e3117fe93f5f496d84'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
