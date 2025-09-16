$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com/dapr/cli/releases/download/v1.16.0/dapr_windows_amd64.zip'

    checksum64     = '952b912f513a9d836f8715f53c1373d567cc93798dbb544a5524599802597427'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
