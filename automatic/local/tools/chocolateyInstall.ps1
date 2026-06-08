$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://cdn.localwp.com/releases-stable/10.1.1+6939/local-10.1.1-windows.exe'
    checksum       = 'd7498321f9892ab1add028741b3aabd868798bc544e2b23f07d1ae1ab53eab84'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
