$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.25/civo-1.0.25-windows-amd64.zip'
    checksum64     = 'd54055604f4003ac480125e42ee47515216045089001b3e49c9de9f80fa00116'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
