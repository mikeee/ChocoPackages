$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//hetznercloud/cli/releases/download/v1.19.0/hcloud-windows-386.zip'
    url64          = 'https://github.com//hetznercloud/cli/releases/download/v1.19.0/hcloud-windows-amd64.zip'

    checksum       = '0609c6a1bb4e5511241034fd97853e125fc92edf52f4eb47ccb18ec09567ae56'
    checksumType   = 'SHA256'
    checksum64     = 'e87c4d98870a63ff7c6b22f9c8df1834779e2d9ecb00b4385687debede0409cf'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
