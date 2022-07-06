$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://bootstrapstudio.io/releases/desktop/6.1.0/Bootstrap%20Studio.exe'
    checksum       = 'ec8cf3373ea1d9aab0f124a370d18a30f09e06c244dbb6fee25f43f96969f377'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
