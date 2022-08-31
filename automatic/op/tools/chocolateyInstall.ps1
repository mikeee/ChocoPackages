$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.7.0/op_windows_386_v2.7.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.7.0/op_windows_amd64_v2.7.0.zip'

    checksum       = ''
    checksumType   = ''
    checksum64     = ''
    checksumType64 = ''
}

Install-ChocolateyZipPackage @packageArgs
    
