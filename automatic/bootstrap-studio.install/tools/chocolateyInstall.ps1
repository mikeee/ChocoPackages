$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://releases.bootstrapstudio.io/7.1.1/Bootstrap%20Studio%20-%20Setup.exe'
    checksum       = 'fa02eedb9b8e3a2ecc9671dd3033524907a989dc5c7f08d8db0bebb5be939591'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
