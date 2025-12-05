$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://github.com/pawelsalawa/sqlitestudio/releases/download/3.4.18/sqlitestudio-3.4.18-windows-x86-installer.exe'
    url64          = 'https://github.com/pawelsalawa/sqlitestudio/releases/download/3.4.18/sqlitestudio-3.4.18-windows-x64-installer.exe'
    checksum 	   = '83ea20b41487ad9a15eab052a5fb7fe32e874292f251dd3e02281c4a74d6178f'
    checksumType   = 'SHA256'
    checksum64 	   = '413b2e063959b4be4f1fd5f23d490b7966385810a9405d9b165ba1e4dd822a0a'
    checksumType64 = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '--mode unattended --install_for all'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
