$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.90/civo-1.0.90-windows-amd64.zip'
    checksum64     = '5498e306a938927a6921a8281734f79c7d6326c5b53f90cc146c605c24a81397'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
