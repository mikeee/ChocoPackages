$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//hetznercloud/cli/releases/download/v1.26.0/hcloud-windows-386.zip'
    url64          = 'https://github.com//hetznercloud/cli/releases/download/v1.26.0/hcloud-windows-amd64.zip'

    checksum       = '10d764b7b9106a05f46d515128b6658f0f85f5479171a0524c9325873d84eb36'
    checksumType   = 'SHA256'
    checksum64     = '343d73f0a9b719258e7f3ed279105454d466fa410727b719befaca230c212e64'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
