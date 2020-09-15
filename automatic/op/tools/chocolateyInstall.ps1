$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.7.0/op_windows_386_v1.7.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.7.0/op_windows_amd64_v1.7.0.zip'

    checksum       = '1ea927df77b8efecbad4dac1d70d52fb84d19f6618726a4d85c3c994fb9d9f81'
    checksumType   = 'SHA256'
    checksum64     = '5607c3d483de7d06dc5646afc0e9d64eb489d5c3557737da581593aab323aab1'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
    
