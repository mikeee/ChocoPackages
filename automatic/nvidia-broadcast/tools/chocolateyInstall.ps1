$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url64           = 'https://international.download.nvidia.com/Windows/broadcast/2.1.0/NVIDIA_Broadcast_v2.1.0.40430082.exe'
    checksum64      = 'd19ec2de488b0e45328f7bf3b5909bd20fa9c9e141957af5e90319efc9853317'
    checksumType64  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '-s'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
