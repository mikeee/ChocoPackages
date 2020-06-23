$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin-7.3.3.exe'
    checksum      = '642623f3f7f74dcf073fbaadac14950f0ca6c2bdfcf86c32e5d3e9cb2beba576'
    checksumType  = 'SHA256'
    url64         = 'https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin-7.3.3-x64.exe'
    checksum64    = 'db973894d401a715fd745d604fabee64649a8d6c4c0390aa883b61f65bb47fdb'
    checksumType64= 'SHA256'
    fileType      = 'EXE'
    silentArgs    = 'OMAHA=1'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
