$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.33.0/op_windows_386_v2.33.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.33.0/op_windows_amd64_v2.33.0.zip'

    checksum       = 'd3e10417b2d670a36b6ec76a78bceaeaa3a7c7289c94d232c3e593a3d0c07a05'
    checksumType   = 'SHA256'
    checksum64     = '7834d9a381379e7d6a7f47a860f4782d22701a5fef3e48414c72da277dc8f501'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

