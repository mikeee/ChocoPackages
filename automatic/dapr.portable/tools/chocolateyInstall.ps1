$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com/dapr/cli/releases/download/v1.15.0/dapr_windows_amd64.zip'

    checksum64     = 'f381863ace51d4a792bda59669c99149f482e30ca2444441813050e159cd34e5'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
