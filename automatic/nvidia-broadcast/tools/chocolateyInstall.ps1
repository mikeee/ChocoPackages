$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url64           = 'https://international.download.nvidia.com/Windows/broadcast/2.0.1/NVIDIA_Broadcast_v2.0.1.25267890.exe'
    checksum64      = '962f55493dcb724fb01a003061a52c8571941d85bbeb34d90027f2d2a2316db5'
    checksumType64  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '-s'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
