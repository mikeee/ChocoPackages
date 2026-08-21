$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com/dapr/cli/releases/download/v1.18.2/dapr_windows_amd64.zip'

    checksum64     = '6c1590186ff6b61f1c0ee46bd04e78e569fd2cc8628968f9bcda6cdedc275d64'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
