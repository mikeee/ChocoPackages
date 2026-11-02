$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.6.0/civo-1.6.0-windows-amd64.zip'
    checksum64     = '729662bdfd7940a1d200c2fda382084c21cedb0419ef36829b6a802c4bfad4fb'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
