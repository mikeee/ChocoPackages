$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//civo/cli/releases/download/v0.6.22/civo-0.6.22-windows-386.zip'
    checksum       = '95fc4e37f0a063a20d4e64c6c6205856e79cb8cad45748bad9c1e501b7c887ba'
    checksumType   = 'SHA256'

    url64          = 'https://github.com//civo/cli/releases/download/v0.6.22/civo-0.6.22-windows-amd64.zip'
    checksum64     = 'c9a153d64d452f8a4b659cd86b559afb05877b58512e9cd0569cd4acf99b9cbd'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
