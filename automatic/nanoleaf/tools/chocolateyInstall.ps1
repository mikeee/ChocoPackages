$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://desktop-app-prod-1.s3.us-west-2.amazonaws.com/Nanoleaf+Desktop+Setup+2.2.2.exe'
    checksum 	  = 'DB36353918FC19B032FEE54DF879B91F5CFD3930EA51BF19FEE50586DB2E5B8E'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
