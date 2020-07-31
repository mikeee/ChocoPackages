$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//civo/cli/releases/download/v0.6.19/civo-0.6.19-windows-386.zip'
    checksum       = '5dbf4f5a0a4e55625b23b096e7d55d75efd93eab8ad0fa4859b5f2c41b426d7c'
    checksumType   = 'SHA256'

    url64          = 'https://github.com//civo/cli/releases/download/v0.6.19/civo-0.6.19-windows-amd64.zip'
    checksum64     = '8cbb76fcd46701aa7c6904250788114142d845baa2346cb4bdf79cde7666b8b6'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
