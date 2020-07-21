$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//civo/cli/releases/download/v0.6.17/civo-0.6.17-windows-386.zip'
    checksum       = '8e78d0f815d119157d7a049cfd8cf635c40360c09dc0e750d2fe1eb202d4b066'
    checksumType   = 'SHA256'

    url64          = 'https://github.com//civo/cli/releases/download/v0.6.17/civo-0.6.17-windows-amd64.zip'
    checksum64     = '4971cd66d17cc4e1f6cdb1896f77945ec4d3f146aacf1b6f4324937f6bce003b'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
