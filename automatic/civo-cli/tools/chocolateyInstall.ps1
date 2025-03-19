$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.1.98/civo-1.1.98-windows-amd64.zip'
    checksum64     = 'e90e4da9bcd14c89cf8476215d11fe351b0fb7dc9e020c3b5d6dd661328f7334'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
