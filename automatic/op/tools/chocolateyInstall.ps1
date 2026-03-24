$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.33.1/op_windows_386_v2.33.1.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.33.1/op_windows_amd64_v2.33.1.zip'

    checksum       = 'a9bdab71488a78170ef3a0c7cda1e436a073844a33660c4c27494210a227c977'
    checksumType   = 'SHA256'
    checksum64     = 'd013805ac1790ce34aeef564a5e3cb576aea09fa660c2f797b39d0e32f7800a2'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

