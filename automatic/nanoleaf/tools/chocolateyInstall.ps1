$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://desktop-app-prod-1.s3.us-west-2.amazonaws.com/Nanoleaf+Desktop+Setup+1.3.1.exe'
    checksum 	  = 'C9B76392639A9FFFE6539A80F373765C36A46A866B4FA5B28C06CD06983F60D1'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
