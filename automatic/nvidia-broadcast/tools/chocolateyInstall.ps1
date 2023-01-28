$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url64           = 'https://international.download.nvidia.com/Windows/broadcast/1.4.0.29/NVIDIA_Broadcast_v1.4.0.29.exe'
    checksum64      = '46861c79f09ec26b800bd9989854377e0f95ce4eaed598742de036ab2e5f144f'
    checksumType64  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '-s'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
