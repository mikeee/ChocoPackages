$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://cdn.localwp.com/releases-stable/6.6.0+6231/local-6.6.0-windows.exe'
    checksum       = 'cee0cecd7a8cb7d01cdd39862171c210f0af5a79a037ec7ca92841e997318692'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
