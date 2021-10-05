$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.12.1/op_windows_386_v1.12.1.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.12.1/op_windows_amd64_v1.12.1.zip'

    checksum       = '6d09a0917b50c0c9409985e46d9cb4088febe13b59fdfb1405aee4517cc8d6e9'
    checksumType   = 'SHA256'
    checksum64     = '3891b2803a839b33b5d7c2864b3e49562932cc7840b06a9c6957042ed51ec8a8'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
    
