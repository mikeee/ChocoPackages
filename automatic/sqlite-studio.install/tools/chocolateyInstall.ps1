$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://github.com/pawelsalawa/sqlitestudio/releases/download/3.4.17/sqlitestudio-3.4.17-windows-x86-installer.exe'
    url64          = 'https://github.com/pawelsalawa/sqlitestudio/releases/download/3.4.17/sqlitestudio-3.4.17-windows-x64-installer.exe'
    checksum 	   = '29a50c3ed5ca11c72445d558848b4934ee348a6ada84b70736f256e1f68c514a'
    checksumType   = 'SHA256'
    checksum64 	   = '5018ea571c2a3416944267d387cb75eea99d46ebd010f6aa5c35df1f7690c894'
    checksumType64 = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '--mode unattended --install_for all'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
