$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.70.1/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.70.1/hcloud-windows-amd64.zip'

    checksum       = 'd04518316fe82770275f829bab7687560ac834e9f0ea6f9b9366cc8e27572987'
    checksumType   = 'SHA256'
    checksum64     = 'a8c7325062f14aa882260d23d00d0d222d61cf4096471deaa507409bc455782a'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
