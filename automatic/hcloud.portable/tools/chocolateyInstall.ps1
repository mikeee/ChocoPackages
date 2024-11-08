$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.49.0/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.49.0/hcloud-windows-amd64.zip'

    checksum       = '0a73a357f52328a745543ce7b9dc512d9dafeeaf1cca895a9416bb7a5d91d1e8'
    checksumType   = 'SHA256'
    checksum64     = '96b8f2162aec983d5b447d48c366b807443d65af5a105c088709fcbce27a9931'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
