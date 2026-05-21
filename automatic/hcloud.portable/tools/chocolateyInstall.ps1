$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.65.0/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.65.0/hcloud-windows-amd64.zip'

    checksum       = '6a386f623d0fbe0b073545a4de0be19ca5598d8b7b5a9515fc95a6c6b445610d'
    checksumType   = 'SHA256'
    checksum64     = '7fc3783f70ecb57a4fdf81560871adefc8a6696c33f5b6fefc0efe1b0578e2a2'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
