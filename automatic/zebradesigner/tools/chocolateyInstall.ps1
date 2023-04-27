$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://www.zebra.com/content/dam/zebra_new_ia/en-us/software-printer/productivity-apps/zebra-designer-3/zebradesigner3-322629.exe'
    checksum 	  = '93d6fa89ec70e8a943075fbddbfd6e5e082fe7bd1479a580fb535da1dd28a2f2'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = 'ICONDESKTOP=FALSE /s'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
