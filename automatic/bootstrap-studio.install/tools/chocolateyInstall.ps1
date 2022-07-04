$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://bootstrapstudio.io/releases/desktop/6.0.3/Bootstrap%20Studio.exe'
    checksum       = '59bb0a52b5f390d02f8a14b85065f97a9de23ec1ba5693be25cda3a8fbfc4e43'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
