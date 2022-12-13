$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.10.0/op_windows_386_v2.10.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.10.0/op_windows_amd64_v2.10.0.zip'

    checksum       = '6bb5a3e527583635170aa4ebff2de23cabff8c72caef71844234f42997644cca'
    checksumType   = 'SHA256'
    checksum64     = 'e51d6c717256368e16c818212ea3315e0cadc6652e57a2d4db6b8aaeec163589'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

