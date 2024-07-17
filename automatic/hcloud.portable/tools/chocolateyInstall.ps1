$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.45.0/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.45.0/hcloud-windows-amd64.zip'

    checksum       = '5bc5d9badccaac6d24a98ee99e8bc73462ddc62253106db967aec5afbf0e8b79'
    checksumType   = 'SHA256'
    checksum64     = 'ff3debbc9f0acba391d445e59eb202c602338c03a208c836c0b18a1c49b25bff'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
