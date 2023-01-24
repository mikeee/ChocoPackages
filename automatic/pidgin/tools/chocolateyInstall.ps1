$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://sourceforge.net/projects/pidgin/files/Pidgin/2.14.12/pidgin-2.14.12-offline.exe/download'
    checksum 		  = '36803ca9ff708df4c07d3de7bc8a8ec6f510e37d350082840302aa7938a7ed9b'
    checksumType 	= 'sha256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Stop-Process -ProcessName pidgin* -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs
