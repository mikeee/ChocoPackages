$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//hetznercloud/cli/releases/download/v1.20.0/hcloud-windows-386.zip'
    url64          = 'https://github.com//hetznercloud/cli/releases/download/v1.20.0/hcloud-windows-amd64.zip'

    checksum       = '3d5c61610ad17a4c8122bfa70d9230bcf42af18b6ce4240e02dd89e2477e016f'
    checksumType   = 'SHA256'
    checksum64     = 'a69ca950c0a66ccc00a9708ae4e2a4476394fc5558d86383b14720bc6ff3dbc3'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
