$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.1.1/op_windows_386_v1.1.1.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.1.1/op_windows_amd64_v1.1.1.zip'

    checksum       = 'e0f8c5a74526ddff58fc828305878303b277271dff303f383e339d359affd008'
    checksumType   = 'SHA256'
    checksum64     = 'cb8f8a3ef7dac895998d34e2341149b431f1f18ac3e2f9a8b5eccdd4e7ca428f'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
    
