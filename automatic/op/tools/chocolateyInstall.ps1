$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.2.1/op_windows_386_v1.2.1.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.2.1/op_windows_amd64_v1.2.1.zip'

    checksum       = 'a407f07f2d835afa35ccae4441f0944f740732249cb9cc4cc669d71e22339867'
    checksumType   = 'SHA256'
    checksum64     = '45c7f87e433197c6d1478d90f45db9dedf50b1e3427295af71b36c2d8d491c0c'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
    
