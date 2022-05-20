$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.12.5/op_windows_386_v1.12.5.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.12.5/op_windows_amd64_v1.12.5.zip'

    checksum       = 'dac6d21379e72d41921ce8d434692be7c3e9d4ee3807e18685025ae315953a55'
    checksumType   = 'SHA256'
    checksum64     = '146ed49680ac0b97aa3960fc904144a05ac0a9bc78eaa7590a650068ee8e5bf0'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
    
