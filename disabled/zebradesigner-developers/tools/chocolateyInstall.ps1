$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://www.zebra.com/content/dam/zebra_new_ia/en-us/software-printer/productivity-apps/zebradesigner-3-for-developers/zebradesigner3-developers-322649.exe'
    checksum 	  = 'c0bfd7534fcfb283109fd78ce1a87ea06124baf28ce2819eb45d9abda107c285'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = 'ICONDESKTOP=FALSE /s'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
