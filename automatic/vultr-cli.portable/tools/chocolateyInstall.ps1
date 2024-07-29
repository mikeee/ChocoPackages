$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com/vultr/vultr-cli/releases/download/v3.3.1/vultr-cli_v3.3.1_windows_amd64.zip'

    checksum64     = '0c7def965183aa3571e1d4c9d903eedd5e31f116186387ea6eee550ee163c87c'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
