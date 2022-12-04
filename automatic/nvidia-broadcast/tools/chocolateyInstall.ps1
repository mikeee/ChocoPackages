$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url64           = 'https://international.download.nvidia.com/Windows/broadcast/1.3.5/nvidia_broadcast_v1.3.5.4.exe'
    checksum64      = 'c28890f184f4f249990b94f031173193d641dc4df8138e4aa7cb425459cfce71'
    checksumType64  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '-s'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
