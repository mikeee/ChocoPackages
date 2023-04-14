
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.32.1/tilt.0.32.1.windows.x86_64.zip'
    checksum64       = 'f9c1a82d227bea1cd5946d8a6cb41693aa5a829e01db8a5315a0c8132048112a'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
