$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.49/civo-1.0.49-windows-amd64.zip'
    checksum64     = 'cb50506ec1ca977c4e70e95fb542669db6e80c54ccd802951a53ae5fbc03a709'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
