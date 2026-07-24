$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.67.0/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.67.0/hcloud-windows-amd64.zip'

    checksum       = '1e7c8195fbce4e66503589adcd1ecd9ebbb04dbc3c8ffb5f248ead10032a6e9a'
    checksumType   = 'SHA256'
    checksum64     = 'a31d9effd17c9c9effcc24ba3674326a7798fc6f29d94ce4dcf49c8ad6aa3648'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
