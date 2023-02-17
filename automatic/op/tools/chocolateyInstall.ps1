$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.14.0/op_windows_386_v2.14.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.14.0/op_windows_amd64_v2.14.0.zip'

    checksum       = '5c38949ec1e6bf0ecd01e81eb223b8f219c9838ebfc8da61206066cee2815d37'
    checksumType   = 'SHA256'
    checksum64     = '6aa071066defb0f983a5de070776b46fd99462b69206373ae9944c57718c000f'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

