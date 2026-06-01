$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.5.3/civo-1.5.3-windows-amd64.zip'
    checksum64     = 'e1d0f1c1d958ca201a4d49e52130819281ef4d5d34e0f9e902340e810bdfe702'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
