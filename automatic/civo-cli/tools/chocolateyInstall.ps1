$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.22/civo-1.0.22-windows-amd64.zip'
    checksum64     = '27272a8d42f9db2524e4655fa39fd3cf10dca3efd89dfa0de2b91da5e0e6743d'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
