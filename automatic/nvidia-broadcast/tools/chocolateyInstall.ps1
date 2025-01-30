$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url64           = 'https://international.download.nvidia.com/Windows/broadcast/2.0.0/NVIDIA_Broadcast_v2.0.0.23090415.exe'
    checksum64      = '1c497e7a7634ef88e73ff9482c58235f9d278a8e4b91ef02c39542b5ef59f1aa'
    checksumType64  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '-s'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
