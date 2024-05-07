$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.82/civo-1.0.82-windows-amd64.zip'
    checksum64     = '228ed85508d021730736fb3c1b53a8b35a70b29a06c8687962f7627c90fafffd'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
