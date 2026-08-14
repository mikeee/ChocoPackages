$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.39.0/op_windows_386_v2.39.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.39.0/op_windows_amd64_v2.39.0.zip'

    checksum       = '79d9bc6a2b2b9f38cbe8076c0e0756f707be9b4320aa754588eff5b64c928087'
    checksumType   = 'SHA256'
    checksum64     = '38b3748d76d104469eb6e2744f843d2a7e03d1b6d330cc42d600cff379c37bab'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

