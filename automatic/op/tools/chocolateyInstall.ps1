$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.16.0/op_windows_386_v2.16.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.16.0/op_windows_amd64_v2.16.0.zip'

    checksum       = 'e2dc92eba963c24c4f08a068d191e3a8f1dd1499384111e094639172d37e3e95'
    checksumType   = 'SHA256'
    checksum64     = '2b27b158f3b361892fbc971799391cc9cffdcf45bb6f7ab82c7b5f7fc776a538'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

