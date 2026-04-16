$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.34.0/op_windows_386_v2.34.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.34.0/op_windows_amd64_v2.34.0.zip'

    checksum       = 'db46e206c3316efcd0b26f03f78f57c20aa1c763cf99301802e84621b41a80cf'
    checksumType   = 'SHA256'
    checksum64     = 'ea1fdea5bc52a8cff3f6b502c03ec5a567cd6e97d38fac35c511841e7dfd67fc'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

