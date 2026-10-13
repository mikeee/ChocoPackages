$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.41.0/op_windows_386_v2.41.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.41.0/op_windows_amd64_v2.41.0.zip'

    checksum       = '4a2776b27f3da6003a62d47ea415a383a2d6a68120939d5ff33a72d1e95cca29'
    checksumType   = 'SHA256'
    checksum64     = '1338a6799ef9f66d1b7d526fcf195a37675e80171c557ded01afebb159e3490b'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

