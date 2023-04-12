$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.33.0/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.33.0/hcloud-windows-amd64.zip'

    checksum       = '66413bcde8a3b50d8ccdc5fbd93651d3efee9a66bba8c5b9e7c1d0085d8c8203'
    checksumType   = 'SHA256'
    checksum64     = '8188fe6957a08e9783c8d309cffdbd3a2e360945dc7d46f4e6ccf202a3507771'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
