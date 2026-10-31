$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url64           = 'https://international.download.nvidia.com/Windows/broadcast/2.3.0/NVIDIA_Broadcast_v2.3.0.71988672.exe'
    checksum64      = 'c59e4bcbdaee4b56d12447086ee761ca41244ae3e048d1d2a849abb8e106f684'
    checksumType64  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '-s'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
