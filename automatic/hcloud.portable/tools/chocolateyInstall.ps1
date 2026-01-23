$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.61.0/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.61.0/hcloud-windows-amd64.zip'

    checksum       = '5471ac72a0a50d21d08fbc41013983a5465d5046169571022ce22853ee4f680a'
    checksumType   = 'SHA256'
    checksum64     = 'e73d2476de51b5efa90f67c74543dc419c751d40b4424dea69c71d9fe9ac5601'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
