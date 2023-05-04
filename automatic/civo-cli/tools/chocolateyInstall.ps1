$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.53/civo-1.0.53-windows-amd64.zip'
    checksum64     = '816e4ac5723d1b32c18b57c2e62a5822c6fbbf4b4e8bad022d2be56c8ea097b9'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
