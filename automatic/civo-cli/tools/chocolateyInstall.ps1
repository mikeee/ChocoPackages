$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.1.97/civo-1.1.97-windows-amd64.zip'
    checksum64     = '56d7454467e160c9e866cf904dda63329d1fe79921f6130fa434396d1f8b6843'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
