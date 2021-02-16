$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://bootstrapstudio.io/releases/desktop/5.5.1/Bootstrap%20Studio.exe'
    checksum       = '2b6d1124f6a21ba5537a943c7b1a761d4ff35a45710bf0aa06da38bbb64e6d40'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
