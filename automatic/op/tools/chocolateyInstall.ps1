$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.5.1/op_windows_386_v2.5.1.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.5.1/op_windows_amd64_v2.5.1.zip'

    checksum       = '55d293b40592fa649f189ebbe520d9ca0bc1f46eea78c2d7c2a93fe74169f19a'
    checksumType   = 'SHA256'
    checksum64     = '1c45f4eb9d05077f7d124d52547be68dc81561c969385661d3fdf038759cdd10'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
    
