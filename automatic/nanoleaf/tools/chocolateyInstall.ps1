$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://desktop-app-prod-3.s3.us-west-2.amazonaws.com/Nanoleaf%20Desktop%20Setup%203.0.3.exe'
    checksum 	  = '3E6F2133869ACD7C0A35C93FC4DB69553C55B0882B6648B4DD3817B0D8546DCC'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
