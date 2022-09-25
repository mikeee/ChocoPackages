$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin-7.3.4.exe'
    checksum      = 'fa46be3ca404015e56ff3219052afbe702ac2ce02130e49135753e8a0b25d5ae'
    checksumType  = 'sha256'
    url64         = 'https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin-7.3.4-x64.exe'
    checksum64    = '2b1bdcb63b7239505e89ce2632555fa86851a47231a0e85b168245e56c02ba08'
    checksumType64= 'sha256'
    fileType      = 'EXE'
    silentArgs    = 'OMAHA=1'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
