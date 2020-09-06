$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.6.0/op_windows_386_v1.6.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.6.0/op_windows_amd64_v1.6.0.zip'

    checksum       = '5190adfa34e8ba71fad929b68a541cafcbd9e961a23ae46371d8401ceadcfc6c'
    checksumType   = 'SHA256'
    checksum64     = '7fbadd9691217264f4a72debfaa7f83d2943602dcfa361a69a156ac934375568'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
    
