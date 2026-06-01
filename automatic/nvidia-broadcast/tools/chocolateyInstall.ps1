$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url64           = 'https://international.download.nvidia.com/Windows/broadcast/2.2.0/NVIDIA_Broadcast_v2.2.0.52896077.exe'
    checksum64      = 'a5e387d0edda69a646b74cac4e40466b15cfec282dc6b2252b0ad118ec690acb'
    checksumType64  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '-s'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
