$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = ''
    checksum      = ''
    checksumType  = 'sha256'
    url64         = ''
    checksum64    = ''
    checksumType64= 'sha256'
    fileType      = 'EXE'
    silentArgs    = '-s'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
