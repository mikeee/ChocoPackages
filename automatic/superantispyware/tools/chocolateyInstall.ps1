$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://securedownloads.superantispyware.com/SUPERAntiSpyware.exe'
    checksum      = '362d3987b29e624f3a9ca09a08b9976c0c624b34531a48e9c4e5a31608c106fb'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/SILENT /ALLUSERS'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
