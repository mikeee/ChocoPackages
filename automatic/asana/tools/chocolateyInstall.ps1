$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName     = $env:ChocolateyPackageName
    url             = 'https://desktop-downloads.asana.com/win32_ia32/prod/latest/AsanaSetup.exe'
    checksum        = '9c1ea0151687bc6f6fb5548fb2770a6140350f5caf31cbd423d95b5d242e0fa5'
    checksumType    = 'SHA256'
    url64           = 'https://desktop-downloads.asana.com/win32_x64/prod/latest/AsanaSetup.exe'
    checksum64      = 'fcbf7b315356f90534b28451db78c4b1c8ab54a0c1c7d467bc277d256f253536'
    checksumType64  = 'SHA256'
    fileType        = 'EXE'
    silentArgs      = '--silent'
    validExitCodes  = @(0)
}

Install-ChocolateyPackage @packageArgs
