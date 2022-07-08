$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://netcologne.dl.sourceforge.net/project/pidgin/Pidgin/2.14.9/pidgin-2.14.9-offline.exe'
    checksum 		  = '3bb3186222a491aae4da1c87544da30dab405b0f7f974bba6fd60963ec6c73c6'
    checksumType 	= 'sha256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Stop-Process -ProcessName pidgin* -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs
