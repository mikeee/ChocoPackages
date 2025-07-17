$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com/vultr/vultr-cli/releases/download/v3.6.0/vultr-cli_v3.6.0_windows_amd64.zip'

    checksum64     = '050febea29a6404c8139ebcfd17cb91f230bb42c1bff5d26b607cee7a1ec3c6c'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
