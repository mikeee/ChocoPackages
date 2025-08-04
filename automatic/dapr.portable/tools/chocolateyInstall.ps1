$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com/dapr/cli/releases/download/v1.15.2/dapr_windows_amd64.zip'

    checksum64     = '2ae2248808a42dabf9294a799bdc38bde3800f963e128a7a2811e823076832ed'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
