$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.34.1/op_windows_386_v2.34.1.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.34.1/op_windows_amd64_v2.34.1.zip'

    checksum       = 'ed9708fce28d2313078febec90d90748a89a5b3f4555799ce28c2789527dd086'
    checksumType   = 'SHA256'
    checksum64     = '25b25226ae1b5e1d6aa42ee8b9c6d1b956797e495a989b458f1dcc23d17611bf'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

