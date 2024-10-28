$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'http://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe'
    checksum 	  = '7D3654531C32D941B8CAE81C4137FC542172BFA9635F169CB392F245A0A12BCB'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Stop-Process -ProcessName "steam*" -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs
