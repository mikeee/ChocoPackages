$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.70.0/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.70.0/hcloud-windows-amd64.zip'

    checksum       = '47439c0fb3a307c121506a9685ffbb99c4727282a6a30e5aa0af776dfbda4b03'
    checksumType   = 'SHA256'
    checksum64     = 'd9873f036badc5a92c5fea796b2bb59e984c23308539031a7d405c278a701da9'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
