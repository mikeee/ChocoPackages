$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.44.2/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.44.2/hcloud-windows-amd64.zip'

    checksum       = '032ecde80428c52dd332cb20f6d0a9d3960932f04844f5a577d37c0e1849fa3c'
    checksumType   = 'SHA256'
    checksum64     = '3f9af58da26d056e54d33b7b2034bc81683e8834d78bef341f2fadce7615d957'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
