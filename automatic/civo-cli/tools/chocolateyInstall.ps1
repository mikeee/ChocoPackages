$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.2.2/civo-1.2.2-windows-amd64.zip'
    checksum64     = '7d8ec44321d750312a168921bcc0374aaaa7ad05575eb295c5652032146f7e2e'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
