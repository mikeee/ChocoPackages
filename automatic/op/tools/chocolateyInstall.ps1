$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.28.0/op_windows_386_v2.28.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.28.0/op_windows_amd64_v2.28.0.zip'

    checksum       = '9f17b3e2c3d807a98a2b0e9d8bedfa222c82561a502424e048b824e780af9d64'
    checksumType   = 'SHA256'
    checksum64     = 'ad9520de6335f98bfeaf65c89103bc7984c94b7f630809ad3d9b32f284d66863'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

