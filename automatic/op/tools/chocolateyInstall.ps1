$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.10.3/op_windows_386_v1.10.3.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.10.3/op_windows_amd64_v1.10.3.zip'

    checksum       = 'aa9a9a9c8399b99a1912ba1c1bd8349ede132c1d9c9b749d38721d37b48754ac'
    checksumType   = 'SHA256'
    checksum64     = '3da5ac4482a1bb4ada3c1a7edace36145d7989d66267d6782533353d6139e758'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
    
