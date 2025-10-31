$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com/dapr/cli/releases/download/v1.16.3/dapr_windows_amd64.zip'

    checksum64     = 'edc33c08dd865505b4cefe73535c58f539c6e28b92a9707107be67cdacda26c5'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
