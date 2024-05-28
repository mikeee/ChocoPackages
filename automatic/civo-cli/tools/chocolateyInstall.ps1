$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.84/civo-1.0.84-windows-amd64.zip'
    checksum64     = 'b7e8f26a06a482c603cc831902ed8d6f6a377f49b3e6ab8e1048e67106c1fa2c'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
