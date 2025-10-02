$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://securedownloads.superantispyware.com/SUPERAntiSpyware.exe'
    checksum      = '9fd28261df28ef243aa5d936c0731523c5f85465c40195893cf56660d5b1116f'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/SILENT /ALLUSERS'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
