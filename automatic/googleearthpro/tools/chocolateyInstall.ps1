$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin-7.3.6.exe'
    checksum      = 'c97c459d609a6114c696d703dac844ea0377cc64d04f88b08e5acc26fa91f779'
    checksumType  = 'sha256'
    url64         = 'https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin-7.3.6-x64.exe'
    checksum64    = '663d2e45bdf7df41d3d9a355a99c121d10a3830a23fc66bc554f1c532f6e2238'
    checksumType64= 'sha256'
    fileType      = 'EXE'
    silentArgs    = 'OMAHA=1'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
