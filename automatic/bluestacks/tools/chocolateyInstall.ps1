$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://cdn3.bluestacks.com/downloads/windows/nxt/5.11.1.1002/a7fc42682e92780335ddcabe6fd9b6e8/FullInstaller/x86/BlueStacksFullInstaller_5.11.1.1002_x86_native.exe'
    checksum      = '7d8889d3312f3624e2ad40cb7b1c4f0144205927eeea28c65c2aba7211a2ce4f'
    checksumType  = 'sha256'
    url64         = 'https://cdn3.bluestacks.com/downloads/windows/nxt/5.11.1.1002/a7fc42682e92780335ddcabe6fd9b6e8/FullInstaller/x64/BlueStacksFullInstaller_5.11.1.1002_amd64_native.exe'
    checksum64    = 'e0a0d1f346d4c75def508bdb2cda1904f7e489c90cae88142284e9a4cc5e7d4f'
    checksumType64= 'sha256'
    fileType      = 'EXE'
    silentArgs    = '-s'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
