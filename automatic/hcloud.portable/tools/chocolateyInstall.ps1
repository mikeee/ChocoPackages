$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//hetznercloud/cli/releases/download/v1.22.0/hcloud-windows-386.zip'
    url64          = 'https://github.com//hetznercloud/cli/releases/download/v1.22.0/hcloud-windows-amd64.zip'

    checksum       = 'f7063bdb42728cfe9f73903c6adee81bcb4de73062289fd166fbd51476d39e4d'
    checksumType   = 'SHA256'
    checksum64     = '6af17e83df523dd0e7b0890a06119d0c76e8d9cb6ab0decd1fb4778a6ca2794f'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
