$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.81/civo-1.0.81-windows-amd64.zip'
    checksum64     = '9bb875de6740ebfee8b2655c6114ef185bc2c3d52d9b1c79ee5324fbd5ba0d8c'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
