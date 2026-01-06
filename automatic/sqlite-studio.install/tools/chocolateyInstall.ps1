$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://github.com/pawelsalawa/sqlitestudio/releases/download/3.4.20/sqlitestudio-3.4.20-windows-x86-installer.exe'
    url64          = 'https://github.com/pawelsalawa/sqlitestudio/releases/download/3.4.20/sqlitestudio-3.4.20-windows-x64-installer.exe'
    checksum 	   = '250a6c9ee0a66a062f4640b4adcc670bf7f4a0a11061547dc358d225fd9030f0'
    checksumType   = 'SHA256'
    checksum64 	   = 'be90cbd17d9baa0f9c84f0a9c9034a840c2c19bf92f239dfa063a7a3bc06e976'
    checksumType64 = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '--mode unattended --install_for all'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
