$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//civo/cli/releases/download/v0.6.18/civo-0.6.18-windows-386.zip'
    checksum       = 'd9e231f65cb93e11a3373abd7b574529acfdca10898cbf9047bc7a35eaf2a53e'
    checksumType   = 'SHA256'

    url64          = 'https://github.com//civo/cli/releases/download/v0.6.18/civo-0.6.18-windows-amd64.zip'
    checksum64     = '62fdf7780f6f18e6c579f31ae0cb9a1b6d11204a6c22eb8a57ea8bc6f695d804'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
