$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.32.1/op_windows_386_v2.32.1.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.32.1/op_windows_amd64_v2.32.1.zip'

    checksum       = '99cefb4cbcf9f8b56c984b91edc0fe4035433e2589437b6bf66a26a9b0261f2a'
    checksumType   = 'SHA256'
    checksum64     = 'aa7a9dfdce26c32469449dadb73325a3e9bf1f1cbee9bb743298ed2e4033c340'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

