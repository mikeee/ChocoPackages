$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.48.0/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.48.0/hcloud-windows-amd64.zip'

    checksum       = 'b4522891d9e3e258007327ab26834285ab118a603f48ce483ace2bced9545444'
    checksumType   = 'SHA256'
    checksum64     = '05d9a575030dd9a5816ca1366af711328e260abf0840f430662aea1b858e8207'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
