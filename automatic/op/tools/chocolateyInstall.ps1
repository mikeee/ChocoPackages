$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.10.1/op_windows_386_v1.10.1.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.10.1/op_windows_amd64_v1.10.1.zip'

    checksum       = 'a05d2ffc6b74f24bfdbfefa1423085e08eeb1297ffca24c3a84ad2f7e54e0b13'
    checksumType   = 'SHA256'
    checksum64     = '3c5e5a7acc9c7f934927042b62a202fa076083e0147b1d0943f548dd1306b0e6'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
    
