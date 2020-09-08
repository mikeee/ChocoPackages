$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//civo/cli/releases/download/v0.6.27/civo-0.6.27-windows-386.zip'
    checksum       = 'f279dfb749d313d9a976f22f0a7a151c0cf4b11a2fc4483d10188045695b9193'
    checksumType   = 'SHA256'

    url64          = 'https://github.com//civo/cli/releases/download/v0.6.31/civo-0.6.31-windows-amd64.zip'
    checksum64     = 'b5ee23f9b0fa44f5f7bcb8a6aed2a8a7ccf7122753d62a40146dff38499ced80'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
