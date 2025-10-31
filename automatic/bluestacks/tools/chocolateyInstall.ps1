$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://ak-build.bluestacks.com/public/app-player/windows/nxt/5.14.21.1004/26a5440b147b9f4dd572002e7cb38f05/FullInstaller/x86/BlueStacksFullInstaller_5.14.21.1004_x86_native.exe'
    checksum      = '4dc31833443d161a1b6266b4a85ebc816653c1b697613207d925ea383106873f'
    checksumType  = 'sha256'
    url64         = 'https://ak-build.bluestacks.com/public/app-player/windows/nxt/5.22.130.1019/03f0020b47ac3b5affd5d7ea53661c44/FullInstaller/x64/BlueStacksFullInstaller_5.22.130.1019_amd64_native.exe'
    checksum64    = '695658a6b1bc138dd5a156fb5373c874941db1ab62b811f160e0c9a95e6df0c4'
    checksumType64= 'sha256'
    fileType      = 'EXE'
    silentArgs    = '-s'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
