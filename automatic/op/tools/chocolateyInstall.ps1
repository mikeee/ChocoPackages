$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.31.1/op_windows_386_v2.31.1.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.31.1/op_windows_amd64_v2.31.1.zip'

    checksum       = '33739da463138b52fd65992bdc8d6513f85e0b97c6c2bbeefb02fd18756ed3ff'
    checksumType   = 'SHA256'
    checksum64     = '7cf3a30bde910a8087052cd453186f80b72931b94fd4e90b4c6f5485c436b451'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

