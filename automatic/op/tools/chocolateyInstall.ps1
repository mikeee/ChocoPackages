$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.10.2/op_windows_386_v1.10.2.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.10.2/op_windows_amd64_v1.10.2.zip'

    checksum       = 'ddfed237c1b1349780c8192a668c5b7ba386f4b669a3aa1b09248150810f8881'
    checksumType   = 'SHA256'
    checksum64     = '0957badbc70fc0c6cf19a041594d49645fe9ab4f5bbdb085271576afc9df770e'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
    
