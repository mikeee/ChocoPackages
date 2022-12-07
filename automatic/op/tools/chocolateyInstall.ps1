$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.9.1/op_windows_386_v2.9.1.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.9.1/op_windows_amd64_v2.9.1.zip'

    checksum       = 'c7b3f7f171c60ceee26cc456700b0d1219ecb8aebf3bedd4b65a95133e811b30'
    checksumType   = 'SHA256'
    checksum64     = '2b5966bcb474b87d2b91a427e35a44e065a1a5f6b626c1f8afbf4cdb36682116'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

