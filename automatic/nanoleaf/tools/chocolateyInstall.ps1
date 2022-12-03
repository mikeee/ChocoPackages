$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://desktop-app-prod-1.s3.us-west-2.amazonaws.com/Nanoleaf+Desktop+Setup+1.3.0.exe'
    checksum 	  = '092BD0D6D01B3F3FB04A9E8746B9564AAF541E3133C528A79E4EB00172FD925B'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
