$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.2.0/op_windows_386_v1.2.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.2.0/op_windows_amd64_v1.2.0.zip'

    checksum       = 'bb548b52a14184b7e11257775958f1d8dcc53dc5c81d93b13a9552326bea8ce3'
    checksumType   = 'SHA256'
    checksum64     = '1157aeadb8132e548eecbc56c7033868f03903423cae2ff763df011e85b1390c'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
    
