$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.11.0/op_windows_386_v1.11.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.11.0/op_windows_amd64_v1.11.0.zip'

    checksum       = 'a1d91a9c76da735e82f3ddbdb0add5a0da95443dbdcf7601a28e51f7ee6dbe20'
    checksumType   = 'SHA256'
    checksum64     = '0abf2650647efd5c337847d68802688a3747ccb008f9675b4d9419ecfc15c803'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
    
