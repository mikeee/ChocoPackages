$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//hetznercloud/cli/releases/download/v1.23.0/hcloud-windows-386.zip'
    url64          = 'https://github.com//hetznercloud/cli/releases/download/v1.23.0/hcloud-windows-amd64.zip'

    checksum       = '2d41e941b4f03a7401a85a0955650abb137e341123800859e5866febdbb3c530'
    checksumType   = 'SHA256'
    checksum64     = 'e1ac01eefebec276c956b1c1d98ae420ccbcaf4aafecbe47c493049c4b65a661'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
