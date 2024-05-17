$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com/vultr/vultr-cli/releases/download/v3.1.0/vultr-cli_v3.1.0_windows_amd64.zip'

    checksum64     = '1baf66df14233bbcdd53e94de7ea0d0fb7b516210f8b1f2c51440ff527caa7fc'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
