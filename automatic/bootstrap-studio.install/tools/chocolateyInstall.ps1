$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://bootstrapstudio.io/releases/desktop/6.0.2/Bootstrap%20Studio.exe'
    checksum       = 'ee15e9746b003d6d4c8d95862d2648b8fb234c674633edc931dc6329b5fa846d'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
