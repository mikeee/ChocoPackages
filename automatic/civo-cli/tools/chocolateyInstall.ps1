$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.1.91/civo-1.1.91-windows-amd64.zip'
    checksum64     = '667084061544a1113b76c8992ecc4b1e00c73f52faf15b6ad7645464aae0ef68'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
