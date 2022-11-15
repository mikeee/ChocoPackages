$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://securedownloads.superantispyware.com/SUPERAntiSpyware.exe'
    checksum      = 'blank'
    checksumType  = 'sha256'
    fileType      = 'EXE'
    silentArgs    = '/SILENT /ALLUSERS'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
