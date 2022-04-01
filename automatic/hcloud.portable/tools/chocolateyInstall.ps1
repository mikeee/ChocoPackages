$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//hetznercloud/cli/releases/download/v1.29.4/hcloud-windows-386.zip'
    url64          = 'https://github.com//hetznercloud/cli/releases/download/v1.29.4/hcloud-windows-amd64.zip'

    checksum       = '32a2a59b1510f4a05c17c5c1fc99c80f0ed6f27801f39aa5ba78a5e2cce07ede'
    checksumType   = 'SHA256'
    checksum64     = 'a40d4845d64306fbe2a878f3c2f1bd0fd7ee6a9a7324dd7060fc14b46da555c1'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
