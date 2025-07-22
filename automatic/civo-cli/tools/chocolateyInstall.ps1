$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.4.1/civo-1.4.1-windows-amd64.zip'
    checksum64     = '85d346205640b7507f427f2b8b2e1c4d94c289b40f825946b2a6feeecbdc80d3'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
