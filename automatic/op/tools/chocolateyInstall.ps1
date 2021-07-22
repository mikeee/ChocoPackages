$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.11.1/op_windows_386_v1.11.1.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.11.1/op_windows_amd64_v1.11.1.zip'

    checksum       = '08ef106a546f81027afd63df39273476c4c7d8901b313bb747ce2bc26e9e3dd0'
    checksumType   = 'SHA256'
    checksum64     = 'e64ee0d17ca4feac283c276801e70b6c744175e322f988afa28758ce5fb5cadd'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
    
