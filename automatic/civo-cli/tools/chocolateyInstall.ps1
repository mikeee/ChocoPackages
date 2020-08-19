$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//civo/cli/releases/download/v0.6.26/civo-0.6.26-windows-386.zip'
    checksum       = 'b5ede25ff23da08fbad55059585e1aa9651a88f3f7b53687be9830b0eeedf518'
    checksumType   = 'SHA256'

    url64          = 'https://github.com//civo/cli/releases/download/v0.6.26/civo-0.6.26-windows-amd64.zip'
    checksum64     = '897fc0bb560c39c62f77d263dc7bf3fe776915a87dae86758eb555eb183e3817'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
