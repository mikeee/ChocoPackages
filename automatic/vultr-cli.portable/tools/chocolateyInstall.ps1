$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com/vultr/vultr-cli/releases/download/v3.7.0/vultr-cli_v3.7.0_windows_amd64.zip'

    checksum64     = '7a77918911c4e4fb02b6d43f3ebfbaea70984c8d3f1dbb61f47bf6fc6467f651'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
