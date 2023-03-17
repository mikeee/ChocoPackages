$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.32.0/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.32.0/hcloud-windows-amd64.zip'

    checksum       = '12fb8bb3e73ba50f268b13cbaa34497ffd95d2d5cafa760917a545dfe2e61668'
    checksumType   = 'SHA256'
    checksum64     = '92245896e21be212b1737291e08fdfe90dcbd9808a2f6d196ca4b2df9c41d191'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
