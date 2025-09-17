$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin-7.3.6.exe'
    checksum      = '50be0c04b12a577bb449d44388ed98310a47e5be852a9e7a43219dab32d220f7'
    checksumType  = 'sha256'
    url64         = 'https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin-7.3.6-x64.exe'
    checksum64    = 'd8aa6d38d95d92d18601f94b1da092b34f9d275ade630fb972baff8bf1e4ebd8'
    checksumType64= 'sha256'
    fileType      = 'EXE'
    silentArgs    = 'OMAHA=1'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
