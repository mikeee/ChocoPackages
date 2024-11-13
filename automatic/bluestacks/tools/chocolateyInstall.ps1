$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://ak-build.bluestacks.com/public/app-player/windows/nxt/5.14.21.1004/26a5440b147b9f4dd572002e7cb38f05/FullInstaller/x86/BlueStacksFullInstaller_5.14.21.1004_x86_native.exe'
    checksum      = '4dc31833443d161a1b6266b4a85ebc816653c1b697613207d925ea383106873f'
    checksumType  = 'sha256'
    url64         = 'https://ak-build.bluestacks.com/public/app-player/windows/nxt/5.21.610.1003/25343c4e28853b01095c62342d9cbc16/FullInstaller/x64/BlueStacksFullInstaller_5.21.610.1003_amd64_native.exe'
    checksum64    = '93e359cf019ad92c6120268df602776ec33a3f86abb31ab8ba4df8525d601a64'
    checksumType64= 'sha256'
    fileType      = 'EXE'
    silentArgs    = '-s'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
