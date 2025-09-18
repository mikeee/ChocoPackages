$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com/dapr/cli/releases/download/v1.16.1/dapr_windows_amd64.zip'

    checksum64     = 'cf93e9ac53610d42b74c2d5f06ec12bd77fe1a05e1cb97eed6415f839a1bdc99'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
