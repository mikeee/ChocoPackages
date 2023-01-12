$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.44/civo-1.0.44-windows-amd64.zip'
    checksum64     = '81b7fccb6da900d0adb95f757e5c905a7a7dabee71fafcc151ed909a8efef2ad'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
