$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.46/civo-1.0.46-windows-amd64.zip'
    checksum64     = '8f08621f397a7c941b17cd6ac917d78676c3d946d1d238643e9493af3157d98d'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
