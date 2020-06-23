$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = ''
    checksum 		  = ''
    checksumType 	= 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Stop-Process -ProcessName pidgin* -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs
