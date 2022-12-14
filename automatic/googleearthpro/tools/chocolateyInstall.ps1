$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin-7.3.6.exe'
    checksum      = '26976889a871bd9434a99cf1f1c0813ef9d9c037cc9290ec43c576ed9979dd91'
    checksumType  = 'sha256'
    url64         = 'https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin-7.3.6-x64.exe'
    checksum64    = 'b0cd85e75655392e2c67ee0532f611b8d17161973f55cc7f4374c1e154697d68'
    checksumType64= 'sha256'
    fileType      = 'EXE'
    silentArgs    = 'OMAHA=1'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
