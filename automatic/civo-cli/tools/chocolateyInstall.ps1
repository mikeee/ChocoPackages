$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.1.95/civo-1.1.95-windows-amd64.zip'
    checksum64     = 'b203a68e975c17adf682631648c4de8d74cce34b8dbe26745fbec2aa8f3f5382'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
