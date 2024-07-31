$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.30.0/op_windows_386_v2.30.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.30.0/op_windows_amd64_v2.30.0.zip'

    checksum       = '35faa4854bea4327f990a21ee857caab4b8993e99780b87f0ab2c9187770e3fc'
    checksumType   = 'SHA256'
    checksum64     = '9f977d7e16684489b6f648126778489b97055636468946741eded742f2abcaa7'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

