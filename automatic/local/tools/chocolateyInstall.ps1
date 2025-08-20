$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://cdn.localwp.com/releases-stable/9.2.7+6877/local-9.2.7-windows.exe'
    checksum       = '2cd1440b72ddd5baf8c469c088fe5d89646a0d2d73a37c195ef0e9f4f2e01ecc'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
