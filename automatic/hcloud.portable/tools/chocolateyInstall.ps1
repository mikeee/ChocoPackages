$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//hetznercloud/cli/releases/download/v1.18.0/hcloud-windows-386.zip'
    url64          = 'https://github.com//hetznercloud/cli/releases/download/v1.18.0/hcloud-windows-amd64.zip'

    checksum       = '27e43fdbf4ea62ff5579fafde36aa55627d5877b9e3766f97108a3d94507e010'
    checksumType   = 'SHA256'
    checksum64     = '1844e2c39713c24d828a87d1940a669e5b54e54a288c8b90475f6b2ef0af1c76'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
