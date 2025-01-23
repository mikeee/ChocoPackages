$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://netcologne.dl.sourceforge.net/project/pidgin/Pidgin/2.14.14/pidgin-2.14.14-offline.exe'
    checksum 		  = '7551389982bd9a85991df7436ca1776e68bdc057374c03e8018173e95162bc84'
    checksumType 	= 'sha256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Stop-Process -ProcessName pidgin* -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs
