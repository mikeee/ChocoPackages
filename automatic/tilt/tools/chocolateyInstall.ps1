
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/tilt-dev/tilt/releases/download/v0.37.8/tilt.0.37.8.windows.x86_64.zip'
    checksum64       = 'b8abb4b50e98d45300bd953a717a684f3555b158ee1238c9c938d72d2bea8cbe'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
