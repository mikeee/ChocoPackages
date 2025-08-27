
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.35.1/tilt.0.35.1.windows.x86_64.zip'
    checksum64       = 'd1cefb351b447f74310c78c92fa08da7461efb49b9a375a0214118e9ce7f2874'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
