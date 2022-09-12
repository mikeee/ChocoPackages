﻿$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.36/civo-1.0.36-windows-amd64.zip'
    checksum64     = ''
    checksumType64 = ''
}

Install-ChocolateyZipPackage @packageArgs
