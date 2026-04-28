$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.64.1/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.64.1/hcloud-windows-amd64.zip'

    checksum       = 'b5d13555c5ddc41724b14f1a99030e96d7afec229465ded481b2e7f65fef0d0e'
    checksumType   = 'SHA256'
    checksum64     = '5488ce6d3bb01e7845b1886a84026372f912d44eb02b464760bed0160c9c2039'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
