$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com/vultr/vultr-cli/releases/download/v3.5.0/vultr-cli_v3.5.0_windows_amd64.zip'

    checksum64     = '240ed3baf27e674b469206ace74e69f21c0f44d3714d99df8c8656483180682b'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
