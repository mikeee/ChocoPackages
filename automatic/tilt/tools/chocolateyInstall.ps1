
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.33.13/tilt.0.33.13.windows.x86_64.zip'
    checksum64       = 'b7f5a42224a5a837cfd858bb696c66582fbbec5919afafa4c2ad924993343367'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
