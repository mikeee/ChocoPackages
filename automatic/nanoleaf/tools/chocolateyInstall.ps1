$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://desktop-app-prod-3.s3.us-west-2.amazonaws.com/Nanoleaf%20Desktop%20Setup%203.0.2.exe'
    checksum 	  = 'FC8512C9D2C9E21171F4FA1F851B5CAD2B50E20DA4F5DE2F631BC00579727F65'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
