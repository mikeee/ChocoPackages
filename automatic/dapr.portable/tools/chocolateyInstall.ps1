$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com/dapr/cli/releases/download/v1.17.0/dapr_windows_amd64.zip'

    checksum64     = '821b4f984c541d44d164b07d6371dac8a49a2f4dc4adb1ad9ffc63974d6349e9'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
