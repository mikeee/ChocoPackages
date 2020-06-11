$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = ''
    url64          = ''

    checksum       = ''
    checksumType   = ''
    checksum64     = ''
    checksumType64 = ''
}

Install-ChocolateyZipPackage @packageArgs
