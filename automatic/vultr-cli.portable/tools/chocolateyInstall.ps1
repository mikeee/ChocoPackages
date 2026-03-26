$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com/vultr/vultr-cli/releases/download/v3.9.2/vultr-cli_v3.9.2_windows_amd64.zip'

    checksum64     = 'd2efe342268fe428ad8a24460cd886a3883759b6cd5d2ce76d7935f0d2b14a58'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
