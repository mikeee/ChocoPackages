$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.58.0/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.58.0/hcloud-windows-amd64.zip'

    checksum       = 'd6c6ccb2aef7748ee8b606479b6caaab04d958b3fc3b8dab4a244957c0b44fa9'
    checksumType   = 'SHA256'
    checksum64     = '8801e2338a0d687074852fe8ea22ffafbf9e0a789ba04185137806dac18c999d'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
