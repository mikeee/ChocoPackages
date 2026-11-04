$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.42.0/op_windows_386_v2.42.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.42.0/op_windows_amd64_v2.42.0.zip'

    checksum       = '2a1104babbd679859ca811d7011029b94fd56e9ffaabfca5f2c534748465e72b'
    checksumType   = 'SHA256'
    checksum64     = '8c457a0dc852c15beb35af77717ed32294345a300e15c444ed42c79ebc4330e9'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

