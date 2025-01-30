$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url64           = 'https://international.download.nvidia.com/Windows/broadcast/2.0.0/NVIDIA_Broadcast_v2.0.0.22863662.exe'
    checksum64      = '96ec754065938613391cd690f1138eda08070628e8a91751e866e2c351d156c9'
    checksumType64  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '-s'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
