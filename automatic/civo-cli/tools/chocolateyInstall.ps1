$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//civo/cli/releases/download/v0.6.24/civo-0.6.24-windows-386.zip'
    checksum       = '4c1c851b8f90619b8b74e4b8146fa20da8b34f99f693a3bc49518e61fab01d12'
    checksumType   = 'SHA256'

    url64          = 'https://github.com//civo/cli/releases/download/v0.6.24/civo-0.6.24-windows-amd64.zip'
    checksum64     = '38544d06dbc45919606f5e90ce26b3bac89e544e8f2fdd370973523a3695a072'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
