$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://netcologne.dl.sourceforge.net/project/pidgin/Pidgin/2.14.1/pidgin-2.14.1-offline.exe'
    checksum 		  = 'a9125e18ae7e219c01137a36e4c7379e1606f5db8fe7de223e3d67e8c1b533fc'
    checksumType 	= 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Stop-Process -ProcessName pidgin* -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs
