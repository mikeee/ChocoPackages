$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.5.2/civo-1.5.2-windows-amd64.zip'
    checksum64     = 'ac9449f12cc64670f221a6f5ca4f65b789e72d9fd4ef93001d3439474048430e'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
