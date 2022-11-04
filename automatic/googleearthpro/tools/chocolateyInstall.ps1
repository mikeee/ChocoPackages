$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin-7.3.6.exe'
    checksum      = '971ba28d98c241760da55fb56306ea523a67f1c44fdd5735d5d403e8def51cd3'
    checksumType  = 'sha256'
    url64         = 'https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin-7.3.6-x64.exe'
    checksum64    = '48a8f9b18002d415e49cbd455f0ed1b0c130b1f102ea8adbfbe44c59e728e002'
    checksumType64= 'sha256'
    fileType      = 'EXE'
    silentArgs    = 'OMAHA=1'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
