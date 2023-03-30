$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.16.1/op_windows_386_v2.16.1.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.16.1/op_windows_amd64_v2.16.1.zip'

    checksum       = 'd4f25909de1b700aba960478a59f7217185815e660d2022c212630f1edd29574'
    checksumType   = 'SHA256'
    checksum64     = 'a7177b48cfe55a5115b9b431274c008c8cd99de5b9e3c47bf2df1468dcb83931'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

