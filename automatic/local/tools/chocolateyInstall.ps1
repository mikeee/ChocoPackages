$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://cdn.localwp.com/releases-stable/9.1.0+6719/local-9.1.0-windows.exe'
    checksum       = '24eb841d8add91cd0d465ecd706932ebbde99ad0beb33811d507cebbff3cb000'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
