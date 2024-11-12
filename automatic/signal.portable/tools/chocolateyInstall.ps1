$ErrorActionPreference = 'Stop'

$toolsDir   = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url64          = 'https://github.com/portapps/signal-portable/releases/download/7.32.0-8/signal-portable-win64-7.32.0-8.7z'
    checksum64     = 'd2c0915882afbb42414fa6e82aeddeb109a7ebc205dd6959fb35558bc2d3bd1a'
    checksumType64 = 'SHA256'
    unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs


