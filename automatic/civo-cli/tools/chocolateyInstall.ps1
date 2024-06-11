$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir

    url64          = 'https://github.com//civo/cli/releases/download/v1.0.87/civo-1.0.87-windows-amd64.zip'
    checksum64     = '663fd9ffe6b2ef3e7a2d686abf3b1f5ad37ba52e38d05602eeb47eaa73b9f05b'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
