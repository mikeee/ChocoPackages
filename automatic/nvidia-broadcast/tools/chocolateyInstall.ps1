$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url64           = 'https://international.download.nvidia.com/Windows/broadcast/2.0.2/NVIDIA_Broadcast_v2.0.2.31240911.exe'
    checksum64      = 'effbeb63e55f8e6299d6375e80763704da2264d129ad0a19c02d97cba6fa7c40'
    checksumType64  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '-s'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
