$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://www.zebra.com/content/dam/zebra_new_ia/en-us/software-printer/productivity-apps/zebradesigner-3-for-developers/zebradesigner3-developers-322629.exe'
    checksum 	  = 'eca67ba41c0be0eb2023bf6da4155d95b1516070754cd3007f236e910e2bc783'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = 'ICONDESKTOP=FALSE /s'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
