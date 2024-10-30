$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://www.zebra.com/content/dam/zebra_new_ia/en-us/software-printer/productivity-apps/zebra-designer-3/zebradesigner3-322649.exe'
    checksum 	  = '7559325dc099f7f8da8b468a930b49ed4403aef498f2767f78bc8278fc001d97'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = 'ICONDESKTOP=FALSE /s'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
