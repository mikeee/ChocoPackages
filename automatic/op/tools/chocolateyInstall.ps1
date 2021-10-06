$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.12.2/op_windows_386_v1.12.2.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.12.2/op_windows_amd64_v1.12.2.zip'

    checksum       = 'f923f0a546ff821be860fee75fca9d14ee5976ae86ec683e570d0004f391fe93'
    checksumType   = 'SHA256'
    checksum64     = '88c4402d7f5a97bca2666d49978a290b1df28c4391f08559f2d96a212ab92e08'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
    
