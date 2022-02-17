$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.16/civo-1.0.16-windows-amd64.zip'
    checksum64     = '32ee783efa6fc3f4f896344b88bc380d22944f8fa9fd7313799198692fc1bcbe'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
