$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://cdn.localwp.com/releases-stable/9.0.2+6676/local-9.0.2-windows.exe'
    checksum       = '078b30709eab1eba728625913ef6fb9b12b8176b0e26706c961617a6686c3286'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
