$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.38.1/op_windows_386_v2.38.1.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.38.1/op_windows_amd64_v2.38.1.zip'

    checksum       = '246eeb7888faba08c1f529990329e85fb150a37c1e6c1c8ec118ff498bd1aa6b'
    checksumType   = 'SHA256'
    checksum64     = '33ca7a806bef7ad479c10d8694cfc8798d22acdea8fe237b92fbe1d3e5ecfd2a'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

