$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com/dapr/cli/releases/download/v1.17.1/dapr_windows_amd64.zip'

    checksum64     = '4c48b861ee80893a1db69b4f23b781919f5a1082361c3ac38a3f4f57dae06fdc'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
