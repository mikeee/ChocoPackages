$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url64           = 'https://international.download.nvidia.com/Windows/broadcast/1.4.0.39/NVIDIA_Broadcast_v1.4.0.39.exe'
    checksum64      = 'fc6bf49af9c079a2f865f17d8de767d0759e71827eb68663fe7e5936655a5af9'
    checksumType64  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '-s'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
