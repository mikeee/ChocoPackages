$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.69.0/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.69.0/hcloud-windows-amd64.zip'

    checksum       = 'a024512780070726ff8a377bacce53341d2834198d2a793e5a38849b01ead671'
    checksumType   = 'SHA256'
    checksum64     = '76ff326b7ad66e818564126c8964458fb6a365b6ff9087808e12d14f89443d22'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
