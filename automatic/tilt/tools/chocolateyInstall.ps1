
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.37.7/tilt.0.37.7.windows.x86_64.zip'
    checksum64       = '8ca1a39cc8005c778aa237e42e21fd3c0be6c6e97e8e808257c82858b7e69ad7'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
