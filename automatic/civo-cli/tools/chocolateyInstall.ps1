$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.4.0/civo-1.4.0-windows-amd64.zip'
    checksum64     = '20ea07252eeb4611b45d1c8cbf90afd7816a5baf195f845c444a40dd36015282'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
