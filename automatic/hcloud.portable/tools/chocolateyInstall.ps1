$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//hetznercloud/cli/releases/download/v1.19.1/hcloud-windows-386.zip'
    url64          = 'https://github.com//hetznercloud/cli/releases/download/v1.19.1/hcloud-windows-amd64.zip'

    checksum       = '17430714c71f12b331577d14dd6bd5db38e75efec8ccb232d44f473c7f8813e6'
    checksumType   = 'SHA256'
    checksum64     = 'a6ef52628ff506abb2da2f4842fad2f48ea312669d9cc723079e3e0f9bc4ab47'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
