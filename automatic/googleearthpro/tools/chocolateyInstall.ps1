$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin-7.3.3.exe'
    checksum      = '30f4db70ade8c80bc40c1cc44f22ab725292f5f84d15dda8f7958891adcfc2c9'
    checksumType  = 'SHA256'
    url64         = 'https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin-7.3.3-x64.exe'
    checksum64    = 'fe2711c7cb75455b52d7e4a6700be296fd567af607d5d43bfa8ba7451bb7c2b7'
    checksumType64= 'SHA256'
    fileType      = 'EXE'
    silentArgs    = 'OMAHA=1'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
