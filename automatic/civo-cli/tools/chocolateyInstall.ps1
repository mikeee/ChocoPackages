$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//civo/cli/releases/download/v0.6.23/civo-0.6.23-windows-386.zip'
    checksum       = 'fbf6c94f0c08730e9de222109f3c9d58153ceab537a6b1b2181c7066dbd01e73'
    checksumType   = 'SHA256'

    url64          = 'https://github.com//civo/cli/releases/download/v0.6.23/civo-0.6.23-windows-amd64.zip'
    checksum64     = '12524807669d9ce7e73c8f169322121baa12fee6e9b4cadaaacb61cfc9ec0df7'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
