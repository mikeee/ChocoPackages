$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.68.0/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.68.0/hcloud-windows-amd64.zip'

    checksum       = '53a15910c019362579ac56442dfc7d9dd509579fa79b092f2b269309e91ad8b1'
    checksumType   = 'SHA256'
    checksum64     = '82dc811c7113f1194e7e2184101dbd4af8d00f363f6017d0997b189a384434ff'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
