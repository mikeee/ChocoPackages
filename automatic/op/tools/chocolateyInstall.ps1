$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.11.0/op_windows_386_v2.11.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.11.0/op_windows_amd64_v2.11.0.zip'

    checksum       = 'e1eca798574fd0cdeef76e830bff10711db5f88870756d984a079d0de6550a84'
    checksumType   = 'SHA256'
    checksum64     = 'dc624a903db15008307d964a4762683990787ba68afed6563b138adbbf18095c'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

