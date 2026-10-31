$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url64          = 'https://github.com/pawelsalawa/sqlitestudio/releases/download/4.0.4/Letos-4.0.4-windows-x64-setup.exe'
    checksum64     = 'c470431db62977a1b38d27dc41ac2e593b52b2415184ce4b18e9ace90a1a41d2'
    checksumType64 = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
