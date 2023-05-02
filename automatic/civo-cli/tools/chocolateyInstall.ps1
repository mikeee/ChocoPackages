$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.52/civo-1.0.52-windows-amd64.zip'
    checksum64     = '31633c29e805276096b6a3b9d7c868fda5f7dee043187b2651a1f949d542e466'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
