
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.37.2/tilt.0.37.2.windows.x86_64.zip'
    checksum64       = '7bba5213eb142fe1d8e2226db8ad850ec2302306d7073f8b1f15b8f9b6cfe91a'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
