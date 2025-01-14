$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com/dapr/cli/releases/download/v1.14.1/dapr_windows_amd64.zip'

    checksum64     = '235307ef6094b4eba57e03f86fff0759d86049282b26152c390c9b82e74f12c0'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
