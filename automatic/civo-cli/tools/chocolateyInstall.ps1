$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.23/civo-1.0.23-windows-amd64.zip'
    checksum64     = '2b50e1209dc7107c034cb8009e6d28a9ce2480cdb53403939e7ba0efdd77f501'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
