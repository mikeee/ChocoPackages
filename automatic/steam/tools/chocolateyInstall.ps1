$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://media.steampowered.com/client/installer/SteamSetup.exe'
    checksum 	  = '3B616CB0BEAACFFB53884B5BA0453312D2577DB598D2A877A3B251125FB281A1'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Stop-Process -ProcessName "steam*" -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs
