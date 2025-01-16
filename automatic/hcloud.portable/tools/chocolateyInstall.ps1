$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.50.0/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.50.0/hcloud-windows-amd64.zip'

    checksum       = '630cb85b356103b585581e01e484f9e8bd90b2f812088c1be8b8854927a5fab4'
    checksumType   = 'SHA256'
    checksum64     = '45e46e681809c9de3a187a433d7d43fc85e903174f0d26d5e27f03f30b43c3ec'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
