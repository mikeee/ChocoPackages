$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://bootstrapstudio.io/releases/desktop/5.4.1/Bootstrap%20Studio.exe'
    checksum       = '247480a363358c3df8e401f1168412c4c6328b7ca577090e9afd9a7685d62ee8'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
