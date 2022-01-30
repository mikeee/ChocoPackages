$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.12.4/op_windows_386_v1.12.4.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.12.4/op_windows_amd64_v1.12.4.zip'

    checksum       = 'a8e2ef405af14b8fb3482ed7f8b66a3f1383a2a86062589e3acc6bc446b13006'
    checksumType   = 'SHA256'
    checksum64     = 'd14b7a864ebabc9b5ed95ea6b13e676a5795ede54b6187b4233249694478b1c9'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
    
