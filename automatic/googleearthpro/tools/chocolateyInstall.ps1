$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin-7.3.6.exe'
    checksum      = 'ebf093542cf10105c02fc7e6ee650e1b11293e9ecb74ce4e7d906e04613e292d'
    checksumType  = 'sha256'
    url64         = 'https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin-7.3.6-x64.exe'
    checksum64    = 'dfb78631d794fd32b09fdc3c9105594f0e100d2343d6f9681612a84fa3fc5325'
    checksumType64= 'sha256'
    fileType      = 'EXE'
    silentArgs    = 'OMAHA=1'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
