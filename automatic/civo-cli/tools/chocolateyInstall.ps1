$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//civo/cli/releases/download/v0.6.27/civo-0.6.27-windows-386.zip'
    checksum       = 'f279dfb749d313d9a976f22f0a7a151c0cf4b11a2fc4483d10188045695b9193'
    checksumType   = 'SHA256'

    url64          = 'https://github.com//civo/cli/releases/download/v0.6.30/civo-0.6.30-windows-amd64.zip'
    checksum64     = 'c0160367d3af732a42a11f9ff9b78664e81c306ab6e7ef356500ab52e55818b9'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
