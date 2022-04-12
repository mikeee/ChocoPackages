$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://bootstrapstudio.io/releases/desktop/6.0.0/Bootstrap%20Studio.exe'
    checksum       = '16674b8b2b6dd1f1343ce05409b687fc80d695b5d8884900c01431fa2948d977'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
