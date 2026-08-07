$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com/vultr/vultr-cli/releases/download/v3.11.0/vultr-cli_v3.11.0_windows_amd64.zip'

    checksum64     = '1f89f21d20f525b2b0c80630c6edcc691e3dbcb84073bc7ae8902f8a98f4116d'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
