$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://desktop-app-prod-1.s3.us-west-2.amazonaws.com/Nanoleaf+Desktop+Setup+1.8.3.exe'
    checksum 	  = '27CCC41CEB3C6F18D9030B68750E3B0F407A0FB4C2A835A777E82B6C075A8C4B'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
