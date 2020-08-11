$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//civo/cli/releases/download/v0.6.21/civo-0.6.21-windows-386.zip'
    checksum       = '6211651b2ba89ec6ee282bb2b21ac5e56faf4bcf1b223a56e242ee684bfd6b75'
    checksumType   = 'SHA256'

    url64          = 'https://github.com//civo/cli/releases/download/v0.6.21/civo-0.6.21-windows-amd64.zip'
    checksum64     = '8832772f682b32894d2c8716c08c52a21f5c118a561e9f61dd10dcd662222758'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
