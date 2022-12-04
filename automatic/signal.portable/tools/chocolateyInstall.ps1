$ErrorActionPreference = 'Stop'

$toolsDir   = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url64          = ''
    checksum64     = ''
    checksumType64 = 'SHA256'
    unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs


