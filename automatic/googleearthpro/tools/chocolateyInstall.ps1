$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin-7.3.4.exe'
    checksum      = 'a8343a136b0ce4c130970e76d7e1ec562384ef0f0d7a6e9c2b61e93c6106d77c'
    checksumType  = 'SHA256'
    url64         = 'https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin-7.3.4-x64.exe'
    checksum64    = '25a53b44656f7d40a86a75dae64977c95ce99e59d523064a180e1fc8ec4b3439'
    checksumType64= 'SHA256'
    fileType      = 'EXE'
    silentArgs    = 'OMAHA=1'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
