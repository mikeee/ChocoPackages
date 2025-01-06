$ErrorActionPreference = 'Stop'

$toolsDir   = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url64          = 'https://github.com/portapps/signal-portable/releases/download/7.36.1-9/signal-portable-win64-7.36.1-9.7z'
    checksum64     = 'e8bf81ec89fedcd3b75ed68034b7097b4e29aae77536d14c2d11bf098f85970d'
    checksumType64 = 'SHA256'
    unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs


