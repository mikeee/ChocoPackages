$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.12.3/op_windows_386_v1.12.3.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.12.3/op_windows_amd64_v1.12.3.zip'

    checksum       = '83299b76077930927ad1a8992d9514f9fa172717af68856b0f9a630220062fa7'
    checksumType   = 'SHA256'
    checksum64     = 'e617a028d8feb1e218bbc61755686187860bf6437b0bf47591277a83846ef7f5'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
    
