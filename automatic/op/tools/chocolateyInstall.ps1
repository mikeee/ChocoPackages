$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.13.1/op_windows_386_v2.13.1.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.13.1/op_windows_amd64_v2.13.1.zip'

    checksum       = '8f515370fa2b56c9fa2f1c1b161f7d6eb94db22fc16c302100acee6268c76c91'
    checksumType   = 'SHA256'
    checksum64     = 'd201b662eb9ec8618548b41fd18ccec8ff7b8fd2b7d0ca3b8d0155945d995ef1'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

