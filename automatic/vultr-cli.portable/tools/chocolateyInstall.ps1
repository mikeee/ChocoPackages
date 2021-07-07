$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com//vultr/vultr-cli/releases/download/v2.6.0/vultr-cli_2.6.0_windows_64-bit.zip'

    checksum64     = 'db5aed3694cf941b4b55d43146f4952801dd5f082b163f0a212b269649bd1c71'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
