
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = ''
    checksum       = ''
    checksumType   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
