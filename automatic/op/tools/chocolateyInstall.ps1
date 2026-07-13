$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.35.0/op_windows_386_v2.35.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.35.0/op_windows_amd64_v2.35.0.zip'

    checksum       = '67b936fa14ca1ca7ceb94b772a06a49b927e7dcafdfbdc76ef8c15f7b5825c42'
    checksumType   = 'SHA256'
    checksum64     = 'f99f974f38c114c341fa589e4f4cc5e7b13fa1bf19a302283e438360636a796b'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

