$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://netcologne.dl.sourceforge.net/project/pidgin/Pidgin/2.14.2/pidgin-2.14.2-offline.exe'
    checksum 		  = 'd4bf10bb84ac24109c4e24e3038b30a141a3b3552b41522b8844d21511fac5b6'
    checksumType 	= 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Stop-Process -ProcessName pidgin* -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs
