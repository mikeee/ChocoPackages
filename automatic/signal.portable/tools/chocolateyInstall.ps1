$ErrorActionPreference = 'Stop'

$toolsDir   = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url64          = 'https://github.com/portapps/signal-portable/releases/download/7.60.0-11/signal-portable-win64-7.60.0-11.7z'
    checksum64     = 'ac1f9efdc45d4fa09aec3047085b81d662297a4588d4e14241c50935ad7d41b1'
    checksumType64 = 'SHA256'
    unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs


