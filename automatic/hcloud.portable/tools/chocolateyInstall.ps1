$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//hetznercloud/cli/releases/download/v1.21.0/hcloud-windows-386.zip'
    url64          = 'https://github.com//hetznercloud/cli/releases/download/v1.21.0/hcloud-windows-amd64.zip'

    checksum       = 'b990eca66bbc41a0086ac4e79b69b6777dc57b562e78faa84297624c503893c5'
    checksumType   = 'SHA256'
    checksum64     = '7478f92d977d1151c93f3cbb13ecb0b1f8f0f4cff88310e8f8cc1acfcbf023dd'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
