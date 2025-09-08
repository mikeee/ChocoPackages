$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.52.0/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.52.0/hcloud-windows-amd64.zip'

    checksum       = 'aedceb5372bb32a280897ba9624e692baf370bebc42c361ade4210be68e23f7f'
    checksumType   = 'SHA256'
    checksum64     = 'dcbae1503815f4755a67dcee4f932ece8c3469f8a3d27fbffc99c3dc286b1989'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
