$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.12.0/op_windows_386_v2.12.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.12.0/op_windows_amd64_v2.12.0.zip'

    checksum       = '642fc2edc2f81a81fedf26919cb2f7312a30397aa3fdb8dedf4dacda92d3099e'
    checksumType   = 'SHA256'
    checksum64     = 'e256d82b42602d7ab1472b0ea918c69150c71dcddbbe0da1270b689b1e2d6dfa'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

