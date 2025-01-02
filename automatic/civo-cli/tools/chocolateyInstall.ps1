$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.1.93/civo-1.1.93-windows-amd64.zip'
    checksum64     = '66aeb45c8fb57d146cc588ec95640c1ff29e034a24afff7edd4b98fd2d7df4c6'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
