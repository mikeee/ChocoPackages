$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.15.0/op_windows_386_v2.15.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.15.0/op_windows_amd64_v2.15.0.zip'

    checksum       = '0f57e21571d6af622d4311867ffa7e05bb4d52e9d5014cc323fdce169fbcf7b1'
    checksumType   = 'SHA256'
    checksum64     = '9819ad9a101c5011fd11aa96027d33fcfd621cb14dc5e15484e2e430a88fcc01'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

