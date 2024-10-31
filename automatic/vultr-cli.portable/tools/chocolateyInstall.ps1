$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com/vultr/vultr-cli/releases/download/v3.4.0/vultr-cli_v3.4.0_windows_amd64.zip'

    checksum64     = 'abc50c7912e5e331fd2cfb356994c4c697e16a4519629a659610c3a694f36eb8'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
