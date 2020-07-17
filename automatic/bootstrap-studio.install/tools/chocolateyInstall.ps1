$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://bootstrapstudio.io/releases/desktop/5.2.0/Bootstrap%20Studio.exe'
    checksum       = '5ee2ac0dd84c1d7a80aa59b296e3a1143e7b3800253845e50bd164cf6ca383f3'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
