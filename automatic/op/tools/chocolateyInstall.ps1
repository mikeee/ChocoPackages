$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.13.0/op_windows_386_v2.13.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.13.0/op_windows_amd64_v2.13.0.zip'

    checksum       = '80641319748f827366e147ddfd89abe38149fcf6f0d0d359636cf8a78a920c29'
    checksumType   = 'SHA256'
    checksum64     = 'c2e2a7820eb0a65933ecba27d9a1d9e6d07cf0ce9612ce32393c970d1de8ddc3'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

