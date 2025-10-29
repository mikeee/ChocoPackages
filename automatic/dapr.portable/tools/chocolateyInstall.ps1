$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com/dapr/cli/releases/download/v1.16.2/dapr_windows_amd64.zip'

    checksum64     = '02880c99e1a20904dccd69c53ed29fed36c1927c5133590849be42cd35662edc'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
