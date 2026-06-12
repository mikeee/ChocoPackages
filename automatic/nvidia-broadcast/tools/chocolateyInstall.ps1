$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url64           = 'https://international.download.nvidia.com/Windows/broadcast/2.2.0/NVIDIA_Broadcast_v2.2.0.54169681.exe'
    checksum64      = 'b0bd92d44816c713385cf187dce0dc51645386b8d23aa9fd8468887b46242362'
    checksumType64  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '-s'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
