$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.9.0/op_windows_386_v1.9.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.9.0/op_windows_amd64_v1.9.0.zip'

    checksum       = '89e5537fbdf30c21efda8e6e8b98775d1c5d0be0b87a4e2c48f621f5d161a0a9'
    checksumType   = 'SHA256'
    checksum64     = '6206c36305a508b9baf02b43bd6231c767606f7cf5c0b66c8a7c38a0c2e0b53f'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
    
