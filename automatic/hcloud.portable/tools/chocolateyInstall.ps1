$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.56.0/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.56.0/hcloud-windows-amd64.zip'

    checksum       = '0992e1bb85cefe78caae16ec40cd9648156d452ebaf8b736e3bba9bf33cce3fc'
    checksumType   = 'SHA256'
    checksum64     = 'c88f20292332f4c250b6fa471e949315e8fb48051e1e48e646e15da4245d3ba3'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
