$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com//vultr/vultr-cli/releases/download/v2.12.2/vultr-cli_2.12.2_windows_64-bit.zip'

    checksum64     = 'cb39954a9b5f4f91c565332d4d28125f60870b88be1cee2731fd5d6ca9aed79f'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
