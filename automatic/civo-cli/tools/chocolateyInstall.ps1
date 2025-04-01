$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.2.0/civo-1.2.0-windows-amd64.zip'
    checksum64     = 'e83bc45440aa17290a6ccc45902ccd047ce3da662f5cee872cf3b499347b6d39'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
