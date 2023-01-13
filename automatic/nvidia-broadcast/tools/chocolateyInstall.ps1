$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url64           = 'https://international.download.nvidia.com/Windows/broadcast/1.4.0/NVIDIA_Broadcast_v1.4.0.28.exe'
    checksum64      = 'b6869d031b70af35eaee6ac6070cd033a64db457faa041969feee7d0b3a63ba7'
    checksumType64  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '-s'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
