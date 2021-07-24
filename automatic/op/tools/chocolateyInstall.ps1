$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.11.2/op_windows_386_v1.11.2.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.11.2/op_windows_amd64_v1.11.2.zip'

    checksum       = '35893834660eb4c837b2acac86625ced49bf36a19e25d82b27ceaf9c9667701f'
    checksumType   = 'SHA256'
    checksum64     = '6eb401f681f28c84ecd9ad5f58c27fc4e8a4744ab9d8a06c06c6811e921ff967'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
    
