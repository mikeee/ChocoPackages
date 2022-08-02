$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://dl.emsisoft.com/EmsisoftEmergencyKit.exe'
    checksum      = '5c38a0ef6ac4e023862483b8f6da60be03a9da624aa475b8035e879df9d481b4'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/s'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
