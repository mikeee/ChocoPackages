$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.60.0/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.60.0/hcloud-windows-amd64.zip'

    checksum       = 'bfba8288a773c587f84f6cee467a7ed06692513d50efef35652bd21f6abf8426'
    checksumType   = 'SHA256'
    checksum64     = '3d5534b5d2a6a57fb11a979018454950fa457be8262b5e6089066f1d39117890'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
