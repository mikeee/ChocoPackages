$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://ak-build.bluestacks.com/public/app-player/windows/nxt/5.14.21.1004/26a5440b147b9f4dd572002e7cb38f05/FullInstaller/x86/BlueStacksFullInstaller_5.14.21.1004_x86_native.exe'
    checksum      = '4dc31833443d161a1b6266b4a85ebc816653c1b697613207d925ea383106873f'
    checksumType  = 'sha256'
    url64         = 'https://ak-build.bluestacks.com/public/app-player/windows/nxt/5.21.201.1029/802ebd388b824281c902ef8a3d8fae98/FullInstaller/x64/BlueStacksFullInstaller_5.21.201.1029_amd64_native.exe'
    checksum64    = '2df68388bc467f718e636362eee2fafbe7fb9b836d6b16d67e875981a0c51ba6'
    checksumType64= 'sha256'
    fileType      = 'EXE'
    silentArgs    = '-s'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
