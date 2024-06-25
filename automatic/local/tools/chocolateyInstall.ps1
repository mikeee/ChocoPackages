$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://cdn.localwp.com/releases-stable/9.0.4+6699/local-9.0.4-windows.exe'
    checksum       = 'b2d1263fceca500ef3aaa99ea3b05c5a80ee008dc1bf434dd757a28c34d1ea5b'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
