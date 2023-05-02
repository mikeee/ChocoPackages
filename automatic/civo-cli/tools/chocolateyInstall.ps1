$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.51/civo-1.0.51-windows-amd64.zip'
    checksum64     = '5658fc3fe9210d3909db438bacd0e6d3c8b8930d02b137e810392bf05f6e6bcf'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
