$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.11.3/op_windows_386_v1.11.3.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.11.3/op_windows_amd64_v1.11.3.zip'

    checksum       = '95c8d47ed772f607ad58c15890df528b811e9070f542e12c2ec62590b192ec8b'
    checksumType   = 'SHA256'
    checksum64     = '007f4177cb531f548a9d62151eb7d507c51b368cfbb4d493ea7b6fe83c12d2de'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
    
