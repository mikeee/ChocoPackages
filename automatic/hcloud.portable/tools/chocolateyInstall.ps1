$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//hetznercloud/cli/releases/download/v1.29.5/hcloud-windows-386.zip'
    url64          = 'https://github.com//hetznercloud/cli/releases/download/v1.29.5/hcloud-windows-amd64.zip'

    checksum       = '4659496567f04d7d88284c90c748b06ebb128846a0d97fcfdcb57ad3bcb1962a'
    checksumType   = 'SHA256'
    checksum64     = '1649157eadc67224890e0faa19fd925cb6db911d32dd85404e55449bd94c010a'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
