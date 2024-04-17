$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.27.0/op_windows_386_v2.27.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.27.0/op_windows_amd64_v2.27.0.zip'

    checksum       = '6a8798c40e9ceee065050720be78a2e5d01e53e5a112b65cbe8fcd1f42b75c0f'
    checksumType   = 'SHA256'
    checksum64     = 'e23700d43fdc1eced8e030dbab716de9ac238f904dcfc9744b527ea7c903ddc4'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

