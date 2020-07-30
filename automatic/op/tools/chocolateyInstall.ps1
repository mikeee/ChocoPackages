$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.4.0/op_windows_386_v1.4.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.4.0/op_windows_amd64_v1.4.0.zip'

    checksum       = '7dd637a94b76f9636713c490e41da0a077885ae6de4c5229d7494c499acaf529'
    checksumType   = 'SHA256'
    checksum64     = '3c4fc1db0c1900bfb325de44d0b8bc86be10e8bc485fddf3abc0457ae085faf3'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
    
