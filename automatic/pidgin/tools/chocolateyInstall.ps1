$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://netcologne.dl.sourceforge.net/project/pidgin/Pidgin/2.14.8/pidgin-2.14.8-offline.exe'
    checksum 		  = 'b237de10d4fe5d44eabe97a7640d2a74b4d722a7cb2376cf5df2be632eda3f51'
    checksumType 	= 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Stop-Process -ProcessName pidgin* -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs
