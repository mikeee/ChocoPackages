$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.9.2/op_windows_386_v1.9.2.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.9.2/op_windows_amd64_v1.9.2.zip'

    checksum       = '614e1a7fed03c4f2f5958e524c743e144eab6952dcd31f027dead12fb5c7406e'
    checksumType   = 'SHA256'
    checksum64     = '836b31f4059eff1feb3143e36382957db4d9b57523e90be44728a387fbee9b68'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
    
