$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com/dapr/cli/releases/download/v1.18.1/dapr_windows_amd64.zip'

    checksum64     = '8c5cfbff4e91a7d2c3c9506543bc55e003af3e58871a43b5cc8c3b738458dc8c'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
