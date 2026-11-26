$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.71.0/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.71.0/hcloud-windows-amd64.zip'

    checksum       = '27b767070601377c0cd12b5b9a6bfb27d647101ba998bb5451d8c719ed0b1690'
    checksumType   = 'SHA256'
    checksum64     = '91f8299a5497805de42485b1a42226cfc3a8b9186a426bc7cd77697e61bb15a0'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
