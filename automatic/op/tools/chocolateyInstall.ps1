$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.10.0/op_windows_386_v1.10.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.10.0/op_windows_amd64_v1.10.0.zip'

    checksum       = '7432fb0282f66929746dab531143f0cc4d6a0f67328ddca6af6e3c8b92c9561f'
    checksumType   = 'SHA256'
    checksum64     = 'cd6a7d24e63df4f8b3933f74b86740520ddbad716e9847cdf161ae40af101ddc'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
    
