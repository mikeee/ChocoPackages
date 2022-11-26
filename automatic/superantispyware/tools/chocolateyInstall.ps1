$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = ''
    checksum      = ''
    checksumType  = 'sha256'
    fileType      = 'EXE'
    silentArgs    = '/SILENT /ALLUSERS'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
