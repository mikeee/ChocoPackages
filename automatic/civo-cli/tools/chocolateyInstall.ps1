$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//civo/cli/releases/download/v0.6.27/civo-0.6.27-windows-386.zip'
    checksum       = 'f279dfb749d313d9a976f22f0a7a151c0cf4b11a2fc4483d10188045695b9193'
    checksumType   = 'SHA256'

    url64          = 'https://github.com//civo/cli/releases/download/v0.6.27/civo-0.6.27-windows-amd64.zip'
    checksum64     = '9f6ea743f34efc1120918daa99d2e0f25fb6ab0aa053a09a96af1129aa90344b'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
