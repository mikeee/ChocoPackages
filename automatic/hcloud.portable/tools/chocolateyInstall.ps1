$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.70.2/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.70.2/hcloud-windows-amd64.zip'

    checksum       = '768c1ee97b484a1a64199835de6f7cd6c984975728e0431119fb1e206310bf34'
    checksumType   = 'SHA256'
    checksum64     = 'b513ff648f690f34183a085a9c40fa1908f083733835ceaead4162a9533d9c9b'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
