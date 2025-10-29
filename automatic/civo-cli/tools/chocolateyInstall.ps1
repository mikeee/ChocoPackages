$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.4.4/civo-1.4.4-windows-amd64.zip'
    checksum64     = 'e9e9a498956a2c9277358534a87a4d8f35b337d91b9b23cc7147f13c55222000'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
