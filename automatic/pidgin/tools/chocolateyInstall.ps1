$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://sourceforge.net/projects/pidgin/files/Pidgin/2.14.10/pidgin-2.14.10-offline.exe/download'
    checksum 		  = 'cef536d6509ae3e1c12a17f17ed21aef12199a01f1de34242b064c2903e7a2bc'
    checksumType 	= 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Stop-Process -ProcessName pidgin* -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs
