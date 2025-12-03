$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://ak-build.bluestacks.com/public/app-player/windows/nxt/5.14.21.1004/26a5440b147b9f4dd572002e7cb38f05/FullInstaller/x86/BlueStacksFullInstaller_5.14.21.1004_x86_native.exe'
    checksum      = '4dc31833443d161a1b6266b4a85ebc816653c1b697613207d925ea383106873f'
    checksumType  = 'sha256'
    url64         = 'https://ak-build.bluestacks.com/public/app-player/windows/nxt/5.22.150.1014/c6b85b9680fe708a143d721bdc7dd4e3/FullInstaller/x64/BlueStacksFullInstaller_5.22.150.1014_amd64_native.exe'
    checksum64    = '5ad80b2b1d63095d593d81f364247cbd14b2b1acd266218b62303388375e5da7'
    checksumType64= 'sha256'
    fileType      = 'EXE'
    silentArgs    = '-s'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
