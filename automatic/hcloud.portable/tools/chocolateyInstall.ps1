$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//hetznercloud/cli/releases/download/v1.24.0/hcloud-windows-386.zip'
    url64          = 'https://github.com//hetznercloud/cli/releases/download/v1.24.0/hcloud-windows-amd64.zip'

    checksum       = 'c734be35b91517d82a012e99bbb17f732ff34a93a5ec5148bbc7fe2e9fed676d'
    checksumType   = 'SHA256'
    checksum64     = '08cf3c561abd40b9e820f91f1663840bc9e7e09b6891a0610b5d46ee975bee31'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
