$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://cdn.localwp.com/releases-stable/6.6.1+6281/local-6.6.1-windows.exe'
    checksum       = 'dc55e44c8b92b20e0e68beffdc3bb15c38c7e91a260d0cc46422ca11e48e8b7d'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
