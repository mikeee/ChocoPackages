$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com/dapr/cli/releases/download/v1.19.1/dapr_windows_amd64.zip'

    checksum64     = 'fd9c01b339802e361f21deafef91c08d39fa883b3de4d04ef69116b84cb3f1d9'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
