$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://securedownloads.superantispyware.com/SUPERAntiSpyware.exe'
    checksum      = 'dfd2174e94e5c3d10337ba129503910f49cadd170ebc48f6d92a4b45da282ee4'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/SILENT /ALLUSERS'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
