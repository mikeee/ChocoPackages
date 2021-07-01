$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//hetznercloud/cli/releases/download/v1.25.1/hcloud-windows-386.zip'
    url64          = 'https://github.com//hetznercloud/cli/releases/download/v1.25.1/hcloud-windows-amd64.zip'

    checksum       = 'fbccbb5bcff2d08b90cebbed57a3cd81b97a64ef6bab690947c87695ebefbce1'
    checksumType   = 'SHA256'
    checksum64     = '70b61008271056ccdef942b11501d1a7f39817ce4d3e5bd14b7baa996c2123c7'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
