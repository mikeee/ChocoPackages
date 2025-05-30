$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.51.0/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.51.0/hcloud-windows-amd64.zip'

    checksum       = '6f4e695d7e0326a4836d5791331858d7657f0ed5bb34e11815eda2b08de1bf42'
    checksumType   = 'SHA256'
    checksum64     = '41a700d1159764a5de54a19fab106e7514e1cb7389eea249431d92c5934099f5'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
