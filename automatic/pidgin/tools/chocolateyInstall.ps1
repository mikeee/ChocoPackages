$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://netcologne.dl.sourceforge.net/project/pidgin/Pidgin/2.14.8/pidgin-2.14.8-offline.exe'
    checksum 		  = '8245f212a216ab49d52808079f8f882d787681a026d29b33f63f036d676bff67'
    checksumType 	= 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Stop-Process -ProcessName pidgin* -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs
