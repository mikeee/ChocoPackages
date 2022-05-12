$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.27/civo-1.0.27-windows-amd64.zip'
    checksum64     = 'fa2bbcf388c0f581c5f9014c9f13602d9fdb50f801745b5c6cd7039ca2b48534'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
