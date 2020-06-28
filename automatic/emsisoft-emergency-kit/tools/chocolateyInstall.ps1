$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = ''
    checksum      = ''
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/s'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
