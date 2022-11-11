$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.30.4/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.30.4/hcloud-windows-amd64.zip'

    checksum       = '75b590594d185fe5f68bf4480d7b4fc6a1312a6084438dc6cfb9672ff84f2205'
    checksumType   = 'SHA256'
    checksum64     = '4b80fdfab98f61a43ce9564bbba50ccb314b1b91cc657b908efbe62796014bef'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
