$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.29.0/op_windows_386_v2.29.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.29.0/op_windows_amd64_v2.29.0.zip'

    checksum       = 'aabb7a64f878061623dbb7a1f57049e89461fced1fcc302b539e43ed7459f992'
    checksumType   = 'SHA256'
    checksum64     = '761f2aa0f8907b397940cb69d9514efbcc4c67de6d64426e99a542edc60d615c'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

