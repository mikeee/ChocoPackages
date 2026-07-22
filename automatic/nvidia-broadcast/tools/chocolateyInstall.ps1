$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url64           = 'https://international.download.nvidia.com/Windows/broadcast/2.2.1/NVIDIA_Broadcast_v2.2.1.58338310.exe'
    checksum64      = '2ecbb93a9078f9c5b81d54dc178987818f6d0a593c8309ba58fab4342aafded2'
    checksumType64  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '-s'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
