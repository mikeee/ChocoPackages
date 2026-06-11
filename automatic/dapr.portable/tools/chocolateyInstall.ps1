$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com/dapr/cli/releases/download/v1.18.0/dapr_windows_amd64.zip'

    checksum64     = '3f66b68a0678e39712f0cf93d5a3f38a198a57b0e6e829bb8f50fddb15807de8'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
