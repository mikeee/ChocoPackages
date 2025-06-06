$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://releases.bootstrapstudio.io/7.1.0/Bootstrap%20Studio%20-%20Setup.exe'
    checksum       = '98cdc84564d7b6b4af78504a7ef566c9d44015e01c18740eb34b8de3a3f8b56e'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
