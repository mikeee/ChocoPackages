$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.5.5/civo-1.5.5-windows-amd64.zip'
    checksum64     = '672283fd9e847d13d0609372e300279037c785fe320bc6a111b4151258db0cf1'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
