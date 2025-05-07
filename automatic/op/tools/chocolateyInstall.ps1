$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.31.0/op_windows_386_v2.31.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.31.0/op_windows_amd64_v2.31.0.zip'

    checksum       = '302aa41ec467ede05d471614a512c40f1f73e4b8d2645e7eb022f90675436175'
    checksumType   = 'SHA256'
    checksum64     = '45a1f2180d272ca8d5182974fa618033691260b33fb1a53cb425d532b08374a3'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

