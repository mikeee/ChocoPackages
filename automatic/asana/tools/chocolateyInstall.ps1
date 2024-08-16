$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName     = $env:ChocolateyPackageName
    url             = 'https://desktop-downloads.asana.com/win32_ia32/prod/latest/AsanaSetup.exe'
    checksum        = 'bf7a6306a04de7bb3e9debb07c2b6cb498d235ec130c8d8b4f1a621154d9f17f'
    checksumType    = 'SHA256'
    url64           = 'https://desktop-downloads.asana.com/win32_x64/prod/latest/AsanaSetup.exe'
    checksum64      = 'b83fd958f8e1daa42c9d14623c4d755e37edcb1b8b7dc5fa5e1d358e801b5f23'
    checksumType64  = 'SHA256'
    fileType        = 'EXE'
    silentArgs      = '--silent'
    validExitCodes  = @(0)
}

Install-ChocolateyPackage @packageArgs
