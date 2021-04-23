$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.9.1/op_windows_386_v1.9.1.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.9.1/op_windows_amd64_v1.9.1.zip'

    checksum       = '7302ddf4a50dc7a9407f992dd7bdd0bd856fc7d1c85a51032eee7945d7fd95bd'
    checksumType   = 'SHA256'
    checksum64     = '9e8ab73a549c14c417ac3f182d180db2c3c2e6f4d963df5ccd0a048e11f4c300'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
    
