$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://cdn.localwp.com/releases-stable/9.2.6+6872/local-9.2.6-windows.exe'
    checksum       = '64ba307c91eb85dfce37e5c3c840159f791162f1178fafbef9b06db90a7e8703'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
