$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://releases.bootstrapstudio.io/7.1.2/Bootstrap%20Studio%20-%20Setup.exe'
    checksum       = 'c73ea223af0fd256c2ecc21e4d88619d4c14a1125f859621e5e0382269a75e77'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
