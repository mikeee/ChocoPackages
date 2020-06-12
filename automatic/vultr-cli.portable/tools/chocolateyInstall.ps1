$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = ''
    url64          = ''

    checksum       = ''
    checksumType   = 'SHA256'
    checksum64     = ''
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
