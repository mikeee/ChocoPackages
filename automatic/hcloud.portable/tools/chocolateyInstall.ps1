$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//hetznercloud/cli/releases/download/v1.16.2/hcloud-windows-386.zip'
    url64          = 'https://github.com//hetznercloud/cli/releases/download/v1.16.2/hcloud-windows-amd64.zip'

    checksum       = '9099acf8cff3579018bf20e865fcdb6b3f956b567066c5a60a31f2de18e25cb7'
    checksumType   = 'SHA256'
    checksum64     = '48f911293aa7a06edd838fcac9f4e3cb5210fe460c1b740b0301fe3c33e7f259'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
