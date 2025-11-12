$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com/dapr/cli/releases/download/v1.16.5/dapr_windows_amd64.zip'

    checksum64     = '245ff84aa88d560317fad5910cafcbf96d5c90a3c22d530651432197c6608694'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
