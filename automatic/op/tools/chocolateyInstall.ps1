$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.41.1/op_windows_386_v2.41.1.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.41.1/op_windows_amd64_v2.41.1.zip'

    checksum       = '6ca33a72bfdc2758ba090850ed37b13c956c6ccd7efefefffff3b7ca430de003'
    checksumType   = 'SHA256'
    checksum64     = '7c7ab33e0c1096db62645b72bdf3e284e8734cd39ee0175922ef7ab2a18370da'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

