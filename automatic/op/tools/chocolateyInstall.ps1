$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.3.0/op_windows_386_v1.3.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.3.0/op_windows_amd64_v1.3.0.zip'

    checksum       = '6e2bc433d3b1a249d4b3f284c5cb363268465d0788e8d3e7b14726af40aa0de7'
    checksumType   = 'SHA256'
    checksum64     = '18243aefaf2fda56cfdf8900c7c4e9dbe0bf8be235715df3f8f4ce5af79ecc6e'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
    
