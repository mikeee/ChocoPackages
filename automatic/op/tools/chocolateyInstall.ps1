$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.8.0/op_windows_386_v1.8.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.8.0/op_windows_amd64_v1.8.0.zip'

    checksum       = '8c597c73e1acec4efd53f66b9583b6126a147cfa4bf3cf23924a946680207dd9'
    checksumType   = 'SHA256'
    checksum64     = '40fe0991b041624a771f3992ea262d99b83809e9382d4130370ecc2033a506b5'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
    
