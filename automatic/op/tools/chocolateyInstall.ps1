$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.30.3/op_windows_386_v2.30.3.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.30.3/op_windows_amd64_v2.30.3.zip'

    checksum       = 'ff8f901f53977dd5cfd485add72375034cb2a1a953fef9c9cd97e8595287b4c1'
    checksumType   = 'SHA256'
    checksum64     = '3191456f345aab7435252284a5196fc94ecaf7f7ca3715338f01b17e50af1386'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

