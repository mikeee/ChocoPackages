$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.28/civo-1.0.28-windows-amd64.zip'
    checksum64     = 'd008280aa0b8fac1322b5c5641467c0cc7d56cafc37f761d71ebb6ba5445609b'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
