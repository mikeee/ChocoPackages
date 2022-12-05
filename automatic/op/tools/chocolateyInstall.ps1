$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.8.0/op_windows_386_v2.8.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.8.0/op_windows_amd64_v2.8.0.zip'

    checksum       = '7a2e4997bb04f6a5ab97d553f8806c208f72e126b5c2e06dd6bcc7a1685020f6'
    checksumType   = 'SHA256'
    checksum64     = '1bd74955e351e8f3eb09cb0b3dd40de103b38759ffaeed26c7b1390cc62ed05d'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

