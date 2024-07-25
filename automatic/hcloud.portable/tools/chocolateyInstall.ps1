$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.46.0/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.46.0/hcloud-windows-amd64.zip'

    checksum       = '37b8a8f8173106797beb34f639f9f008cac4ef6afea144febc744a130da47f6a'
    checksumType   = 'SHA256'
    checksum64     = '0345cb0ed2ff69b9ed337d6e54a36cd157fc3699b383c34d2d19add1359cedc6'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
