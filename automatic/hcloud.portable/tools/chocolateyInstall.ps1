$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.43.1/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.43.1/hcloud-windows-amd64.zip'

    checksum       = '5bd0fa322fa5df7b514519d9371a99f13f1534f729238a56190bcffe5857b5ca'
    checksumType   = 'SHA256'
    checksum64     = '92acc396f75679181f0e0604f351806a7d9ea65a18614b0592541609581fa317'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
