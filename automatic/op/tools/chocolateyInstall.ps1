$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.11.4/op_windows_386_v1.11.4.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.11.4/op_windows_amd64_v1.11.4.zip'

    checksum       = '167948b430d4b2a2aa446b701edb539007b7288837a5697d66f15da1e8378bf3'
    checksumType   = 'SHA256'
    checksum64     = '13938d36e5529cf6fb0cd4978fbb528e0843f2d2981c0c6373ebbff73ae60173'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
    
