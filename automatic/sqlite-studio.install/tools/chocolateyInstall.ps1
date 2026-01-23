$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://github.com/pawelsalawa/sqlitestudio/releases/download/3.4.21/sqlitestudio-3.4.21-windows-x86-installer.exe'
    url64          = 'https://github.com/pawelsalawa/sqlitestudio/releases/download/3.4.21/sqlitestudio-3.4.21-windows-x64-installer.exe'
    checksum 	   = '9de9158d54e78efb9a771be38f0a49ddbf3db4730400359f590c3f4af8240845'
    checksumType   = 'SHA256'
    checksum64 	   = 'a918515492592e1404a2d5a82da5725d968ad1f6d78d384e788dcf33bd7e3392'
    checksumType64 = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '--mode unattended --install_for all'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
