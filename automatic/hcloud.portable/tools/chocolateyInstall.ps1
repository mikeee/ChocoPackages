$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.59.0/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.59.0/hcloud-windows-amd64.zip'

    checksum       = 'd589423622f89daad065a6cf724551f1ee2659c0c3a0ffc44f1b678764305645'
    checksumType   = 'SHA256'
    checksum64     = '615a6377e144d277e3eedd4ce7c15816beaf297b08c7268647faed300272cd1e'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
