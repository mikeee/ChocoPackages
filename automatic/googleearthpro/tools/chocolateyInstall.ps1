$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin-7.3.7.exe'
    checksum      = '1e3991e9b90b68ffa0a9fe6cb80476933a1a6defa7ae0db19257de3bf4c24db7'
    checksumType  = 'sha256'
    url64         = 'https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin-7.3.7-x64.exe'
    checksum64    = '12955495fb4357c88d18b2665513a5adadda0724152147529ca853c80354422b'
    checksumType64= 'sha256'
    fileType      = 'EXE'
    silentArgs    = 'OMAHA=1'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
