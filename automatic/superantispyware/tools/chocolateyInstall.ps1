$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://securedownloads.superantispyware.com/SUPERAntiSpyware.exe'
    checksum      = 'c846095afc7a19fa7526e83b134698394db335a0d7e8c75f6cacd9a5fbd9cd5f'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/SILENT /ALLUSERS'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
