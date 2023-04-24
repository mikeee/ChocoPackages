$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.17.0/op_windows_386_v2.17.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op2/pkg/v2.17.0/op_windows_amd64_v2.17.0.zip'

    checksum       = '5c2c73428bef9e59ba51a4e6848cfeac19e18f04e7d9657f9551152001f82b1c'
    checksumType   = 'SHA256'
    checksum64     = '8582e418b296789392dea9cd0e0a51509d7b5977dc96a108a6de953d0f6f011a'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

