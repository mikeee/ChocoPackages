$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://cdn.localwp.com/releases-stable/9.2.8+6882/local-9.2.8-windows.exe'
    checksum       = '1844bf9698a66e78533da8c4bb60d8a760b402c75c22eb0a6489e44b435f91f3'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
