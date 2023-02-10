
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.31.2/tilt.0.31.2.windows.x86_64.zip'
    checksum64       = '7c479d840bfe9152498874a0ee7673e7dff6e86ac7154237691c1fbf787d6318'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
