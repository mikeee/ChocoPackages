$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://cdn.localwp.com/releases-stable/9.1.1+6738/local-9.1.1-windows.exe'
    checksum       = '2f952dcfba083ed76eb1d43abd6f37cc1a38662c91f7d3eea64bb644957053c6'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
