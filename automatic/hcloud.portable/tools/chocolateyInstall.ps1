$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//hetznercloud/cli/releases/download/v1.30.3/hcloud-windows-386.zip'
    url64          = 'https://github.com//hetznercloud/cli/releases/download/v1.30.3/hcloud-windows-amd64.zip'

    checksum       = '532be08f0094279bf81d19cb3c45c5ef477988a7bbae9f698f9bfb962100b84d'
    checksumType   = 'SHA256'
    checksum64     = 'a4cd882f0f44c500285fd6777fa111372f6134bc7d62e2f07adfa6a1e6ebb485'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
