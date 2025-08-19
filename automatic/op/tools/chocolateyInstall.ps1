$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.32.0/op_windows_386_v2.32.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.32.0/op_windows_amd64_v2.32.0.zip'

    checksum       = 'ac65421654c401cbc73cd75bce909ab74299197b467ed6a27c474678fa6c2299'
    checksumType   = 'SHA256'
    checksum64     = '7fba6d1f4df4eaf8db814e0b3e8c697cb46599bda691f7755c97988ba1cb339a'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

