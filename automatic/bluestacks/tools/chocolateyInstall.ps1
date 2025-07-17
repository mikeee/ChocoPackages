$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://ak-build.bluestacks.com/public/app-player/windows/nxt/5.14.21.1004/26a5440b147b9f4dd572002e7cb38f05/FullInstaller/x86/BlueStacksFullInstaller_5.14.21.1004_x86_native.exe'
    checksum      = '4dc31833443d161a1b6266b4a85ebc816653c1b697613207d925ea383106873f'
    checksumType  = 'sha256'
    url64         = 'https://ak-build.bluestacks.com/public/app-player/windows/nxt/5.22.91.1029/ecc188d15e2d9bda64e7812a2b4d75e4/FullInstaller/x64/BlueStacksFullInstaller_5.22.91.1029_amd64_native.exe'
    checksum64    = 'd15f8ff85698467be35d3ef997985f0d74effb387090a9748c6b0f614ad53db2'
    checksumType64= 'sha256'
    fileType      = 'EXE'
    silentArgs    = '-s'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
