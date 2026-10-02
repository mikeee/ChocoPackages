$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.40.0/op_windows_386_v2.40.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.40.0/op_windows_amd64_v2.40.0.zip'

    checksum       = 'b6b61e984c2b866b0f9a6804edab3258c98fa2f2516851d6c1b2d60b9d6e32b2'
    checksumType   = 'SHA256'
    checksum64     = 'edc4519f8a7215e81031c0ff3ee1aa99eb79e6e5c771d152beea4fb66975faae'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

