$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://github.com/pawelsalawa/sqlitestudio/releases/download/3.4.19/sqlitestudio-3.4.19-windows-x86-installer.exe'
    url64          = 'https://github.com/pawelsalawa/sqlitestudio/releases/download/3.4.19/sqlitestudio-3.4.19-windows-x64-installer.exe'
    checksum 	   = '1977672c943182101553fc9ee7dfe07e9f26196ffd0cb8e11c610406cdbc4b1c'
    checksumType   = 'SHA256'
    checksum64 	   = '55e390949884c52a51b32f474632393bbd115856be03bade3cf2c6057a2267a5'
    checksumType64 = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '--mode unattended --install_for all'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
